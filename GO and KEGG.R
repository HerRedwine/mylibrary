####注释下载
library(clusterProfiler)
hub <- AnnotationHub::AnnotationHub()
query(hub, "bos taurus")
#####牛注释下载和检验
bostaurus <- hub[['AH62160']]
length(keys("bostaurus"))
columns("bostaurus")


#####加载基因
sample_genes <- read.table(file = "F:/新建文件夹/线粒体差异蛋白分析/down.txt")
dim(sample_genes)
sample_genes2 <- as.character(sample_genes$V2)
View(sample_genes2)

###GOenrich
require(clusterProfiler)
myA = enrichGO(sample_genes2, OrgDb=bostaurus, pvalueCutoff=0.05, qvalueCutoff=0.05)
my
#######输出数据
write.table (x = res, file ="F:/新建文件夹/线粒体差异蛋白分析/samle_totalGoenrichdown1.csv", sep =",", row.names =TRUE, col.names =T, quote =TRUE)

###本地KEGG分析
anls = enrichKEGG(g,organism="bta",pvalueCutoff=0.05)
View(anls)
head(anls)
write.table(x = anls,file = "F:/新建文件夹/线粒体差异蛋白分析/KEGG.csv",sep =",", row.names =FALSE, col.names =T, quote =TRUE)
