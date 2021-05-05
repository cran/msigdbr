## ----setup, include = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
# increase the screen width
options(width = 90)
# reduce the minimum number of characters for the tibble column titles (default: 15)
options(pillar.min_title_chars = 10)
# increase the maximum number of rows printed (default: 20)
options(tibble.print_max = 25)

## ----install-package, eval=FALSE--------------------------------------------------------
#  install.packages("msigdbr")

## ----load-package, message=FALSE--------------------------------------------------------
library(msigdbr)

## ----msigdbr-mouse-all------------------------------------------------------------------
all_gene_sets = msigdbr(species = "Mus musculus")
head(all_gene_sets)

## ----species----------------------------------------------------------------------------
msigdbr_species()

## ----msigdbr-mouse-h--------------------------------------------------------------------
h_gene_sets = msigdbr(species = "mouse", category = "H")
head(h_gene_sets)

## ----msigdbr-mouse-c2-------------------------------------------------------------------
cgp_gene_sets = msigdbr(species = "mouse", category = "C2", subcategory = "CGP")
head(cgp_gene_sets)

## ----collections------------------------------------------------------------------------
msigdbr_collections()

## ----filter-h---------------------------------------------------------------------------
all_gene_sets %>%
  dplyr::filter(gs_cat == "H") %>%
  head()

## ----cp-entrez, eval=FALSE--------------------------------------------------------------
#  msigdbr_t2g = msigdbr_df %>% dplyr::distinct(gs_name, entrez_gene) %>% as.data.frame()
#  enricher(gene = gene_ids_vector, TERM2GENE = msigdbr_t2g, ...)

## ----cp-symbols, eval=FALSE-------------------------------------------------------------
#  msigdbr_t2g = msigdbr_df %>% dplyr::distinct(gs_name, gene_symbol) %>% as.data.frame()
#  enricher(gene = gene_symbols_vector, TERM2GENE = msigdbr_t2g, ...)

## ----fgsea, eval=FALSE------------------------------------------------------------------
#  msigdbr_list = split(x = msigdbr_df$gene_symbol, f = msigdbr_df$gs_name)
#  fgsea(pathways = msigdbr_list, ...)

## ----gsva, eval=FALSE-------------------------------------------------------------------
#  msigdbr_list = split(x = msigdbr_df$gene_symbol, f = msigdbr_df$gs_name)
#  gsva(gset.idx.list = msigdbr_list, ...)

