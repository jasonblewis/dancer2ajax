use utf8;
package dancer2ajax::Schema::Result::InvoiceLine;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::InvoiceLine

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

=head1 TABLE: C<InvoiceLine>

=cut

__PACKAGE__->table("InvoiceLine");

=head1 ACCESSORS

=head2 invoicelineid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 invoiceid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 trackid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 unitprice

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=head2 quantity

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "invoicelineid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "invoiceid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "trackid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "unitprice",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
  "quantity",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</invoicelineid>

=back

=cut

__PACKAGE__->set_primary_key("invoicelineid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 22:10:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8Tfew+je/bObl0JdLyQsQw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
