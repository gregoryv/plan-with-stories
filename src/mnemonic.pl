#!/usr/bin/perl

@vowels = split('', 'aeiouy');
@consonants1 = split('', 'bcdfghjklmnpqrstvz');
@consonants2 = split('', 'bcdfghjlmnpqrstvxz');
$id = @consonants1[int rand @consonants1];
$id .= @vowels[int rand @vowels];
$id .= @consonants2[int rand @consonants2];
$id .= int rand 10;
$id .= int rand 10;

print $id;
