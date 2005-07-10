#!/usr/bin/perl -w

use Test::More;
use strict;

BEGIN
   {
   plan tests => 5;
   chdir 't' if -d 't';
   };

#############################################################################
# --version
my $rc = `../gen_graph --version`;

like ($rc, qr/v\d\.\d\d/, 'version found');
unlike ($rc, qr/Usage/, 'no help in --version');

#############################################################################
# --help

$rc = `../gen_graph --help 2>&1`;

like ($rc, qr/v\d\.\d\d/, 'version found');
like ($rc, qr/Usage:/, 'help found');
like ($rc, qr/Options:/, 'help found');

