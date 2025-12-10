#!/bin/bash
#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/scripts/star_index_job%j.out
#SBATCH --job-name=star_index
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --partition=msc_appbio

# Load STAR (CORRECT MODULE)
module load star/2.7.10b-gcc-13.2.0

echo "Starting STAR genome indexing (FASTA only)"

# Create output directory
mkdir -p /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/star_index_fasta_only

# Run STAR genome indexing (FASTA ONLY)
STAR \
  --runThreadN 4 \
  --runMode genomeGenerate \
  --genomeDir /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/star_index_fasta_only \
  --genomeFastaFiles /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/custom_combined_genome.fasta \
  --genomeSAindexNbases 10

echo "STAR FASTA-only indexing finished."
