#!/usr/bin/perl

use strict;
use autodie; # die if problem reading or writing a file
use lib 'lib';
use Order;
use Item;

my $MANUFACTURER = '';
my $current_order = new Order();
my @current_item_list = ();
my $shortPath = 'c:\Users\wojta\Desktop\perl\zadanie\orders\\';

sub checkForManufacturer {
   my ( $line ) = @_;

   #Odczytanie nazwy prducenta
    if($line =~/\*+/){
        if($line =~ /(?!\*)\b(?!ZAMOWIENIA)\b[A-Z]+/){
            $MANUFACTURER = $&;
        }
    }
}  

sub exportToCSV {
   my $filename = $MANUFACTURER . '_' . $current_order->getOrderNumber() . '.csv';
   my $savePath = $shortPath . $filename;

   open(NEW_ORDER_FILE,'>',$savePath) or die $!;
   print NEW_ORDER_FILE $current_order->print();
   foreach (@current_item_list) {
      print NEW_ORDER_FILE $_->print();
	}

   close(NEW_ORDER_FILE);

   $current_order = new Order();
   @current_item_list = ();
}

sub setNewItem {
    my ( $line ) = @_;
    my $new_item = new Item();
        #Odczytanie numeru EAN
        if($line =~/(?![0-9]\|)(?![0-9]\.[0-9]+)(?![0-9]+\|)([0-9]+)/){
            $new_item->setEAN($&);
        }
        #Odczytanie ilości towaru
        if($line =~ /[0-9]+\.[0-9]+/){
            $new_item->setQUANTITY($&);
        }
        #Odczytanie nazwy produktu
        if($line =~ /([A-Za-z]+\s)+/){
            $new_item->setNAME($&);
        }
        #Odczytanie jedsnotki miary
        if($line=~/sztuka|litr|kg/){
            $new_item->setUNIT($&);
        }
   #  $current_order->setNewItem($new_item);
    push(@current_item_list, ($new_item));
}

sub parseLineFromFile {
   my ( $line ) = @_;

   if ($MANUFACTURER eq "")
   {
      checkForManufacturer($line);
   }

   if($line =~ /Koniec zamowienia/){
      exportToCSV()
   }

   if($line =~ /[0-9]\|[0-9]+/){
      setNewItem($line);
   }

   $current_order->checkForData($line);
}

open(FILE, "zamowienia.eml");
while (<FILE>) {
   parseLineFromFile($_)
}

close FILE;

