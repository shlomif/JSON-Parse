#!/home/ben/software/install/bin/perl
use warnings;
use strict;
use lib 'blib/lib';
use lib 'blib/arch';
use JSON::Parse;

my $bytes = 0;
my $count = 0;
while ($bytes < 1e7) {
    $count++;
    print "Test $count: $bytes bytes so far\n";
    $bytes += JSON::Parse::random_json ();
}

print "A total of $bytes bytes of random JSON was checked for validity.\n";
