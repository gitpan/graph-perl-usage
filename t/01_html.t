#!/usr/bin/perl -w

use Test::More;
use strict;

BEGIN
   {
   plan tests => 4;
   chdir 't' if -d 't';
   };

my $gen = '../';
$gen = 'perl ..\\' if $^O =~ /MSWin32/i;
$gen .= 'gen_graph';

#############################################################################
# --format=html

my $out = "usage.html";

unlink $out; my $rc = `$gen --inc=lib/Test.pm --format=html --output=$out`;
ok (-f $out, "$out exists");

unlink $out; $rc = `$gen --inc=lib/Test.pm --format=html --output=usage`;
ok (-f $out, "$out exists");

unlink $out; $rc = `$gen --inc=lib/Test.pm --format=html --versions --output=usage`;
ok (-f $out, "$out exists");

unlink $out; $rc = `$gen --inc=lib/Test.pm --format=html --versions --debug --output=usage`;
ok (-f $out, "$out exists");

END
  {
  # clean up
  unlink "usage.html";
  }


