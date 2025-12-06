#!/bin/bash

#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/ref_genome/cdt1_egfp_job%j.out
#SBATCH --job-name=make_cdt1_egfp
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=msc_appbio

echo "Start of cdt1_egfp fusion"

cd /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/

# Step 1: remove stop codon from cdt1_CDS
sed '1d' cdt-1_CDS.fasta | tr -d '\n' | sed 's/...$//' > cdt1_noSTOP.seq

# Step 2: convert sequences to one-line format
grep -v "^>" cdt1_noSTOP.seq | tr -d '\n' > cdt1.seq
grep -v "^>" EGFP_CDS.fasta   | tr -d '\n' > egfp.seq

# Step 3: create the fused cdt1_egfp FASTA
echo ">cdt1_egfp" > cdt1_egfp.fasta
cat cdt1.seq egfp.seq >> cdt1_egfp.fasta

echo "End of cdt1_egfp fusion"
