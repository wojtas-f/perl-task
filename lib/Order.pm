package Order;

sub new {
   my $class = shift;
   my $self = {
      _MANUFACTURER => shift,
      _ORDER_NUMBER  => shift,
   };
   # Print all the values just for clarification.
   print "MANUFACTURER is $self->{_MANUFACTURER}\n";
   print "ORDER_NUMBER is $self->{_ORDER_NUMBER}\n";
   bless $self, $class;
   return $self;
}
#MANUFACTURER
sub setMANUFACTURER {
   my ( $self, $MANUFACTURER ) = @_;
   $self->{_MANUFACTURER} = $MANUFACTURER if defined($MANUFACTURER);
   return $self->{_MANUFACTURER};
}

sub getMANUFACTURER {
   my( $self ) = @_;
   return $self->{_MANUFACTURER};
}

#ORDER_NUMBER
sub setORDER_NUMBER {
   my ( $self, $ORDER_NUMBER ) = @_;
   $self->{_ORDER_NUMBER} = $ORDER_NUMBER if defined($ORDER_NUMBER);
   return $self->{_ORDER_NUMBER};
}

sub getORDER_NUMBER {
   my( $self ) = @_;
   return $self->{_ORDER_NUMBER};
}
1;