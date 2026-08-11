BET 2026 DIAGNOSTIC MODEL — JOB 21641
====================================

This bundle uses fixed steepness h=0.90, Diagnostic F10/F33 weak selectivity
penalties, direct negative-binomial tau=2 fixed, and ordinary makepar with no
seed or checkpoint.

To evaluate the provided Job 21641 final.par once and reproduce its complete
final REP outputs:

  chmod +x mfclo64 run-final doitall.sh
  ./run-final

This preserves final.par, stages an exact copy as 10.par, and writes 11.par,
plot-11.par.rep, plotq0-11.par.rep, ests.rep, catch.rep and tag.rep. The five
REP files are checksum-verified against the original Kflow Job 21641 outputs.

To refit the same model from the committed h=0.90 bet.ini:

  ./doitall.sh
