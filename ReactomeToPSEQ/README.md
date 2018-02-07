ReactomeToPSEQ
==============

Separate [Reactome](http://www.reactome.org/download/) pathways into single files per pathway - R

### Example rows from [Reactome Pathways Gene Set](http://www.reactome.org/download/current/ReactomePathways.gmt.zip):
```
AKT phosphorylates targets in the nucleus	Reactome Pathway	AKT1	AKT2	AKT3	CREB1	FOXO1	FOXO3	FOXO4	NR4A1	RPS6KB2
AKT-mediated inactivation of FOXO1A	Reactome Pathway	AKT1	AKT2	AKT3	FOXO1
```

### Example output files:
*REACTOME_AKT_phosphorylates_targets_in_the_nucleus.txt*
```
AKT1
AKT2
AKT3
CREB1
FOXO1
FOXO3
FOXO4
NR4A1
RPS6KB2
```

*REACTOME_AKTmediated_inactivation_of_FOXO1A.txt*
```
AKT1
AKT2
AKT3
FOXO1
```

### PSEQ usage
http://atgu.mgh.harvard.edu/plinkseq/masks.shtml#locdb
> More than one specific locus can be included as a comma-delimited list following the specification of the group:

> `loc.subset={group},locus1,locus2,... `

> Also, using the @ file inclusion option on the command line can load a list of loci/genes from a file:

> `loc.subset=CCDS,@my_gene_list.txt`

> assuming the file my_gene_list.txt is a plain-text file that contains a list of CCDS gene IDs. Entries in a .subset that do not match with the LOCDB will be ignored.
