#!/usr/bin/perl -w
use File::Slurp;
use Cwd 'abs_path';
use File::Basename;

# All arguments are the title
$title = join(' ', @ARGV);

$here = dirname(abs_path($0));
$tag1 = `$here/mnemonic.pl`;
$template =  $here . '/../share/story.template';
# Content from template
$_ = read_file($template);
s/TITLE/$title/g;
s/TAG1/$tag1/;
$content = $_;

# Output file from title
$_ = $title;
s/ /_/g;
s/\W//g;
$out = sprintf("%s_%s.story", $tag1, lc($_));

write_file($out, $content);
printf "%s\n", $out;
