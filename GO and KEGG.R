####ע������
library(clusterProfiler)
hub <- AnnotationHub::AnnotationHub()
query(hub, "bos taurus")
#####ţע�����غͼ���
bostaurus <- hub[['AH62160']]
length(keys("bostaurus"))
columns("bostaurus")


#####���ػ���
sample_genes <- read.table(file = "F:/�½��ļ���/��������쵰�׷���/down.txt")
dim(sample_genes)
sample_genes2 <- as.character(sample_genes$V2)
View(sample_genes2)

###GOenrich
require(clusterProfiler)
myA = enrichGO(sample_genes2, OrgDb=bostaurus, pvalueCutoff=0.05, qvalueCutoff=0.05)
my
#######�������
write.table (x = res, file ="F:/�½��ļ���/��������쵰�׷���/samle_totalGoenrichdown1.csv", sep =",", row.names =TRUE, col.names =T, quote =TRUE)

###����KEGG����
anls = enrichKEGG(g,organism="bta",pvalueCutoff=0.05)
View(anls)
head(anls)
write.table(x = anls,file = "F:/�½��ļ���/��������쵰�׷���/KEGG.csv",sep =",", row.names =FALSE, col.names =T, quote =TRUE)