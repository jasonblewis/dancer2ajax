package dancer2ajax::API;
use 5.22.1;
use Dancer2;
set serializer => 'JSON';
use Dancer2::Plugin::Database;
use DBI;
use Dancer2::Plugin::DBIC;
use Data::Dumper;


our $VERSION = '0.1';

post '/artist.json' => sub {
  print Dumper (body_parameters);
  my $name = body_parameters->get('name');

  say "artist name: ", $name;
  return {abc => '123'}
};

  
get '/artist.json' => sub {
  my $rs = schema->resultset('Artist')->hri->rows(10);
  return {data => [$rs->all]} 
};


get '/album.json' => sub {
  my @rs  = rset('Album')->search({
    title => {like => "%Ber%"},
  })->hri;

  return {data => [@rs]};
};


get '/time.json' => sub {
  my $timestr = localtime;
  return {"time" => $timestr};
};

get '/albumdbi.json' => sub {

  my $sth = database->prepare(
    'select * from Album',
  );
  $sth->execute();
  return {data => $sth->fetchall_arrayref};
};


true;
