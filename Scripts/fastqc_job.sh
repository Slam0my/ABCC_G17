#!/bin/bash

#SBATCH --output=scratch/grp/msc_appbio/Group17_ABBC/fastq_files/scripts/fastqc_job%j.out
#SBATCH --job-name=fastq_to_fastqc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=msc_appbio


module load fastqc/0.11.9-gcc-13.2.0

echo "Start of fastqc"

cd /scratch/grp/msc_appbio/Group17_ABCC/fastq_files/

fastqc -o /scratch/grp/msc_appbio/Group17_ABCC/fastqc_report *.fastq

echo "End of fastqc"
