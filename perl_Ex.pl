#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(floor sqrt); # Importing the floor and sqrt functions


sub is_prime {
    my ($n) = @_;
    return 0 if $n < 2;
    return 1 if $n == 2;
    return 0 if $n % 2 == 0;
    my $limit = floor(sqrt($n));
    for (my $i = 3; $i <= $limit; $i += 2) {
        return 0 if $n % $i == 0;
    }
    return 1;
}

sub is_perfect_square {
    my ($n) = @_;
    return 0 if $n <= 0;
    my $root = floor(sqrt($n));
    return $n == $root * $root ? 1 : 0;
}

sub find_first_prime {
    my @list = @_;
    foreach my $i (0 .. $#list) {
        return $i if is_prime($list[$i]);
    }
    return -1;
}

sub find_last_square {
    my @list = @_;
    for (my $i = $#list; $i >= 0; $i--) {
        return $i if is_perfect_square($list[$i]);
    }
    return -1;
}

print "Enter the size of the array: ";
my $size = <STDIN>;
chomp $size;

if ($size <= 0) {
    print "Invalid size!\n";
    exit 1;
}

my @L;
print "Enter $size numbers for the array: \n";
for (my $i = 0; $i < $size; $i++) {
    my $num = <STDIN>;
    chomp $num;
    push @L, $num;
}

my $first_prime_idx = find_first_prime(@L);
my $last_square_idx = find_last_square(@L);

if ($first_prime_idx != -1 && $last_square_idx != -1 && $first_prime_idx < $last_square_idx) {
    print "Sublist S contains: ";
    print "$L[$first_prime_idx] ";
    for (my $i = $first_prime_idx + 1; $i < $last_square_idx; $i++) {
        print $L[$i]**3 . " ";
    }
    print "$L[$last_square_idx]\n"; # Print the last perfect square
} else {
    print "No valid sublist can be formed.\n";
}
