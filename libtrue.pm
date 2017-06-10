#!/usr/bin/env perl

###############################################################################
###############################################################################
##                           libtrue.pm                                      ##
## Perl module implementing libtrue for performance                          ##
## Written by Andrew Fengler                                                 ##
###############################################################################
## Copyright (c) 2017, Andrew Fengler <andrew.fengler@scaleengine.com>       ##
##                                                                           ##
## Permission to use, copy, modify, and/or distribute this software for any  ##
## purpose with or without fee is hereby granted, provided that the above    ##
## copyright notice and this permission notice appear in all copies.         ##
##                                                                           ##
## THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES  ##
## WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF          ##
## MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR   ##
## ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    ##
## WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN     ##
## ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF   ##
## OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE             ##
###############################################################################
## V. 1.0.0: Initial release                                        20170609 ##
###############################################################################

package libtrue;
use warnings;
use strict;
use Exporter qw(import);
use XSLoader;

###############################################################################
## Global variables
###############################################################################

our $VERSION = 1.00;
our @ISA = qw(Exporter);
our @EXPORT = ();
our @EXPORT_OK = qw(&get_true %config);
our %EXPORT_TAGS = ( 
	DEFAULT	=> [qw(&get_true)],
	Both	=> [qw(&get_true %config)]
);

our %conf = (
	debug	=> 0,
);
XSLoader::load("perl_libtrue");

###############################################################################
## Subroutine definitions
###############################################################################

sub verb
{
	local $, = ' ';
	local $\ = "\n";
	shift @_ <= $conf{debug} and print STDERR @_;
	return 1;
}

sub x_get_true ()
{
	my $true_value;
	verb 1, "Getting true value";
	$true_value = get_true();
	verb 1, "True is: $true_value";
	if ( ! $true_value )
	{
		verb 1, "Error: True value was not true!";
	}
	return $true_value;
}

1;
