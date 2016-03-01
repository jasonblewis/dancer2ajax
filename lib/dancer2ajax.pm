package dancer2ajax;
use Dancer2;
use Dancer2::Plugin::Ajax;
use Dancer2::Plugin::Database;
use DBI;
use Dancer2::Plugin::DBIC;
#use dancer2ajax::Schema;
use Data::Dumper;

#my $dbh = DBI->connect("dbi:SQLite:dbname=database/Chinook_Sqlite.sqlite","","");

our $VERSION = '0.1';

ajax '/album.json' => sub {
  my $rs  = resultset('Album')->find('14')->hri;

#  $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  #print Dumper($rs);
  to_json {data => [$rs]};
};

# ajax '/artist.json' => sub {
#   my $artist = schema->resultset('Artist')->search(
#     {name => {like => '%Red%'}},
#   );
#   $artist->result_class('DBIx::Class::ResultClass::HashRefInflator');
#   to_json {data => [$artist->all] };
# };

# ajax '/artistalbum.json' => sub {
#   my $artist = schema->resultset('Artist')->search(
#     {name => {like => '%Red%'}},
#     {join => 'albums',
#      '+select' => ['albums.Title'],
#      order_by => ['Name'],
#     },
#   );
#   $artist->result_class('DBIx::Class::ResultClass::HashRefInflator');
#   to_json {data => [$artist->all] };
# };

ajax '/time' => sub {
  my $timestr = localtime;
  to_json({"time" => $timestr});
};

ajax '/random.json' => sub {
  #  to_json(map { rand } ( 1..100 ));

  my $sth = database->prepare(
    'select * from Album',
  );
  $sth->execute();
#  $sth->execute(params->{id});
  to_json({data => $sth->fetchall_arrayref});
};



get '/table' => sub {
  template 'table';
};

  get '/' => sub {
    template 'index';
};



true;
