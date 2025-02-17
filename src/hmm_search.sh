#!/bin/bash


# assignments
DB_NAME="uniprot"
TEST_NAME="p450_activesite" # only needed for varying uniprot searches
HMM_NO=1


# parameters
E_VALUE=10
# Z_SCORE=497798 # ensure add Z score to options as needed
# T_SCORE=10 # bit score


# locations
DB_INFILE=../input/databases/uniprot/p450_activesite.fasta # database to query
HMM_INFILE=../output/hmm_round_1/ihelix_seed_hmm.hmm
OUTPUT_DIR=../output/hmm_search_${HMM_NO}/${DB_NAME}/${TEST_NAME}/E_VALUE_${E_VALUE}/
SCORE_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE}_z_${Z_SCORE}_T_${T_SCORE}.out
ALN_OUTFILE=${OUTPUT_DIR}/ihelixhits_e_${E_VALUE}_z_${Z_SCORE}_T_${T_SCORE}.aln

# make directory
mkdir -p "$OUTPUT_DIR"


## Querying the HMM profile
# varying e values
hmmsearch -A ${ALN_OUTFILE} -E ${E_VALUE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}
# varying t score
# hmmsearch -A -A ${ALN_OUTFILE} -T ${T_SCORE} ${HMM_INFILE} ${DB_INFILE} > ${SCORE_OUTFILE}