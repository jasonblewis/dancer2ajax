use utf8;
package dancer2ajax::Schema::Result::Album;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Album

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Helper::Row::ToJSON");

=head1 TABLE: C<Album>

=cut

__PACKAGE__->table("Album");

=head1 ACCESSORS

=head2 albumid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'nvarchar'
  is_nullable: 0
  size: 160

=head2 artistid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "albumid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "nvarchar", is_nullable => 0, size => 160 },
  "artistid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</albumid>

=back

=cut

__PACKAGE__->set_primary_key("albumid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-19 21:49:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hFPnijECTvqkPwdRW1YQUQ


__PACKAGE__->belongs_to(
  "artist" =>
  "dancer2ajax::Schema::Result::Artist",
  "artistid"
);

__PACKAGE__->has_many(
  "tracks" =>
  "dancer2ajax::Schema::Result::Track",
  "albumid"
);


1;
