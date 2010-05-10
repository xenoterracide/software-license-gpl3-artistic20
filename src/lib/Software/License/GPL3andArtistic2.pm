package Software::License::GPL3andArtistic2;
use strict;
use warnings;
use parent 'Software::License';

use Software::License::GPL_3;
use Software::License::Artistic_2_0;

sub name { 'GNU GPLv3 and Artistic 2.0' }
sub url  { 'http://www.gnu.org/licenses/gpl-3.0.txt http://www.perlfoundation.org/artistic_license_2_0' }
sub meta_name { 'gpl3artistic2' }

sub _gpl {
  my ($self) = @_;
  return $self->{_gpl} ||= Software::License::GPL_3->new({
    year   => $self->year,
    holder => $self->holder,
  });
}

sub _tal {
  my ($self) = @_;
  return $self->{_tal} ||= Software::License::Artistic_2_0->new({
    year   => $self->year,
    holder => $self->holder,
  });
}

1;
# ABSTRACT: GPL 3 and Artistic 2.0 Dual License
=head1 SYNOPSIS

  use Software::License::GPL3andArtistic2;

  my $license = Software::License::GPL3andArtistic2->new({
    holder => 'Caleb Cushing',
  });

  open (my $license_file, '>', 'LICENSE') or die $!;
  print $license_file $license->fulltext;

=head1 DESCRIPTION

This package provides a Dual Licence for GPLv3 and Artistic 2.0. Written
Because as of yet Software::License (and Dist::Zilla )  doesn't provide a way
to multilicense

=cut

__DATA__
__NOTICE__

This software is copyright (c) {{$self->year}} by {{$self->holder}}.

This is free software; you can redistribute it and/or modify it under
one of the following licenses

a) the GNU General Public License as published by the Free
   Software Foundation; either version 3, or (at your option) any
   later version, or
b) the "Artistic License 2.0"
__LICENSE__

--- {{ $self->_gpl->name }} ---

{{$self->_gpl->fulltext}}

--- {{ $self->_tal->name }} ---

{{$self->_tal->fulltext}}
