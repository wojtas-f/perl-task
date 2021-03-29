#!/usr/bin/perl

use strict;
use autodie; # die if problem reading or writing a file
use lib 'lib';
use Order;

my $MANUFACTURER = '';

sub checkForManufacturer {
   my ( $line ) = @_;

   #Odczytanie nazwy prducenta
    if($line =~/\*+/){
        if($line =~ /(?!\*)\b(?!ZAMOWIENIA)\b[A-Z]+/){
            $MANUFACTURER = $&;
        }
    }
}

sub checkForOrderNumber{
   my ( $line ) = @_;
       if($line =~ /NR ZAMOWIENIE/){
        if( $line =~/[0-9]+/){
         $new_order->setORDER_NUMBER($&);
        }
    }
}

sub parseLineFromFile {
   my ( $line ) = @_;
   if ($MANUFACTURER eq "")
   {
      checkForManufacturer($line);
   }
   checkForOrderNumber($line);
}

my $new_order = new Order();

open(FILE, "zamowienia.eml");
while (<FILE>) {
   parseLineFromFile($_)
}


close FILE;

