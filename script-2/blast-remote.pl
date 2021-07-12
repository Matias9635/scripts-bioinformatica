#!/bin/perl -w

use Bio::Tools::Run::StandAloneBlastPlus;


my $factory = Bio::Tools::Run::StandAloneBlastPlus->new(
 -db_name => 'nr', #NCBI remote database
 -remote => 1
);

my $result = $factory->blastp(
	-query => 'output.fasta', 		# query: output obtained from script 1
	-outfile => 'remote-blast.out'	# outfile: blast output
	);

print "Blastp executed\n";

