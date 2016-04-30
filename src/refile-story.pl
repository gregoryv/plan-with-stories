#!/usr/bin/perl
use File::Slurp;
use Cwd 'abs_path';
use File::Basename;

foreach my $file (@ARGV) {
  $file = dirname(abs_path($file)) . "/". basename($file);
  die "No such file: $file" if ! -e $file;
  $_ = read_file($file);
  ($title, $description, $scope, $meta) = split("\n\n", $_);

  # First tag is the identifier
  $meta =~ /# Tags:\s*(\w+)\s/;
  $tag1 = $1;

  # Output file from title
  $_ = $title;
  s/ /_/g;
  s/\W//g;
  $out = sprintf("%s/%s_%s.story", dirname(abs_path($file)), $tag1, lc($_));

  # Move file if different
  if($file ne $out) {
    rename $file, $out;
    printf "Moved %s to %s\n", $file, $out;
  }
}