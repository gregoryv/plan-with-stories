#!/usr/bin/perl
use File::Slurp;
use Cwd 'abs_path';
use File::Basename;

sub story {
  $file = shift;
  $_ = read_file($file);
  chomp;
  ($title, $description, $scope, $meta) = split("\n\n", $_);

  $description =~ s/\.\n/.<br>/g;
  $scope =~ s|^\+ (.*)$|<li class="in scope">\1</li>|gm;
  $scope =~ s|^\- (.*)$|<li class="ut scope">\1</li>|gm;
  $_ = <<EOFStory;
<div class="story">
  <h1>$title</h1>
  <p>$description</p>
  <ul class="scope">$scope</ul>
  <pre class="meta">$meta</pre>
</div>
EOFStory
}

if(scalar(@ARGV) == 0) {
  print "No stories!\n";
  exit;
}

$cards = "";
foreach my $file (@ARGV) {
  die "No such file: $file" if ! -e $file;
  $cards .= story $file;
}

$csspath = dirname(abs_path($0)) . '/../share/story-print.css';
$_ = <<EOF;
<html><link rel="stylesheet" type="text/css" href="$csspath"/>
<body>
$cards
</body></html>
EOF
$out = $ENV{'OUTPUT'} || 'toprint.html';
write_file($out, $_);
print "$out\n";

# To e.g print all stories with word Major in it
# print-story.pl $(grep -l Major *.story | tr '\n' ' ')
