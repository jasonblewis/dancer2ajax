use strict;
use warnings;

use LWP::UserAgent;
use LWP::Protocol::PSGI;

use Test::More tests => 5;
use Test::WWW::Mechanize;
use_ok 'dancer2ajax';

my $psgi_app = dancer2ajax->to_app;

isa_ok ($psgi_app, 'CODE');

LWP::Protocol::PSGI->register($psgi_app);

my $mech = Test::WWW::Mechanize->new;
$mech->get_ok("http://localhost/"); # $my_psgi_app runs
$mech->title_is("dancer2ajax","make sure we are on the right page");

$mech->get_ok("http://localhost/albums", "test albums url"); # $my_psgi_app runs
