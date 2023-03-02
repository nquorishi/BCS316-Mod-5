#NQ-BCS316
#Exercise 3 - Create two arrays of numbers, both with some identical 
#and some different values.  Display the intersection and difference 
#of the two arrays.  Display the two derived arrays in sorted order.
use 5.23.0;
use strict;
use warnings;
use Data::Dumper;

# Creates two arrays of numbers:
my @array1 = (1, 2, 3, 4, 5, 6);
my @array2 = (4, 5, 6, 7, 8, 9);

# Finds the intersection of the two arrays:
my %hash1;
foreach my $num (@array1) {
    $hash1{$num} = 1;
}
my @intersection;
foreach my $num (@array2) {
    push @intersection, $num if exists $hash1{$num};
}

# Finds the difference of the two arrays:
my %hash2;
foreach my $num (@array2) {
    $hash2{$num} = 1;
}
my @difference;
foreach my $num (@array1) {
    push @difference, $num unless exists $hash2{$num};
}

# Sorts the derived arrays:
@intersection = sort { $a <=> $b } @intersection;
@difference = sort { $a <=> $b } @difference;

# Displays the derived arrays using "Data::Dumper":
say "Intersection: ", Dumper(\@intersection), "\n";
say "Difference: ", Dumper(\@difference), "\n";
