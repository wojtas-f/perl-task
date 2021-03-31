package Item;

sub new {
   my $class = shift;
   my $self = {
      _EAN  => shift,
      _NAME  => shift,
      _QUANTITY  => shift,
      _UNIT  => shift,

   };
   bless $self, $class;
   return $self;
}

sub setEAN {
   my ( $self, $line ) = @_;
        $self->{_EAN} = $line if defined($line);
    
}
sub setNAME {
   my ( $self, $line ) = @_;
        $self->{_NAME} = $line if defined($line);
    
}
sub setQUANTITY {
   my ( $self, $line ) = @_;
        $self->{_QUANTITY} = $line if defined($line);
    
}
sub setUNIT {
   my ( $self, $line ) = @_;
        $self->{_UNIT} = $line if defined($line);
    
}

sub print(){
    my ( $self, $line ) = @_;
   return "$self->{_EAN};$self->{_NAME};$self->{_QUANTITY};$self->{_UNIT}\n";
}
1;