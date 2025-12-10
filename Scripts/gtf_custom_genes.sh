#!/bin/bash
#SBATCH --output=/scratch/grp/msc_appbio/Group17_ABCC/ref_genome/gtf_custom_genes_job%j.out
#SBATCH --job-name=gtf_custom_genes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --partition=msc_appbio

echo "Adding custom genes to GTF..."

cd /scratch/grp/msc_appbio/Group17_ABCC/ref_genome/

# Get sequence lengths from FASTA
gh1_len=$(grep -A 100000 -m 1 ">gh1_1_CDS" custom_combined_genome.fasta | tail -n +2 | tr -d '\n' | wc -c)
cdt1_len=$(grep -A 100000 -m 1 ">cdt1_egfp" custom_combined_genome.fasta | tail -n +2 | tr -d '\n' | wc -c)

echo "gh1_1_CDS length (bp): $gh1_len"
echo "cdt1_egfp length (bp): $cdt1_len"

cat <<EOF >> gene_annotation_yeast.gtf
gh1_1_CDS       custom  gene    1       $gh1_len        .       +       .           gene_id "gh1_1_CDS";
gh1_1_CDS       custom  transcript      1       $gh1_len        .       +           .       gene_id "gh1_1_CDS"; transcript_id "gh1_1_CDS.t1";
gh1_1_CDS       custom  exon    1       $gh1_len        .       +       .           gene_id "gh1_1_CDS"; transcript_id "gh1_1_CDS.t1"; exon_number "1";

cdt1_egfp       custom  gene    1       $cdt1_len       .       +       .           gene_id "cdt1_egfp";
cdt1_egfp       custom  transcript      1       $cdt1_len       .       +           .       gene_id "cdt1_egfp"; transcript_id "cdt1_egfp.t1";
cdt1_egfp       custom  exon    1       $cdt1_len       .       +       .           gene_id "cdt1_egfp"; transcript_id "cdt1_egfp.t1"; exon_number "1";
EOF

echo "Custom genes successfully added to gtf."
