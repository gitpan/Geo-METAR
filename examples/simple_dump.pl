#!/usr/bin/perl

# $Id: simple_dump.pl,v 1.2 1999/11/19 00:10:57 jzawodn Exp $

# Example script for METAR.pm.

use Geo::METAR;

my $m = new Geo::METAR;
$m->metar("KFDY 251450Z 21012G21KT 8SM OVC065 04/M01 A3010 RMK 57014");
$m->dump;
exit;
