use strict;
use warnings;
use Data::Dumper;
use dancer2ajax::Schema;

my $artist = schema->resultset('Artist')->search(
  {name => {like => '%Red%'}},
);
$artist->result_class('DBIx::Class::ResultClass::HashRefInflator');
to_json {data => [$artist->all] };


