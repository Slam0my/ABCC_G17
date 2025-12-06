#!/bin/bash
#SBATCH --output=/scratch/grp/msc_appbio/group17_ABCC/trimmed_fastqc_%j.out
#SBATCH --job-name=trimmed_fastqc
#SBATCH --time=01:00:00
#SBATCH --nodes=1

module load fastqc/0.11.9-gcc-13.2.0

echo "start of fastqc"

cd /scratch/grp/msc_appbio/Group17_ABCC/trimmed

fastqc *_trimmed.fastq

echo "end of fastqc"
