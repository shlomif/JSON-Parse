package JSON::Parse;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw/parse_json json_to_perl valid_json json_file_to_perl/;
%EXPORT_TAGS = (
    all => \@EXPORT_OK,
);
use warnings;
use strict;
use Carp;
our $VERSION = '0.23';
require XSLoader;
XSLoader::load (__PACKAGE__, $VERSION);

our $true = 1;
our $false = 0;
our $null;

sub json_to_perl
{
    goto &parse_json;
}

sub valid_json
{
    my ($json) = @_;
    if (! $json) {
	return undef;
    }
    eval {
	parse_json (@_);
    };
    return ! $@;
}

sub json_file_to_perl
{
    my ($file_name) = @_;
    my $json = '';
    open my $in, "<:encoding(utf8)", $file_name or croak $!;
    while (<$in>) {
	$json .= $_;
    }
    close $in or croak $!;
    return json_to_perl ($json);
}

1;