use utf8;
package dancer2ajax::Schema::Result::PlaylistTrack;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::PlaylistTrack

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

=head1 TABLE: C<PlaylistTrack>

=cut

__PACKAGE__->table("PlaylistTrack");

=head1 ACCESSORS

=head2 playlistid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 trackid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "playlistid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "trackid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</playlistid>

=item * L</trackid>

=back

=cut

__PACKAGE__->set_primary_key("playlistid", "trackid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-19 21:49:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:02QgFQtSbIebH6wbZ8yV1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
