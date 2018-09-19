####加载R包
library(clusterProfiler)
library(topGO)

######寻找参考基因组
hub <- AnnotationHub::AnnotationHub()
query(hub, "bos taurus")
bostaurus <- hub[['AH62160']]
length(keys(bostaurus))
columns(bostaurus)

######ID Transformation
cow<-read.table(file = "F:/新建文件夹/线粒体差异蛋白分析/下调蛋白.txt")
View(cow)
dim(cow)
cow2 <- as.character(cow$V1)
View(cow2)

cow.entrez = mapIds(x = (bostaurus),keys = cow2,keytype = "SYMBOL",column = "ENTREZID")
View(cow.entrez)
#####输出数据
write.table (x = cow.entrez , file ="F:/新建文件夹/线粒体差异蛋白分析/entreziddown1.csv", sep =",", row.names =TRUE, col.names =T, quote =TRUE)






