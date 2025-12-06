#!/bin/bash
#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/ref_genome/genome_size_job%j.out
#SBATCH --job-name=genome_size
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --partition=msc_appbio

echo "Checking genome size..."

cd /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/

# Count total base pairs (no headers)
bp=$(grep -v "^>" combined_yeast_ref_genome.fasta | tr -d '\n' | wc -c)

echo "Total base pairs (bp): $bp"

# Convert to megabases (Mb) manually — printed in one line
echo "Genome size in Mb: $(echo "$bp / 1000000" | bc -l)"

echo "Done."
