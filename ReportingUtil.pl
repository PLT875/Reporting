use strict;
use warnings;
use POSIX qw(strftime);
use Cwd qw(abs_path);
use Data::Dumper;

# Online Resources
# ----------------
# http://www.tutorialspoint.com/perl/perl_open.htm
# http://www.tutorialspoint.com/perl/perl_directories.htm

#&make_directory(strftime("%d-%m-%Y_%H:%M", localtime(time)));

my @matrix;
$matrix[0][0] = 'Name';
$matrix[0][1] = 'Occupation';
$matrix[0][2] = 'Skills';
$matrix[1][0] = 'Peter Tran';
$matrix[1][1] = 'Software Developer';
$matrix[1][2] = 'Java, Perl, PHP';
$matrix[2][0] = 'Joe Bloggs';
$matrix[2][1] = 'Tester';

&create_and_write_csv(@matrix);
&zip_directory();

sub create_and_write_csv {
	my(@matrix) = @_;
	my $filename = strftime("%d-%m-%Y_%H-%M-%S", localtime(time));
	open(FH, ">./Reports/$filename.csv") or die "Error: Can't open file $filename.csv\n";
	foreach my $row(@matrix){
		my $current_column_no = 0;
		my $last_column_no_current_row = scalar(@{ $row }) - 1;
		foreach my $column(@$row){
			# Get the field value and write to the csv.
			print FH "\"";
			print FH $column;
			print FH "\"";
			if($current_column_no < $last_column_no_current_row){
				print FH ",";
				$current_column_no++;
			} else {
				print FH "\n";
				# End of current row.
			}	
		}			
	}

	close(FH);
	return;	
}

sub make_directory {
	my ($directory) = @_;
	mkdir($directory, 0775) or die "Could not create directory $directory\n";
	return;
}

sub zip_directory {
	print "Zipping \n";
	system("zip -r Reports Reports");
	return;
}

