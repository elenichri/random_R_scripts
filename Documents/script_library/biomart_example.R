
###########  Foreground  #########################
# Load the foreground genes: Sonia's list of 6600 transcript utrs. I have kept only the ones that are > 1000 long
foreground = read.table('~/Data/DeepBind/foreground.txt')
input = foreground[,1]


unique.ensembl.utr = list()
if(interactive()){
  mart = useMart("ensembl", dataset="hsapiens_gene_ensembl")
  ## head(listAttributes(mart)) # to check the biomart attributes
  for(i in 1:length(levels(input))){
    unique.ensembl.utr[[i]] = list()
    #ensembl.symbol.all = getBM(attributes=c("ensembl_gene_id","5utr"), mart=mart)  # this gives error in connecting 
    unique.ensembl.utr[[i]] = getBM(attributes=c("chromosome_name", "5utr", "5_utr_start", "5_utr_end", "ensembl_gene_id"), filters = 'ensembl_gene_id', values = (levels(input))[i] , mart=mart) 
  }
}

save(unique.ensembl.utr,file='Sonia_EnsemblGenes_UTRs_Pos.RData') #contains the sequences a