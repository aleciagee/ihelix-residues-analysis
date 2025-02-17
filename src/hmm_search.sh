#!/bin/bash


# assignments
DB_NAME="uniprot"
TEST_NAME="p450_activesite" # only needed for varying uniprot searches
TEST_NO=2


# parameters
E_VALUE=1
Z_SCORE=700000 # ensure add Z score to options as needed
# T_SCORE=10 # bit score


# locations
DB_INFILE=../input/databases/uniprot/p450_activesite.fasta # database to query
HMM_INFILE=../output/hmm_round_1/ihelix_seed_hmm.hmm
OUTPUT_DIR=../output/hmm_search_1/${DB_NAME}/${TEST_NAME}/${TEST_NO}/
SCORE_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE}_z_${Z_SCORE}_T_${T_SCORE}.out
ALN_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE}_z_${Z_SCORE}_T_${T_SCORE}.aln

# make directory
mkdir -p "$OUTPUT_DIR"


## Querying the HMM profile
# varying e values
hmmsearch -A ${ALN_OUTFILE} -E ${E_VALUE} -Z ${Z_SCORE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}
# varying t score
# hmmsearch -A -A ${ALN_OUTFILE} -Z ${Z_SCORE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}