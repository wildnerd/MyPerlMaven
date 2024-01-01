#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use LWP::UserAgent;
use HTTP::Request;
use JSON qw(to_json);
 
my $data = to_json({ fname => 'Foo', lname => 'Bar' });
 
my $ua = LWP::UserAgent->new( agent => 'Great Perl Agent' );
$ua->default_header("Content-Type" => "application/json");
my $res;
if (0) {
    $res = $ua->post('https://perlmaven.com/', Content => $data);
} else {
    $ua->ssl_opts(verify_hostname => 0, SSL_verify_mode => 0x00);
    my $req = HTTP::Request->new(POST => 'https://192.168.1.67/api/v1/ingest');
    $req->authorization_basic( "camainta", "bea##cons" );
    $req->content_type("application/json");
    $req->content($data);
    $res = $ua->request($req);
}
say $res->status_line;
say $res->content;
