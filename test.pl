#!/usr/bin/env perl

package SDTProvider {
  use FFI::Platypus::Record;
  record_layout(
    string => 'name',    
  );
}

use FFI::CheckLib;
use FFI::Platypus;

use v5.10;

my $ffi = FFI::Platypus->new;
$ffi->lib(find_lib_or_die lib => 'stapsdt');
#$ffi->type("record(SDTProvider)" => 'SDTProvider');

$ffi->attach('providerInit' => [ 'string' ] => 'pointer');
$ffi->attach('providerAddProbe' => [ 'pointer', 'string', 'int' ] => 'pointer');

$ffi->attach('providerLoad' => [ 'pointer' ] => 'int');
$ffi->attach('providerUnload' => [ 'pointer' ] => 'int');
$ffi->attach('providerDestroy' => [ 'pointer' ]);

$ffi->attach('probeFire' => [ 'pointer' ]);
$ffi->attach('probeIsEnabled' => [ 'pointer' ]);

my $prov = providerInit('XXXX');
say "Provider XXXX init";
my $probe = providerAddProbe($prov, 'probe1', 0);
say "Probe added";
providerLoad($prov);
say "Provider loaded";

while (1) {
  probeFire($probe);
  say "Probe fired";

  sleep 1;
}

use Data::Dumper;
print Dumper($p);

