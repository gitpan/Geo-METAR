#!/usr/bin/perl

# $Id: simple_dump.pl,v 1.2 1998/06/28 02:39:05 jzawodn Exp $

# Example script for METAR.pm.

use METAR;

my $m = new METAR;
$m->metar("KFDY 251450Z 21012G21KT 8SM OVC065 04/M01 A3010 RMK 57014");
$m->dump;
exit;
