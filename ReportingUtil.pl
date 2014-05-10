#!/usr/local/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);

# Online Resources
# ----------------
# http://www.tutorialspoint.com/perl/perl_open.htm
# http://www.tutorialspoint.com/perl/perl_directories.htm


&create_and_write_csv();

sub create_and_write_csv {
	my $directory = "./Reports";
	chdir($directory) or die "Could not go to $directory\n";
	my $filename = strftime("%d-%m-%Y_%H:%M:%S", localtime(time));
	open(FH, ">$filename.csv") or die "Error: Can't open file $filename.csv\n";
	print FH "Peter Tran, 26, UCL \n";
	print FH "Joe Bloggs, 28, King's College London \n";
	close FH; 
	return;
}