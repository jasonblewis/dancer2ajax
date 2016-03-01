use utf8;
package dancer2ajax::Schema::Result::MediaType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::MediaType

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

=head1 TABLE: C<MediaType>

=cut

__PACKAGE__->table("MediaType");

=head1 ACCESSORS

=head2 mediatypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "mediatypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</mediatypeid>

=back

=cut

__PACKAGE__->set_primary_key("mediatypeid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 16:04:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BUI7whtvIRhTDimj63vt0g

__PACKAGE__->has_many("tracks" =>
                        "dancer2ajax::Schema::Result::Track",
                      "mediatypeid"
                    );

1;
