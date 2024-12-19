#!/usr/bin/perl

$startTime=$ARGV[0];
$endTime=$ARGV[1];
die "invalid time specfication $startTime > $endTime" if (($startTime cmp $endTime) == 1);
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
    if (($timestamp cmp $startTime) >=0 && ($timestamp cmp $endTime) <=0) {print $_;}
}

