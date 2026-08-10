# Frozen Job 21641 model files

This directory is the complete input recipe for the BET 2026 **tau=2 fixed-
steepness and selectivity Diagnostic model**. Do not run it in place. Use
`../doitall`, which copies these files to a fresh run directory and starts
from ordinary `bet.ini -makepar` initialization. The main workflow uses the
single explicit `Diagnostic` input matching Job 21641
(steepness 0.90 with the F10 and F33 weak non-decreasing selectivity setting).

The committed `bet.ini` is the effective Job 21641 INI and contains
`sv(29)=0.90`. The complete 33-fishery controls are literal lines in
`doitall.sh`: all fisheries remain independent, with weak non-decreasing
penalties 10,000 on F10 and F33. `model-inputs/Diagnostic.conf` and the
checksum-locked `selectivity-models/Diagnostic.csv` document and independently
validate that embedded definition; the native run does not read either file.

At run time, `doitall.sh` requires the committed `bet.ini` steepness to equal
its embedded fixed value 0.90 and copies that INI byte-for-byte to
`bet.model.ini`; it does not rewrite scientific input values. The embedded
controls are applied directly at Phases 1 and 5 and audited against each
resulting PAR file.

`doitall.sh` starts from ordinary `bet.ini -makepar`, applies no seed, jitter or
fitted checkpoint, and fixes direct negative-binomial `tau=2`. It audits tau,
steepness, Lorenzen M, DM concentration and Diagnostic selectivity after every
fitted phase. The final fitted file is `11.par`.

The FRQ declares no weight-frequency observations. Removing the obsolete WF
header dimensions and trailing missing-value placeholder did not alter catch,
effort or length-frequency observations.

The flat native minimum is exactly these eight files: `bet.age_length`,
`bet.frq`, `bet.ini`, `bet.reg_scaling`, `bet.tag`, `mfcl.cfg`, `doitall.sh`
and the repository-root `mfclo64`. Copy them into one directory and run
`./doitall.sh`; neither `model-inputs/Diagnostic.conf` nor
`selectivity-models/Diagnostic.csv` is required.

Run `../verify` before fitting to validate all hashes.
