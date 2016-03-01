use utf8;
package dancer2ajax::Schema::Result::Track;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Track

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

=head1 TABLE: C<Track>

=cut

__PACKAGE__->table("Track");

=head1 ACCESSORS

=head2 trackid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 0
  size: 200

=head2 albumid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 mediatypeid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 genreid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 composer

  data_type: 'nvarchar'
  is_nullable: 1
  size: 220

=head2 milliseconds

  data_type: 'integer'
  is_nullable: 0

=head2 bytes

  data_type: 'integer'
  is_nullable: 1

=head2 unitprice

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "trackid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 0, size => 200 },
  "albumid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "mediatypeid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "genreid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "composer",
  { data_type => "nvarchar", is_nullable => 1, size => 220 },
  "milliseconds",
  { data_type => "integer", is_nullable => 0 },
  "bytes",
  { data_type => "integer", is_nullable => 1 },
  "unitprice",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
);

=head1 PRIMARY KEY

=over 4

=item * L</trackid>

=back

=cut

__PACKAGE__->set_primary_key("trackid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-25 00:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8yyng+HE7R5sicQ8yOMpDw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;