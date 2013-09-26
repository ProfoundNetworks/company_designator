Corporate Designators: a dataset of international corporate designators
=======================================================================

This is a dataset compiling typical corporate entity designators that
are suffixed to the end of corporate names, like 'Incorporated',
'Corporation', 'Limited', etc. Both long forms and their abbreviations
are included (e.g. 'Inc.', 'Corp.', 'Ltd.', etc.)
         
The dataset is collated from:

- http://en.wikipedia.org/wiki/Types_of_business_entity


Data Format
-----------

The datafile company_designator.yml file is a YAML hash/dictionary
whose entry keys are long corporate designators e.g. "Incorporated",
"Limited", "Proprietary Limited".

Each entry is a hash with some of the following keys:

- 'lang' (required) - a 2-character ISO639 language code e.g. en, fr, etc.

- 'abbr' (optional) - a set of zero or more abbreviations for this key
  e.g. "Inc." for "Incorporated", "Ltd." for "Limited", etc. Abbreviations
  should include periods if they are ever used e.g. L.L.C., not LLC. It is
  expected that libraries will make periods optional where appropriate.

Note that while the long corporate designator keys will be unique,
abbreviations sometimes will not be.



