#!/bin/perl -w

use Bio::SeqIO;

use Bio::Factory::EMBOSS;

$inputFile = Bio::SeqIO->new(-file => "sequence_HFE.gb", -format => "genbank");

#$outputFile = Bio::SeqIO->new(-file => ">emboss-output.fasta", -format => "fasta");

$factory = Bio::Factory::EMBOSS->new();

#$sixpack = $factory->program('sixpack');
$helix = $factory->program('helixturnhelix');


#$sequence = $inputFile->next_seq();

#$sequenceTranslations = $sixpack->run({-sequence => $sequence});

$sixpackOutput = Bio::SeqIO->new(-file => "sixpack.fasta", -format => "fasta");

while($sequence = $sixpackOutput->next_seq()) {
	$helix->run({-sequence => $sequence, -sdbname1 => 'prosite.dat'});
}

