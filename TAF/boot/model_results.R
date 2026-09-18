library(TAF)

# Download
message("Downloading model results ... ", appendLF=FALSE)
zipfile <- "bet-2026-diagnostic-standalone.zip"
url <- file.path("https://github.com/PacificCommunity",
                 "ofp-sam-bet-2026-diagnostic/releases/download",
                 "diagnostic-standalone-2026.08.11", zipfile)
download(url)
message("done")

# Unzip
taf.unzip(zipfile, junkpaths=TRUE)

# Copy key files to boot/data
key <- c("11.par", "bet.age_length", "bet.frq", "bet.ini", "bet.reg_scaling",
         "bet.tag", "BUILD-INFO.txt", "catch.rep", "doitall.sh", "indepvar.rpt",
         "length.fit", "mfcl.cfg", "mfclo64", "plot-11.par.rep",
         "PROVENANCE.md", "README.txt", "run-final",
         "standalone-final-evaluation.log", "temporary_tag_report",
         "test_plot_output")
cp(key, "..")
