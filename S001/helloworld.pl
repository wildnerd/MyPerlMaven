#!/usr/bin/env perl
use strict;
use warnings;

my $myvar = time();
our $ourvar = time();

printf("hello world on %s\n", scalar(localtime(time())));
