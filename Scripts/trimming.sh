#!/bin/bash

#SBATCH --output=/scratch/grp/msc_appbio/group17_ABCC/trimming_job_%j.out
#SBATCH --job-name=trimming
#SBATCH --time=01:00:00
#SBATCH --nodes=1

module load py-cutadapt/4.4-gcc-13.2.0-python-3.11.6

FASTQ_DIR=/scratch/grp/msc_appbio/Group17_ABCC/fastq_files

OUTPUT_DIR=/scratch/grp/msc_appbio/Group17_ABCC/trimmed
mkdir -p $OUTPUT_DIR

ADAPTER="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"

SAMPLES=(
SRR1166442
SRR1166443
SRR1166444
SRR1166445
SRR1166446
SRR1166447
)

for s in "${SAMPLES[@]}"; do
    if [[ ! -f "${FASTQ_DIR}/${s}.fastq" ]]; then
        echo "Warning: ${s}.fastq not found, skipping..."
        continue
    fi

    echo "Trimming adapters from $s.fastq..."
    cutadapt -a $ADAPTER -o ${OUTPUT_DIR}/${s}_trimmed.fastq ${FASTQ_DIR}/${s}.fastq --cores=4
    echo "Finished $s"
done

echo "All samples trimmed!"
