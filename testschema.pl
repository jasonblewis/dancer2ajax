#!/usr/bin/env perl
use 5.22.1;
use warnings;
use strict;
use DBIx::Class;
use lib "/Users/jason/projects/dancer2/dancer2ajax/lib/";
use dancer2ajax::Schema;

my $schema = dancer2ajax::Schema->connect('dbi:SQLite:database/Chinook_Sqlite.sqlite');


say "hello world";

my $album = $schema->resultset('Album')->find(14);
printf "Album Title: %s\n", $album->title;

my $rs = $schema->resultset('Album')->search({ title => 'Muso Ko'});
$album = $rs->first;
printf "First album: %s\n", $album->title;

my $artist = $schema->resultset('Artist')->find(
  { name => 'Calexico'});

printf "artist name: %s\n", $artist->name;


my $artistsalbums = $schema->resultset('Artist')->find(
  { name => 'Calexico'})->albums;
my $album = $artistsalbums->first;

printf "artists first album: %s\n", $album->title;

# my $fredsbooks = $schema->resultset('Author')->find(
#  { Name => 'Fred' })->books;





# $rs = $schema->resultset('Artist')->search(
#   { name => 'Calexico',
#   },
#   { join    => 'albums',
#     '+select' => ['album.title'],}
# );
# my $artist = $rs->first;
# printf "artist first album: %s\n", $rs->get_column('Title');


