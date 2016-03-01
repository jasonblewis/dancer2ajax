use utf8;
package dancer2ajax::Schema::Result::Genre;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Genre

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=cut

__PACKAGE__->load_components("Helper::Row::ToJSON");

=head1 TABLE: C<Genre>

=cut

__PACKAGE__->table("Genre");

=head1 ACCESSORS

=head2 genreid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "genreid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</genreid>

=back

=cut

__PACKAGE__->set_primary_key("genreid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 16:04:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:72QO+mQs6wcd2Qh/EwB09Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
