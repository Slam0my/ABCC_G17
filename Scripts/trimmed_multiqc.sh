#!/bin/bash
#SBATCH --output=/scratch/grp/msc_appbio/group17_ABCC/trimmed_multiqc_%j.out
#SBATCH --job-name=trimmed_multiqc
#SBATCH --time=01:00:00
#SBATCH --nodes=1

module load py-multiqc/1.15-gcc-13.2.0-python-3.11.6

echo "Running Multiqc on trimmed files"

TRIM_DIR=/scratch/grp/msc_appbio/group17_ABCC/trimmed

OUT_DIR=/scratch/grp/msc_appbio/group17_ABCC/trimmed_multiqc

mkdir -p /scratch/grp/msc_appbio/group17_ABCC/trimmed_multiqc

multiqc $TRIM_DIR -o $OUT_DIR

echo "MultiQC completed. Report saved to: $OUT_DIR"
