use utf8;
package dancer2ajax::Schema::ResultSet::Track;

use base 'dancer2ajax::ResultSetBase';

# see https://metacpan.org/pod/distribution/DBIx-Class/lib/DBIx/Class/Manual/Cookbook.pod#Predefined-searches
sub long {
   my $self = shift;
   $self->search({
      $self->current_source_alias . '.milliseconds' => { '>=' => 2863571 }
   })
};

sub short {
   my $self = shift;
   $self->search({
      $self->current_source_alias . '.milliseconds' => { '<=' => 41900 }
   })
};

1;
