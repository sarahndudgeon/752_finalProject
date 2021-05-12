## Separate out only the chromosome that we want: 13
bgzip -c Z.variantCall.SNPs.vcf > myvcf.vcf.gz #zip the vcf file using bgzip -> file should output .gz zip format
tabix -p vcf myvcf.vcf.gz #index the TAB-separated file, which contains strings
tabix myvcf.vcf.gz chr13 > chr13.vcf #store only the chr13 section as chr13.vcf


#use vcf tools to remove all of the non-passing SNPs
vcftools  --vcf  VCF_FILE  --chr 13  --recode --recode-INFO-all --out  VCF_13 #take all the metadata from the INFO section and separate it out into new columns
