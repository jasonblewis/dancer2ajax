package dancer2ajax::API::Artists;

use Dancer2 appname => 'dancer2ajax::API';
use Dancer2::Plugin::DBIC;

# curl http://localhost:5000/api/artists/573
sub read_one {
  my $artistid = route_parameters->get('artistid');
  my $rs = schema->resultset('Artist')->find($artistid);
  return {data => [$rs->get_columns]} 
};

sub read_many {
  my $artistid = route_parameters->get('artistid');
  my $rs = schema->resultset('Artist')->hri;
  return {data => [$rs->all]} 
};

# curl -v --data '{"name":"Tool"}' localhost:5000/api/artists
sub create {
  
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


sub update {
  
  my $artistid = route_parameters->get('artistid');
  my $name = body_parameters->get('name');
  
  try {  
    my $new_artist_rs = schema->resultset('Artist')->update_or_create({
      artistid => $artistid,
      name => $name,
    });
    status 204;
    return undef;
  } catch {
    my $exception = $_;
    warn "ERROR: $exception";
    status 409;
    return {error => "$exception"};
  };
};


sub remove { # delete but that name clashes with perl's delete
  # delete should be indempotent, so only try and delete if the record exists
  my $artistid = route_parameters->get('artistid');
  
  try {  
    if (my $artist = schema->resultset('Artist')->find({
      artistid => $artistid,
    })) {
      $artist->delete;
    }
    status 204;
    return undef;
  } catch {
    my $exception = $_;
    warn "ERROR: $exception";
    status 409;
    return {error => "$exception"};
  };
}


prefix '/artists' => sub {
  get '/:artistid' => \&read_one;
  get ''           => \&read_many;
  post ''          => \&create;
  put '/:artistid' => \&update;
  del '/:artistid' => \&remove;
};


1;
