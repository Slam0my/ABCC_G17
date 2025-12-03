#!/bin/bash

#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/scripts/sra_job%j.out
#SBATCH --job-name=sra_to_fastq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=msc_appbio

module load sra-tools/3.0.3-gcc-13.2.0

echo "Start of SRA conversion to fastq"

cd /scratch/grp/msc_appbio/Group17_ABCC/SRA_raw_data

fasterq-dump --split-files -O /scratch/grp/msc_appbio/Group17_ABCC/fastq_files *.sra

echo "End of fastq conversion"
