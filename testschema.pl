#!/usr/bin/env perl
use 5.22.1;
use warnings;
use strict;
use DBIx::Class;
use lib "/Users/jason/projects/dancer2/dancer2ajax/lib/";
use dancer2ajax::Schema;
use Data::Dumper;

my $schema = dancer2ajax::Schema->connect('dbi:SQLite:database/Chinook_Sqlite.sqlite');


say "hello world";

# get one album
my $album = $schema->resultset('Album')->find(14);
printf "Album Title: %s\n", $album->title;

# search for an album by title, print first match
my $rs = $schema->resultset('Album')->search({ title => 'Muso Ko'});
$album = $rs->first;
printf "First album: %s\n", $album->title;

# search for a single artist by name and print
my $artist = $schema->resultset('Artist')->find(
  { name => 'Calexico'});

printf "Artist %s's ID is: %d\n", $artist->name,$artist->id;

# get all the albums that belong to an artist and print the album and tracks
my $artistsalbums = $schema->resultset('Artist')->find(
  { name => 'U2'})->albums;

while (my $album = $artistsalbums->next) {
  printf "album: %s\n", $album->title;
  my $tracks = $album->tracks;
  while (my $track = $tracks->next) {
#    my $mediatype = $track->mediatype->get_column('name'); # works but
    my $mediatype = $track->mediatype->name; # also works!
    printf "    Track %d: %s is %s\n", $track->trackid, $track->name,$mediatype;
  }

};

# custom resultset methods, find long and short tracks
my $longtracks = $schema->resultset('Track')->long();
while (my $longtrack = $longtracks->next) {
  printf "long track: %s is %d seconds long\n",$longtrack->name, $longtrack->milliseconds/1000;
};

my $shorttracks = $schema->resultset('Track')->short();
while (my $shorttrack = $shorttracks->next) {
  printf "short track: %s is %d seconds long\n",$shorttrack->name, $shorttrack->milliseconds/1000;
};

# just get 2 rows of short tracks
$shorttracks = $schema->resultset('Track')->short()->rows(2);
say "get 2 short tracks";
while (my $shorttrack = $shorttracks->next) {
  printf "short track: %s is %d seconds long\n",$shorttrack->name, $shorttrack->milliseconds/1000;
};

# test hri shortcut, get short tracks, as hri, then dump their values
$shorttracks = $schema->resultset('Track')->short()->hri;
say "get short tracks and hri";

while (my $hashref = $shorttracks->next) {
  print Dumper($hashref);
}

$album = $schema->resultset('Album')->find(14);
printf "Album Title: %s\n", $album->title;

my @rs = $schema->resultset('Album')->search({ title => 'Muso Ko'})->hri;
print Dumper(@rs);

# search for artists and return the artist and their albums
say "search for artists and return the artist and their albums";
my $artists = $schema->resultset('Artist')->search({
  name => {like => '%le%'}
},
{
  join     => 'albums',
  prefetch => 'albums',
});

while (my $artist = $artists->next) {
    printf "artist: %s album: %s\n", $artist->name, $artist->albums->title;
};

#print Dumper($shorttracks);

# while (my $shorttrack = $shorttracks->next) {
#   printf "short track: %s is %d seconds long\n",$shorttrack->name, $shorttrack->milliseconds/1000;
# };

