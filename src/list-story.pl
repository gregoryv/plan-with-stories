#!/usr/bin/perl
use File::Slurp;

$template = "%-40s %6s  %s\n";
printf $template, "# Title", "Points", "Tags";

foreach my $file (@ARGV) {
  die "No such file: $file" if ! -e $file;
  $_ = read_file($file);
  ($title, $description, $scope, $meta) = split("\n\n", $_);

  if(length($title) >= 40) {
    $title = substr($title, 0, 37) . "...";
  }

  $meta =~ /^# Points:\s*(.*)$/m;
  $points = $1;

  # First tag is the identifier
  $meta =~ /# Tags:\s*(.*)$/m;
  $tags = $1;

  if($points !~ /^\d+$/) {
    $points = "";
  }

  printf $template, $title, $points, $tags;
}
