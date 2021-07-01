#!/usr/bin/env perl

use Test::More 0.88;
use FindBin qw($Bin);
use YAML qw(LoadFile);
use Locales;
use Data::Dump qw(dd pp dump);

my %embedded_period_exception = map { $_ => 1 }
  'N.V. Nv',
;

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

for my $long (sort keys %$data) {
  # lang attribute is required
  ok($data->{$long}->{lang}, "entry for '$long' has 'lang' attribute");
  # lang attribute must be an ISO639 code
  ok($lang{ $data->{$long}->{lang} }, "lang for '$long' is valid ISO639 code: $data->{$long}->{lang}");
  # only allow permitted entry keys
  my @bad = grep ! /^(lang|abbr|abbr_std|doc|lead)$/, keys %{ $data->{$long} };
  ok(@bad == 0, @bad ? ("bad keys found for '$long': " . join(',',@bad)) : "no bad keys found for '$long'");
  # abbreviations that contain a period should finish with one
  if (my $abbr_set = $data->{$long}->{abbr}) {
    my @abbr = ref $abbr_set ? @$abbr_set : ( $abbr_set );
    for my $abbr (@abbr) {
      next if $embedded_period_exception{$abbr};
      if ($abbr =~ m/\.\w/) {
        ok(substr($abbr,-1) eq '.', "abbr for '$long' contains embedded period and terminates with one: $abbr");
      }
    }
  }
}

done_testing;

