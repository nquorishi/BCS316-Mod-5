#NQ-BCS316
#Exercise 1 - Set up a hash that contains a few city names and their 
#corresponding zip codes. 
#Then, display the names of the cities and ask the user to enter one.  
#Display the corresponding zip code.  Reverse the hash and display the 
#zip codes, asking the user to choose one.  Display the city for that 
#zip code. You can display the lists of cities and zip codes any way you 
#want, or display both at the same time with the keys function.
use 5.23.0;
use strict;
use warnings;

# Sets up the hash with city names and zip codes:
my %cityZips = (
    'New York' => '11746',
    'Los Angeles' => '90001',
    'Chicago' => '60601',
    'Houston' => '77001',
    'Philadelphia' => '19019',
);

# Displays the list of city names:
say "Choose a city from the list:";
foreach my $city (sort keys %cityZips) {
    say "$city\n";
}

# Prompts the user for a city name and display the corresponding zip code:
say "Enter a city name: ";
my $cityName = <STDIN>;
chomp $cityName;

say "The zip code for $cityName is $cityZips{$cityName}.\n";

# Reverses the hash and display the list of zip codes:
my %zipCities = reverse %cityZips;

say "Choose a zip code from the list:";
foreach my $zip (sort keys %zipCities) {
    say "$zip\n";
}

# Prompts the user for a zip code and display the corresponding city name:
say "Enter a zip code: ";
my $zipCode = <STDIN>;
chomp $zipCode;

say "The city for $zipCode is $zipCities{$zipCode}.\n";
