package dancer2ajax::API::Artists;

use Dancer2 appname => 'dancer2ajax::API';
use Dancer2::Plugin::DBIC;

# curl http://localhost:5000/api/artists/573
get '/artists/:artistid' => sub {
  my $artistid = route_parameters->get('artistid');
  my $rs = schema->resultset('Artist')->find($artistid);
  return {data => [$rs->get_columns]} 
};

# curl -v --data '{"name":"Tool"}' localhost:5000/api/artists
post '/artists' => sub {
  
  my $name = body_parameters->get('name');
  
  try {  
    my $new_artist_rs = schema->resultset('Artist')->create({
      name => $name,
    });
    redirect '/artists/' . $new_artist_rs->artistid, 201;

  } catch {
    my $exception = $_;
    warn "ERROR: $exception";
    status 409;
    return {error => "$exception"};
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

1;
