#!/usr/bin/perl

use strict;
use autodie; # die if problem reading or writing a file
use lib 'lib';
use Order;

 open(FILE, "zamowienia.eml");
 while (<FILE>) {
   print $_;
 }

 my $new_order = new Order( "UNIMA SP. Z O.O.", "|3827467");
print 'New order';
print $new_order->getMANUFACTURER();

 close FILE;