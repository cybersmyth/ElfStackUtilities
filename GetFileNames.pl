#!/usr/bin/perl

use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;               # Perl core module
use strict;                     # Good practice
use warnings;                   # Good practice
use Error ':try';

sub looksLikeAFilename
{
   foreach (@_)
   {
      next if (!defined($_));
      if ($_ =~ m~^[A-Z]:[/\\].*~)
      {
         print "$_\n";
      }
   }
}


while (<STDIN>) 
{

   my $wholething=$_;
    m/^([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+(.*)$/;
       my $syslog_pri=$1;
       my $timestamp=$2;
       my $hostname=$3;
       my $event_source=$4;
       my $event_source_id=$5;
       my $msgid = $6;
       my $structured_data=$7;
       my $theJSON = $8;
      my $allTheFields=decode_json($theJSON);
#      print Dumper $allTheFields;

      for my $k (keys %$allTheFields)
      {
         my $theValue;
         try {
#         printf "%s\n",$allTheFields->{$k};
         $theValue=$allTheFields->{$k};
         looksLikeAFilename $theValue;
         }
         catch Error::Simple with {
            my $error = shift;
            print "Error: $error on $theValue";
         }
      }
}
