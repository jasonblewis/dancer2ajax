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
#  my @rs  = resultset('Album')->search('14')->cursor->all;
  my @rs  = rset('Album')->search({
    title => {like => "%Ber%"},
  })->hri;

  to_json {data => [@rs]};
};

ajax '/time' => sub {
  my $timestr = localtime;
  to_json({"time" => $timestr});
};

ajax '/albumdbi.json' => sub {

  my $sth = database->prepare(
    'select * from Album',
  );
  $sth->execute();
  to_json({data => $sth->fetchall_arrayref});
};

get '/albums' => sub {
  template 'albums';
};

  get '/' => sub {
    template 'index';
};



true;
