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

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Helper::Row::ToJSON");

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


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 22:10:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SsRei7/5tjczBz2T9wQ8jg

__PACKAGE__->has_many(
  albums =>
  'dancer2ajax::Schema::Result::Album',
  'artistid'
);


1;
