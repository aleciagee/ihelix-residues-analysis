#!/bin/bash


# assign number for round
BUILD_NO=$1


# locations
INPUT_IHELIX="../input/ihelix_eachfamily_nohit_cleaned_r1.fasta"
OUTPUT_DIR=../output/hmm_round_${BUILD_NO}/
IHELIX_ALN=${OUTPUT_DIR}ihelix_round2_hmm.aln
IHELIX_HMM=${OUTPUT_DIR}ihelix_round2_hmm.hmm


# make directory
mkdir -p "$OUTPUT_DIR"


# alignment via clustal
clustalo -i ${INPUT_IHELIX} -o ${OUTPUT_DIR}ihelix_round2_hmm.aln --full --outfmt=clu --force

# build hmm profile from alignment
hmmbuild --amino ${IHELIX_HMM} ${IHELIX_ALN}
# --amino forces interpretation as amino acids, important for small sequences where is may be ambiguous

