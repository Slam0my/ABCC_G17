#!/bin/bash

#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/ref_genome/combined_ref_job%j.out
#SBATCH --job-name=make_combined_ref
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:30:00
#SBATCH --partition=msc_appbio

echo "Start combining genome"

cd /scratch/grp/msc_appbio/Group17_ABCC/ref_genome

cat yeast_reference_genome.fna \
    gh1_1_CDS.fasta \
    cdt1_egfp.fasta \
    > custom_combined_genome.fasta

echo "Done combining genome"
