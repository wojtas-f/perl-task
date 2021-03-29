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

sub checkForDeliveryDate{
   my ( $line ) = @_;
   #Odczytanie daty dostawy
    if($line =~ /DATA DOSTAWY/){
        if($line =~ /[0-9-]+/){ 
            $new_order->setDELIVERY_DATE($&);
        }
    }
}

sub checkForNIP{
   my ( $line ) = @_;
   #Odzczytanie numeru NIP odbiorcy
    if($line =~ /NIP/){
        if( $line =~/[0-9]+/){
            $new_order->setNIP($&);
        }
    }
}

sub checkForPayer{
   my ( $line ) = @_;
       #Odczytanie nazwy płatnika
    if($line =~ /PLATNIK/){
        if( $line =~/\b(?!PLATNIK)\b([A-Z]+\s[A-Z]+|[A-Z]+)/){
            $new_order->setPayer($&);
        }
    }
}

sub checkForPayer{
   my ( $line ) = @_;
       #Odczytanie nazwy płatnika
    if($line =~ /PLATNIK/){
        if( $line =~/\b(?!PLATNIK)\b([A-Z]+\s[A-Z]+|[A-Z]+)/){
            $new_order->setPayer($&);
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

