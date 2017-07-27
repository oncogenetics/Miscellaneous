# About -------------------------------------------------------------------
# 28/06/2017
#
# Example code to read and subset Cambridge files for genotypes.
# 


# Workspace ---------------------------------------------------------------
library(data.table)

setwd("N:/Translational Cancer Genetics Team/Bioinformatics/Scripts/SubsetGenotypeExample")


# Read raw Cambridge genotype data ----------------------------------------
# columns are SNPs and rows are Samples
# Note: prefer to use data.table::fread, as it is faster compared to read.table.
# check.names option is FALSE, so the SNP names stay same.
genotype <- fread("geno.txt", header = TRUE, check.names = FALSE)

# MAP index file ----------------------------------------------------------
# like plink format
MAP <- data.frame(
  CHR = NA,
  SNP = colnames(genotype)[ -1 ],
  BP = NA,
  ix = seq(ncol(genotype) - 1))

# FAM file ----------------------------------------------------------------
# like plink format
FAM <- data.frame(
  FID = genotype$SNP,
  IID = genotype$SNP,
  FatherID = 0,
  MotherID = 0,
  Sex = 1,
  CaCo = NA,
  ix = seq(nrow(genotype)))

# Genotype data -----------------------------------------------------------
# drop sample column
GENO <- genotype[, 2:ncol(genotype)]

# Example: subset SNPs ----------------------------------------------------
mySNPs <- c("107", "1165", "1173")

SNP_ix <- MAP[ MAP$SNP %in% mySNPs, "ix"]
GENO[ , SNP_ix, with = FALSE]

# Example: subset Samples -------------------------------------------------
mySamples <- c(9017, 9023, 9034)

Sample_ix <- FAM[ FAM$FID %in% mySamples, "ix"]
GENO[ Sample_ix, ]

# Example: subset SNPs and Samples ----------------------------------------
mySNPs <- c("107", "1165", "1173")
mySamples <- c(9017, 9023, 9034)

SNP_ix <- MAP[ MAP$SNP %in% mySNPs, "ix"]
Sample_ix <- FAM[ FAM$FID %in% mySamples, "ix"]

GENO[ Sample_ix, SNP_ix, with = FALSE]
