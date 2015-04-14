#!/usr/bin/perl -w
#
use strict;

my ( $res ) = @ARGV;

while ( my @digits = split (//, <STDIN>)) {
    pop @digits;
    print &calc_display(@digits);
}

sub calc_display {
    return &caps . &coats . &belts . &trousers . &shoes;
}

sub caps {
    my @offon = ( 1, 0, 1, 1, 0, 1, 0, 1, 1, 1 );
    my $row;
    foreach my $digit (@_) {
        $row .= $offon[$digit] ? &h_on : &h_off;
        $row .= ' ';
    }
    return "$row\n";
}
sub coats {
    my @loffon = ( '|', ' ', ' ', ' ', '|', '|', '|', ' ', '|', '|' );
      my @roffon = ( '|', '|', '|', '|', '|', ' ', ' ', '|', '|', '|' );
    my $row;
    foreach my $digit (@_) {
        $row .= $loffon[$digit] . ' ' x $res . $roffon[$digit] . ' ';
    }
    $row = "$row\n" x $res;
}

sub trousers {
    my @loffon = ( '|', ' ', '|', ' ', ' ', ' ', '|', ' ', '|', ' ' );
      my @roffon = ( '|', '|', ' ', '|', '|', '|', '|', '|', '|', '|' );
    my $row;
    foreach my $digit (@_) {
        $row .= $loffon[$digit] . ' ' x $res . $roffon[$digit] . ' ';
    }
    $row = "$row\n" x $res;
}

sub belts {
    my @offon = ( 0, 0, 1, 1, 1, 1, 1, 0, 1, 1 );
    my $row;
    foreach my $digit (@_) {
        $row .= $offon[$digit] ? &h_on : &h_off;
        $row .= ' ';
    }
    return "$row\n";
}
sub shoes {
    my @offon = ( 1, 0, 1, 1, 0, 1, 1, 0, 1, 1 );
    my $row;
    foreach my $digit (@_) {
        $row .= $offon[$digit] ? &h_on : &h_off;
        $row .= ' ';
    }
    return "$row\n";
}

sub h_on {
    my $line = ' ' . '-' x $res . ' ';
}

sub h_off {
    my $line = ' ' . ' ' x $res . ' ';
}
