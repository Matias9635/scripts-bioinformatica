#!/bin/perl -w

#Setear path al ejecutable de t_coffee
BEGIN { $ENV{TCOFFEDIR} = '/usr/bin/t_coffee' }

use Bio::Tools::Run::Alignment::TCoffee;
use Bio::AlignIO;

#ktuple 1 = protein
my $factory = Bio::Tools::Run::Alignment::TCoffee->new(-matrix => 'BLOSUM', 'ktuple' => 1);

print "Factory created\n";

my $alignment = $factory->align('organisms.fasta');

print "Align executed\n";
print "Average percentage identity: ".$alignment->percentage_identity."\n";


$out = Bio::AlignIO->new(-file => ">alignment-output.aln",
                         -format => 'clustalw');
$out->write_aln($alignment);