Company Designators: a dataset of international corporate designators
=====================================================================

This is a dataset compiling typical corporate entity designators that
are suffixed to the end of company names, like 'Incorporated',
'Corporation', 'Limited', etc. Both long forms and their abbreviations
are included (e.g. 'Inc.', 'Corp.', 'Ltd.', etc.)
         
The dataset is collated from:

- http://en.wikipedia.org/wiki/Types_of_business_entity

plus data seen in the wild.


Data Format
-----------

The datafile company_designator.yml file is a YAML hash/dictionary
whose entry keys are long corporate designators e.g. "Incorporated",
"Limited", "Proprietary Limited".

Each entry is a hash with (some of) the following keys:

- 'lang' (required) - a 2-character ISO639 language code e.g. en, fr, etc.

- 'abbr' (optional) - a list of zero or more abbreviations for this key
  e.g. "Inc." for "Incorporated", "Ltd." for "Limited", etc. Abbreviations
  should include periods if they are ever used e.g. L.L.C., not LLC. It is
  expected that libraries will make periods optional where appropriate.

Long corporate designator keys will be unique, but abbreviations may not 
necessarily be e.g. both English 'Incorporated' and French 'Incorporée' use
the abbreviation 'Inc.'.


LICENCE
-------

This dataset is licensed under the
[http://creativecommons.org/licenses/by-sa/3.0/](Creative Commons Attribution-Share-Alike License 3.0).
See the LICENCE file for the full licence text.

It includes material from the Wikipedia article
[Types of business entity](http://en.wikipedia.org/wiki/Types_of_business_entity),
also released under the
[http://creativecommons.org/licenses/by-sa/3.0/](Creative Commons Attribution-Share-Alike License 3.0).

