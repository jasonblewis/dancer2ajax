use utf8;
package dancer2ajax::Schema::Result::Artist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Artist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::Helper::ResultSet::Shortcut>

=back

=cut

__PACKAGE__->load_components("Helper::ResultSet::Shortcut");

=head1 TABLE: C<Artist>

=cut

__PACKAGE__->table("Artist");

=head1 ACCESSORS

=head2 artistid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "artistid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</artistid>

=back

=cut

__PACKAGE__->set_primary_key("artistid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-25 00:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LOiJ5yEgBg42DV/yktRp8w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->has_many(
  albums => 'dancer2ajax::Schema::Result::Album',
  'ArtistId'
);


1;
