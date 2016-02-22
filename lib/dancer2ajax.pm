package dancer2ajax;
use Dancer2;
use Dancer2::Plugin::Ajax;
use Dancer2::Plugin::Database;
use DBI;
#my $dbh = DBI->connect("dbi:SQLite:dbname=database/Chinook_Sqlite.sqlite","","");

our $VERSION = '0.1';

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
