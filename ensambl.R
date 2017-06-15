library(biomaRt)
ensembl = useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl")
hgnc_swissprot <- getBM(attributes=c('ensembl_gene_id','ensembl_transcript_id','hgnc_symbol','hgnc_id','uniprot_swissprot'),filters = 'ensembl_gene_id', values = 'ENSG00000139618', mart = ensembl)
hgnc_swissprot
