package dancer2ajax::ResultSetBase;

use base 'DBIx::Class::ResultSet';

__PACKAGE__->load_components(qw{Helper::ResultSet::Shortcut});

1;
