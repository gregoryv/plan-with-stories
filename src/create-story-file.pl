#!/usr/bin/perl -w
use Cwd 'abs_path';
use File::Basename;

# All arguments are the title
$title = join(' ', @ARGV);

$here = dirname(abs_path($0));
$tag1 = `$here/mnemonic.pl`;
$template =  $here . '/../share/story.template';
# Content from template
$_ =  do { local( @ARGV, $/ ) = $template ; <> } ;
s/TITLE/$title/g;
s/TAG1/$tag1/;
$content = $_;

# Output file from title
$_ = $title;
s/ /_/g;
s/\W//g;
$out = sprintf("%s_%s.story", $tag1, lc($_));

open( my $fh, ">$out" ) ||  die "can't create $out $!" ;
print $fh $content ;

printf "%s\n", $out;
