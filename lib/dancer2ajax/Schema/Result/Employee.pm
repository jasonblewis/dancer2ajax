use utf8;
package dancer2ajax::Schema::Result::Employee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

dancer2ajax::Schema::Result::Employee

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

=head1 TABLE: C<Employee>

=cut

__PACKAGE__->table("Employee");

=head1 ACCESSORS

=head2 employeeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 lastname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 20

=head2 firstname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 20

=head2 title

  data_type: 'nvarchar'
  is_nullable: 1
  size: 30

=head2 reportsto

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 birthdate

  data_type: 'datetime'
  is_nullable: 1

=head2 hiredate

  data_type: 'datetime'
  is_nullable: 1

=head2 address

  data_type: 'nvarchar'
  is_nullable: 1
  size: 70

=head2 city

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 state

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 country

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 postalcode

  data_type: 'nvarchar'
  is_nullable: 1
  size: 10

=head2 phone

  data_type: 'nvarchar'
  is_nullable: 1
  size: 24

=head2 fax

  data_type: 'nvarchar'
  is_nullable: 1
  size: 24

=head2 email

  data_type: 'nvarchar'
  is_nullable: 1
  size: 60

=cut

__PACKAGE__->add_columns(
  "employeeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "lastname",
  { data_type => "nvarchar", is_nullable => 0, size => 20 },
  "firstname",
  { data_type => "nvarchar", is_nullable => 0, size => 20 },
  "title",
  { data_type => "nvarchar", is_nullable => 1, size => 30 },
  "reportsto",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "birthdate",
  { data_type => "datetime", is_nullable => 1 },
  "hiredate",
  { data_type => "datetime", is_nullable => 1 },
  "address",
  { data_type => "nvarchar", is_nullable => 1, size => 70 },
  "city",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "state",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "country",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "postalcode",
  { data_type => "nvarchar", is_nullable => 1, size => 10 },
  "phone",
  { data_type => "nvarchar", is_nullable => 1, size => 24 },
  "fax",
  { data_type => "nvarchar", is_nullable => 1, size => 24 },
  "email",
  { data_type => "nvarchar", is_nullable => 1, size => 60 },
);

=head1 PRIMARY KEY

=over 4

=item * L</employeeid>

=back

=cut

__PACKAGE__->set_primary_key("employeeid");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-01 14:41:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eZmyOTdwKbex7Em3gB6O7Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
