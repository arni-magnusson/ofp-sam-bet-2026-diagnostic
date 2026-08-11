BET 2026 DIAGNOSTIC MODEL — JOB 21641
====================================

This one-directory bundle uses fixed steepness h=0.90, Diagnostic F10/F33
weak selectivity penalties, direct negative-binomial tau=2 fixed, and the
exact Job 21641 fitting sequence with no seed or checkpoint.

The ten files needed to refit and evaluate the final PAR are all in this
directory:

  bet.age_length  bet.frq  bet.ini  bet.reg_scaling  bet.tag  mfcl.cfg
  mfclo64  doitall.sh  final.par  run-final

No model .conf, selectivity CSV, downloaded checkpoint or file from another
directory is required at run time.

To evaluate the provided Job 21641 final.par once and reproduce its complete
final REP outputs:

  chmod +x mfclo64 run-final doitall.sh
  ./run-final

This preserves final.par, stages a checksum-verified byte copy as 10.par, and
writes 11.par, plot-11.par.rep, plotq0-11.par.rep, ests.rep, catch.rep and
tag.rep. The 10.par name reproduces the original Phase-11 report headers; it
does not change a parameter. The five REP files are checksum-verified against
the original Kflow Job 21641 outputs.

To refit the same model from the committed h=0.90 bet.ini:

  ./doitall.sh

This is the original Job 21641 process: bet.ini is copied byte-for-byte to the
run-local bet.model.ini, MFCL creates 00.par with -makepar, the fixed tau and
DM initial values are materialized in 00.fixed.par, and the unchanged Phase
1--11 controls are run. These are normal files generated in this directory;
no external input replacement occurs.

To prove that final.par itself is accepted directly by MFCL, it can also be
used as the native input name:

  printf '%s\n' '1 1 1' '1 50 -4' '1 121 0' '1 246 1' | \
    ./mfclo64 bet.frq final.par evaluated.par -file -

Use ./run-final when the original Job 21641 REP filenames and byte-identical
report files are required.
