#!/usr/bin/perl

# $Id: test.pl,v 1.5 1998/10/28 03:05:30 jzawodn Exp $

# Test script for METAR installation.

use Geo::METAR;

my %tally = (passed => 0, failed => 0, skipped => 0);

print "Testing METAR.\n";

my $m = new Geo::METAR;

# Create a new instance.

if ($m) {
    print Pad("Creation","passed");
} else {
    print Pad("Creation","failed");
}

# Set to a given user.

if ($m->metar("KFDY 251450Z 21012G21KT 8SM OVC065 04/M01 A3010 RMK 57014")) {
    print Pad("metar","passed");
} else {
    print Pad("metar","failed");
}

if ($m->SITE eq "KFDY") {
  print Pad("SITE","passed");
} else {
  print Pad("SITE","failed");
}

if ($m->DATE eq "25") {
  print Pad("DATE","passed");
} else {
  print Pad("DATE","failed");
}

if ($m->MOD eq "AUTO") {
  print Pad("MOD","passed");
} else {
  print Pad("MOD","failed");
}

if ($m->F_TEMP eq "39.2") {
  print Pad("F_TEMP","passed");
} else {
  print Pad("F_TEMP","failed");
}
 

# summary

print "\n";
print "$tally{passed} tests passed.\n";
print "$tally{skipped} tests skipped.\n";
print "$tally{failed} tests failed.\n";

if ($tally{skipped}) {

print<<EOMS01;

At least one test was skipped. This is probably ok. It
is usually the result of wanting to test parts of METAR
which require stuff that you don't have.

EOMS01

}

if ($tally{failed}) {

print<<EOMF01;

At least one test failed. That's not supposed to happen.
Please contact the author for help or try to fix it
yourself if you feel ambitious.

You *can* still use this module without fixing the problem(s),
but I really don't recommend it.

EOMF01

}

exit;

sub Pad {
  my $string = shift;
  my $type = shift;
  my $length = length($string);
  for($length..22) {
    $string .= ".";
  }
  $string .= "$type.\n";
  $tally{$type}++;
  return $string;
}


