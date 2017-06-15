source("https://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
biocLite("TxDb.Hsapiens.UCSC.hg19.knownGene")
biocLite("GenVisR")
biocLite("BSgenome.Hsapiens.UCSC.hg19")

library("GenVisR")
# Load transcript meta data
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

# Load BSgenome
library(BSgenome.Hsapiens.UCSC.hg19)

genome <- BSgenome.Hsapiens.UCSC.hg19

# Define a region of interest
gr <- GRanges(seqnames = c("chr10"), ranges = IRanges(start = c(89622195), end = c(89729532)), 
              strand = strand(c("+")))

# Create Data for input
start <- c(89622194:89729524)
end <- c(89622195:89729525)
chr <- 10
cov <- c(rnorm(1e+05, mean = 40), rnorm(7331, mean = 10))
cov_input_A <- as.data.frame(cbind(chr, start, end, cov))

start <- c(89622194:89729524)
end <- c(89622195:89729525)
chr <- 10
cov <- c(rnorm(50000, mean = 40), rnorm(7331, mean = 10), rnorm(50000, mean = 40))
cov_input_B <- as.data.frame(cbind(chr, start, end, cov))
cov_input_B

# Define the data as a list
data <- list(`Sample A` = cov_input_A, `Sample B` = cov_input_B)

# Call genCov
genCov(data, txdb, gr, genome, gene_labelTranscriptSize = 2, transform = NULL, 
       base = NULL)

genCov(data, txdb, gr, genome, transform = c("Intron", "CDS", "UTR"), base = c(10, 2, 2), reduce = TRUE)
