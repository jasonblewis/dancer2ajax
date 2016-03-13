#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use dancer2ajax;
use dancer2ajax::API;

use Plack::Builder;

builder {
  mount '/' => dancer2ajax->to_app;
  mount '/api' => dancer2ajax::API->to_app;
};

