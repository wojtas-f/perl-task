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
sub setRECEIVER_NAME {
   my ( $self, $RECEIVER_NAME ) = @_;
   $self->{_RECEIVER_NAME} = $RECEIVER_NAME if defined($RECEIVER_NAME);
   return $self->{_RECEIVER_NAME};
}

#DELIVERY_DATE
sub setDELIVERY_DATE {
   my ( $self, $DELIVERY_DATE ) = @_;
   $self->{__DELIVERY_DATE} = $DELIVERY_DATE if defined($DELIVERY_DATE);
   return $self->{_DELIVERY_DATE};
}

#NIP
sub setNIP {
   my ( $self, $NIP ) = @_;
   $self->{_NIP} = $NIP if defined($NIP);
   return $self->{_NIP};
}

#PAYER
sub setPayer {
   my ( $self, $PAYER ) = @_;
   $self->{_PAYER} = $PAYER if defined($PAYER);
   return $self->{_PAYER};
}

#ORDER_NUMBER
sub setORDER_NUMBER {
   my ( $self, $ORDER_NUMBER ) = @_;
   $self->{_ORDER_NUMBER} = $ORDER_NUMBER if defined($ORDER_NUMBER);
   return $self->{_ORDER_NUMBER};
}

1;