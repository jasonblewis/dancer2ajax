package dancer2ajax::API;
use 5.22.1;
use Dancer2;
set serializer => 'JSON';
use Dancer2::Plugin::Database;
use DBI;
use Dancer2::Plugin::DBIC;
use Data::Dumper;
use Try::Tiny;

our $VERSION = '0.1';

post '/artists' => sub {
  
  my $name = body_parameters->get('name');
  
  try {  
    my $new_artist_rs = schema->resultset('Artist')->create({
      name => $name,
    });
    redirect '/api/artists/' . $new_artist_rs->artistid, 201;

  } catch {
    my $exception = $_;
    warn "ERROR: $exception";
    status 409;
    return {error => "could not create artist"};
  };
    
};


put '/artists/:artistid' => sub {
  
  my $artistid = route_parameters->get('artistid');
  my $name = body_parameters->get('name');
  
  try {  
    my $new_artist_rs = schema->resultset('Artist')->create({
      artistid => $artistid,
      name => $name,
    });
      return {data => {
    $new_artist_rs->get_columns}}
  } catch {
    #warn "could not create artist as $artistid already exists";
    status 409;
    return {error => "could not create artist"};
  };
    
};


post '/artist.json' => sub {
  #print Dumper (body_parameters);

  my $name = body_parameters->get('name');
  my $artistid = body_parameters->get('artistid');
  
  my $new_artist_rs = schema->resultset('Artist')->create({
    artistid => $artistid,
    name => $name,
  });
  

  #say "found or created artist name: ", $new_artist_rs->name;
   return {data => {
     $new_artist_rs->get_columns}}
#   Dancer2::Core::HTTP->status(409);
    
};

get '/artists/:artistid' => sub {
  my $artistid = route_parameters->get('artistid');
  my $rs = schema->resultset('Artist')->find(
  {artistid => $artistid});
  return {data => [$rs->all]} 
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
