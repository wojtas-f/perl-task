package Order;

sub new {
   my $class = shift;
   my $self = {
      _ORDER_NUMBER  => shift,
      _NIP  => shift,
      _DELIVERY_DATE  => shift,
      _PAYER  => shift,
      _RECEIVER_NAME  => shift,

   };
   bless $self, $class;
   return $self;
}
#RECEIVER_NAME
sub checkForData {
   my ( $self, $line ) = @_;
   $self->setRECEIVER_NAME($line);
   $self->setDELIVERY_DATE($line);
   $self->setNIP($line);
   $self->setPayer($line);
   $self->setORDER_NUMBER($line);
}

# sub setNewItem {
#     my ( $self, $new_item ) = @_;
#     push($self->_ITEMS, $new_item);
# }

#RECEIVER_NAME
sub setRECEIVER_NAME {
   my ( $self, $line ) = @_;
   if($line =~ /ODBIORCA/){
        if($line =~/\b(?!ODBIORCA)(?!\|)\b([A-Za-z-0-9]+\s)+/){
            $self->{_RECEIVER_NAME} = $& if defined($&);
        }
    }
}

#DELIVERY_DATE
sub setDELIVERY_DATE {
   my ( $self, $line ) = @_;
   if($line =~ /DATA DOSTAWY/){
        if($line =~ /[0-9-]+/){ 
            $self->{_DELIVERY_DATE} = $& if defined($&);
        }
    }
}

#NIP
sub setNIP {
   my ( $self, $line ) = @_;
       if($line =~ /NIP/){
        if( $line =~/[0-9]+/){
            $self->{_NIP} = $& if defined($&);
        }
    }
}

#PAYER
sub setPayer {
   my ( $self, $line ) = @_;
       if($line =~ /PLATNIK/){
        if( $line =~/\b(?!PLATNIK)\b([A-Z]+\s[A-Z]+|[A-Z]+)/){
            $self->{_PAYER} = $& if defined($&);
        }
    }
}

#ORDER_NUMBER
sub setORDER_NUMBER {
   my ( $self, $line ) = @_;
    if($line =~ /NR ZAMOWIENIE/){
        if( $line =~/[0-9]+/){
         $self->{_ORDER_NUMBER} = $& if defined($&);
        }
    }
}

#ORDER_NUMBER
sub print {
   my ( $self, $line ) = @_;
   return "$self->{_RECEIVER_NAME};$self->{_DELIVERY_DATE};$self->{_NIP};$self->{_PAYER};$self->{_ORDER_NUMBER}\n";

}

#ORDER_NUMBER
sub getOrderNumber {
   my ( $self ) = @_;
   return $self->{_ORDER_NUMBER};
}

1;