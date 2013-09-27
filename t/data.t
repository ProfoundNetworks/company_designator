#!/usr/bin/env perl

use Test::More 0.88;
use FindBin qw($Bin);
use YAML qw(LoadFile);
use Locales;
use Data::Dump qw(dd pp dump);

# Allow utf8 in output
binmode(\*STDOUT, ':utf8');
my $builder = Test::More->builder;
binmode $builder->output,         ":utf8";
binmode $builder->failure_output, ":utf8";
binmode $builder->todo_output,    ":utf8";

my %lang = map { $_ => 1 } Locales->new->get_language_codes;
my ($data);

ok($data = LoadFile("$Bin/../company_designator.yml"), 'data load ok');
ok(keys %$data > 0, 'multiple data keys');
#dd $data;

for my $key (sort keys %$data) {
  # lang attribute is required
  ok($data->{$key}->{lang}, "entry for '$key' has 'lang' attribute");
  # lang attribute must be an ISO639 code
  ok($lang{ $data->{$key}->{lang} }, "lang for '$key' is valid ISO639 code: $data->{$key}->{lang}");
  # abbreviations that contain a period should finish with one
  if (my $abbr_set = $data->{$key}->{abbr}) {
    my @abbr = ref $abbr_set ? @$abbr_set : ( $abbr_set );
    for my $abbr (@abbr) {
      if ($abbr =~ m/\.\w/) {
        ok(substr($abbr,-1) eq '.', "abbr for '$key' contains embedded period and terminates with one: $abbr");
      }
    }
  }
}

done_testing;

