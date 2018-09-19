####更新R包
rvcheck::update_all()

####GitHub装R包
library(devtools)
install_github("twitter/AnomalyDetection")
##方法二
library(githubinstall)
githubinstall("dpylr")

##
source("https://bioconductor.org/biocLite.R")
biocLite("asreml")