####期刊影响因子查询
library(scholar)
WO = c("bioinformatics", "livestock science","molecular biosystems", "molecular biology and evolution","nature","science","genome")
a=get_impactfactor(WO)
a
write.table(x = a,file ="F:/新建文件夹/线粒体差异蛋白分析/333242.csv",sep =",", row.names =F, col.names =T, quote =TRUE)

######生信期刊影响因子
biif <- agrep("bioinformatics", scholar:::impactfactor$Journal, ignore.case=T, value=T, max.distance=0.05)
b <- get_impactfactor(biif)
b
write.table(b,file ="F:/新建文件夹/线粒体差异蛋白分析/1234.csv",sep =",", row.names =FALSE, col.names =T, quote =TRUE)
biif
[1] "GENOMICS PROTEOMICS & BIOINFORMATICS"
[2] "BRIEFINGS IN BIOINFORMATICS"
[3] "BIOINFORMATICS"
[4] "IEEE-ACM Transactions on Computational Biology and Bioinformatics"
[5] "PROTEINS-STRUCTURE FUNCTION AND BIOINFORMATICS"
[6] "BMC BIOINFORMATICS"
[7] "Evolutionary Bioinformatics"
[8] "Journal of Bioinformatics and Computational Biology"
[9] "International Journal of Data Mining and Bioinformatics"
[10] "Current Bioinformatics"


#####个人发表文章期刊影响因子
require(scholar)
require(dpylr)

x = get_publications("DO5oG40AAAAJ")
y = x %>% select(year, author, journal, title) %>% 
  + mutate(impactFactor = get_impactfactor(journal)$ImpactFactor) %>% 
  + filter(grepl("^G Yu", author)) %>% group_by(year)
y
