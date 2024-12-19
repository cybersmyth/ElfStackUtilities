#!/usr/bin/perl

$theField = $ARGV[0];
$theValue = $ARGV[1];
while (<STDIN>) 
{
   if (m/"$theField":\s*"?([^,]*)"?[,"]+.*/)
   {
      if ($1 == $theValue) {print $_;}
   } 
}
