#!/usr/bin/perl

@vowels = split('', 'aeiouy');
# Never use 'x' as the first lettr for easier pronounciation
@firstConsonants = split('', 'bcdfghjklmnpqrstvz');
@secondConsonants = split('', 'bcdfghjklmnpqrstvxz');

sub word {
  $_ = '';
  $startWithVowel = int rand 2;
  if($startWithVowel){
    $_ .= @vowels[int rand @vowels];
    $_ .= @secondConsonants[int rand @secondConsonants];
    $_ .= @vowels[int rand @vowels];
  } else {
    $_ .= @firstConsonants[int rand @firstConsonants];
    $_ .= @vowels[int rand @vowels];
    $_ .= @secondConsonants[int rand @secondConsonants];
  }
  # Filter offensive words
  if (/sex|kuk|fis|fuc|fuk/) {
    return mem();
  }
  return $_;
}

# Add two digits
$mem = word();
$mem .= int rand 10;
$mem .= int rand 10;

print $mem;
