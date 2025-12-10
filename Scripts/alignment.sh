#!/bin/bash

#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/scripts/star_clean_ali
gn_%j.out
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=msc_appbio

module load seqtk/1.4-gcc-13.2.0
module load star/2.7.10b-gcc-13.2.0
module load samtools/1.17-gcc-13.2.0-python-3.11.6

# Directories
trim_dir=/scratch/grp/msc_appbio/Group17_ABCC/trimmed
clean_trim_dir=/scratch/grp/msc_appbio/Group17_ABCC/trimmed_cleaned
alignment_dir=/scratch/grp/msc_appbio/Group17_ABCC/alignment_star
index_dir=/scratch/grp/msc_appbio/Group17_ABCC/star_index

mkdir -p $clean_trim_dir
mkdir -p $alignment_dir

echo "Start of cleaning the trimmed and alignment"

# Loop for all 6 files
for f in $trim_dir/*_trimmed.fastq; do
    sample=$(basename $f _trimmed.fastq)

    # 1. Clean the trimmed reads
    clean_FASTQ=$clean_trim_dir/${sample}_trimmed_clean.fastq
    echo "Cleaning $f "
    seqtk seq -L 1 $f > $clean_FASTQ

    # 2. Alignment on the cleaned trimmed reads
    echo "Aligning $clean_FASTQ "
    STAR \
        --runThreadN 4 \
        --genomeDir $index_dir \
        --readFilesIn $clean_FASTQ \
        --outFileNamePrefix $alignment_dir/${sample}_ \
        --outSAMtype BAM SortedByCoordinate
done

echo "End of cleaning the trimmed and alignment"
