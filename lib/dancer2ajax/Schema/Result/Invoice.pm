use utf8;
package dancer2ajax::Schema::Result::Invoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Invoice

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

=head1 TABLE: C<Invoice>

=cut

__PACKAGE__->table("Invoice");

=head1 ACCESSORS

=head2 invoiceid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 customerid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 invoicedate

  data_type: 'datetime'
  is_nullable: 0

=head2 billingaddress

  data_type: 'nvarchar'
  is_nullable: 1
  size: 70

=head2 billingcity

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingstate

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingcountry

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingpostalcode

  data_type: 'nvarchar'
  is_nullable: 1
  size: 10

=head2 total

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "invoiceid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "customerid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "invoicedate",
  { data_type => "datetime", is_nullable => 0 },
  "billingaddress",
  { data_type => "nvarchar", is_nullable => 1, size => 70 },
  "billingcity",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingstate",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingcountry",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingpostalcode",
  { data_type => "nvarchar", is_nullable => 1, size => 10 },
  "total",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
);

=head1 PRIMARY KEY

=over 4

=item * L</invoiceid>

=back

=cut

__PACKAGE__->set_primary_key("invoiceid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 22:10:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vl8DJCEvXEu920Jpl8XqmQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
