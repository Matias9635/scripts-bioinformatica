#!/bin/perl -w

use Bio::Tools::Run::StandAloneBlastPlus;


my $factory = Bio::Tools::Run::StandAloneBlastPlus->new(
    -db_data => './ncbi-blast-2.11.0+/data/swissprot',  # Specifies the file to use for database
    -create => 1   # Creates a new temporary database
);

print "Temporary databse created\n";

my $result = $factory->blastp( 
    -query => 'output.fasta',         # query: output obtained from script 1    
    -outfile => 'local-blast.out' );  # outfile: blast output

print "Blastp executed\n";

# Delete the temporary database files
$factory->cleanup;

print "Cleanup executed\n";