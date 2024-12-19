#!/usr/bin/perl

while (<STDIN>) 
{
   $printedanything=0;
   $wholething=$_;
    m/^([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+(.*)$/;
       $syslog_pri=$1;
       $timestamp=$2;
       $hostname=$3;
       $event_source=$4;
       $event_source_id=$5;
       $msgid = $6;
       $structured_data=$7;
       $theJSON = $8;

   $comma="$timestamp: ";
   foreach (@ARGV)
   {
      chomp;
      if ($wholething=~m/"$_":\s*"?([^,]*)"?[,"]+.*/)
      {
         print "${comma}$_:$1";
         $printedanything=1;
         $comma=", ";
     }
     else
     {
     }
   }
   if ($printedanything) 
   {
      print ("\n");
   }
}
