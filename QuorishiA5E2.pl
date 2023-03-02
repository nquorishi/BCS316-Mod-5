#NQ-BCS316
#Exercise 2 - Modify the last program you wrote to: display the current 
#hash, and ask the user if they want to add a new entry.  
#If they do, prompt for the city and zip and add it to the hashdisplay 
#the hash again and ask if the user wants to delete an entry. 
#If they do, ask for the hash key to delete, and remove that entry 
#perform the same lookups for city and zip as before, but check to make 
#sure the keys exist. If not, display an error message.
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

# Displays the current hash:
print "Current hash:\n";
while (my ($city, $zip) = each %cityZips) {
    print "$city: $zip\n";
}

# Asks the user if they want to add a new entry:
print "Do you want to add a new entry? (y/n): ";
my $addEntry = <STDIN>;
chomp $addEntry;

if ($addEntry eq 'y') {
    # Prompt the user for a city and zip code and add it to the hash
    print "Enter a city name: ";
    my $cityName = <STDIN>;
    chomp $cityName;

    print "Enter a zip code: ";
    my $zipCode = <STDIN>;
    chomp $zipCode;

    $cityZips{$cityName} = $zipCode;

    # Displays the updated hash:
    print "Updated hash:\n";
    while (my ($city, $zip) = each %cityZips) {
        print "$city: $zip\n";
    }
}

# Asks the user if they want to delete an entry:
print "Do you want to delete an entry? (y/n): ";
my $deleteEntry = <STDIN>;
chomp $deleteEntry;

if ($deleteEntry eq 'y') {
    # Prompts the user for a key to delete and remove it from the hash:
    print "Enter the city name to delete: ";
    my $cityName = <STDIN>;
    chomp $cityName;

    if (exists $cityZips{$cityName}) {
        delete $cityZips{$cityName};

        # Displays the updated hash:
        print "Updated hash:\n";
        while (my ($city, $zip) = each %cityZips) {
            print "$city: $zip\n";
        }
    } else {
        print "Invalid city name.\n";
    }
}

# Asks the user to look up a city or zip code:
print "Enter a city name or zip code to look up: ";
my $lookup = <STDIN>;
chomp $lookup;

# Checks if the lookup string is a zip code or city name and 
# displays the corresponding information:
if (exists $cityZips{$lookup}) {
    print "The zip for $lookup is $cityZips{$lookup}.\n";
} else {
    my $found = 0;
    while (my ($city, $zip) = each %cityZips) {
        if ($zip eq $lookup) {
            print "The city for $lookup is $city.\n";
            $found = 1;
            last;
        }
    }
    if (!$found) {
        print "Invalid city name or zip code.\n";
    }
}
