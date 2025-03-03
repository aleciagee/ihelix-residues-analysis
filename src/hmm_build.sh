#!/bin/bash


# assign number for round
BUILD_NO=3


# locations
INPUT_IHELIX="../output/hmm_round_3/Round3_FinalIHelix.fasta"
OUTPUT_DIR=../output/hmm_round_${BUILD_NO}/
IHELIX_ALN=/home/alecia/chapter3-repo/output/hmm_round_3/Round3_FinalIHelix.aln
IHELIX_HMM=${OUTPUT_DIR}ihelix_round3_hmm.hmm


# make directory
mkdir -p "$OUTPUT_DIR"


# alignment via clustal
# clustalo -i ${INPUT_IHELIX} -o ${OUTPUT_DIR}ihelix_round2_hmm.aln --full --outfmt=clu --force

# build hmm profile from alignment
hmmbuild --amino ${IHELIX_HMM} ${IHELIX_ALN}
# --amino forces interpretation as amino acids, important for small sequences where is may be ambiguous

