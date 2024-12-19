#!/usr/bin/perl

while (<STDIN>)
{
   m/^([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+(.*)$/;
   $syslog_pri=$1;
   $timestamp=$2;
   $hostname=$3;
   $event_source=$4;
   $event_source_id=$5;
   $msgid = $6;
   $structured_data=$7;
   $theJSON = $8;

   print "Syslog_pri: $syslog_pri\n
   timestamp $timestamp\n
   hostname $hostname\n
   event_source $event_source\n
   event_source_id $event_source_id\n
   msgid $msgid\n
   structured_data $structured_data\n
   theJSON: $theJSON\n
   ";

   foreach (split(",",$theJSON))
   {
      if (m/\{?"([^"]+)":\s+"?([^"]*)"?/)
    #  if (m/{?"([^"]+)":(.*)/)
      {
         print "field $1: $2\n";
      }
      else
      {
        warn "unreadable JSON: $_\n";
      }
   }
}
