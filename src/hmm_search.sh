#!/bin/bash


# assignments
DB_NAME="biocatnet"
# TEST_NAME="p450_reviewed_5star" # only needed for varying uniprot searches
TEST_NO=4


# parameters
E_VALUE=0.0001
E_VALUE_NAME="0p0001"
Z_SCORE=52674 # ensure add Z score to options as needed
# T_SCORE=10 # bit score


# locations
DB_INFILE=../input/databases/biocatnet_p450.fasta # database to query
HMM_INFILE=../output/hmm_round_1/ihelix_seed_hmm.hmm
# OUTPUT_DIR=../output/hmm_search_1/${DB_NAME}/${TEST_NAME}/${TEST_NO}/ # for uniprot searches with test_name
OUTPUT_DIR=../output/hmm_search_1/${DB_NAME}/${TEST_NO}/
SCORE_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE_NAME}_z_${Z_SCORE}_T_${T_SCORE}.out
ALN_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE_NAME}_z_${Z_SCORE}_T_${T_SCORE}.aln

# make directory
mkdir -p "$OUTPUT_DIR"


## Querying the HMM profile
# varying e values
# hmmsearch -A ${ALN_OUTFILE} -E ${E_VALUE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}
# varying z value
hmmsearch -A ${ALN_OUTFILE} -E ${E_VALUE} -Z ${Z_SCORE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}