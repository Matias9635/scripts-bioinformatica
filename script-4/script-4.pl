#!/bin/perl -w

if(@ARGV != 2) {
	print STDERR "ERR: Argument 1 must be the blast filename and argument 2 must be the string pattern between quotes\n";
	exit 1;
}

use Bio::SearchIO;
use Bio::DB::SwissProt;
use Bio::SeqIO;
 
$swissProt = Bio::DB::SwissProt->new();

#El reporte blast a parsear es el output del script 2
my $blastReport = new Bio::SearchIO(
    -format => 'blast',
    -file   => $ARGV[0]);

my $pattern = $ARGV[1];

my $result = $blastReport->next_result;

my $accession = '';
my $description = '';
my $seqIO;

my $sequence;

#archivo de salida que va a tener los hits que coincidan con el pattern
$outputFile = Bio::SeqIO->new(-file => ">hits.fasta", -format => "fasta");

while(my $hit = $result->next_hit) {
	$accession = $hit->accession;
	$description = $hit->description;
	$seqIO = $swissProt->get_Seq_by_acc(substr($accession, 0, -2));
	if(index(lc($description), lc($pattern)) != -1) {
    	#Si la descripcion del hit contiene el pattern, lo escribo en el archivo
		$outputFile->write_seq($seqIO);
	}
}