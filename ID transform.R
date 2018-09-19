####����R��
library(clusterProfiler)
library(topGO)

######Ѱ�Ҳο�������
hub <- AnnotationHub::AnnotationHub()
query(hub, "bos taurus")
bostaurus <- hub[['AH62160']]
length(keys(bostaurus))
columns(bostaurus)

######ID Transformation
cow<-read.table(file = "F:/�½��ļ���/��������쵰�׷���/�µ�����.txt")
View(cow)
dim(cow)
cow2 <- as.character(cow$V1)
View(cow2)

cow.entrez = mapIds(x = (bostaurus),keys = cow2,keytype = "SYMBOL",column = "ENTREZID")
View(cow.entrez)
#####�������
write.table (x = cow.entrez , file ="F:/�½��ļ���/��������쵰�׷���/entreziddown1.csv", sep =",", row.names =TRUE, col.names =T, quote =TRUE)





