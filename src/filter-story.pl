#!/usr/bin/perl
# First argument is the filter
$filter = shift @ARGV;

foreach my $file (@ARGV) {
  die "No such file: $file" if ! -e $file;
  $_ = do { local(@ARGV, $/) = $file; <> };

  if($filter eq "not-estimated") {
    # Estimated if only one points value is set
    if(!/^# Points:\s+\d+$/m) {
      print $file, " ";
    }
  }
}
