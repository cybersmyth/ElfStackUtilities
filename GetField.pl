#!/usr/bin/perl
$theField = $ARGV[0];
while (<STDIN>) 
{
   if (m/"$theField":\s*"?([^,]*)"?[,"]+.*/)
   {
      print "$theField is $1\n";
   } 
}
