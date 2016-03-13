package dancer2ajax;
use Dancer2;
#use Dancer2::Plugin::Database;
#use DBI;
#use Dancer2::Plugin::DBIC;
use Data::Dumper;


our $VERSION = '0.1';

get '/albums' => sub {
  template 'albums';
};

get '/artists' => sub {
  template 'artists';
};

get '/' => sub {
  template 'index';
};


true;
