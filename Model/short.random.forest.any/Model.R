## CRC Logic Model
LogicModel_CRC <- list(c(1, 9, 10), 5)   # ~1 & 9 & ~10 | ~1 & 5  
dat_CRC <- read.table('~/LOBICO/data/short.random.forest.any/Bi-Normal-CRC.txt')
class_CRC <- read.table('~/LOBICO/data/short.random.forest.any/Normal-CRC-biclass.txt')
model1_CRC <- dat_CRC[LogicModel_CRC[[1]],]
model2_CRC <- dat_CRC[LogicModel_CRC[[2]],]
results_CRC <- ((!model1_CRC[1,]) & (model1_CRC[2,]) & (!model1_CRC[3,])) | 
  (model2_CRC) 
table_CRC <- table(results_CRC, t(class_CRC))
accuracy_CRC <- (table_CRC[1,1] + table_CRC[2,2])/nrow(class_CRC)
recall_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[1,2])
precision_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[2,1])
F1_CRC <- 2 * recall_CRC * precision_CRC / (recall_CRC + precision_CRC)
rownames(dat_CRC)[c(LogicModel_CRC[[1]])]

## CRC S1 Logic Model
LogicModel_CRC_S1 <- list(c(5,7,8))      # ~5 & ~7 & ~8
dat_CRC_S1 <- read.table('~/LOBICO/data/short.random.forest.any/Bi-Normal-CRC_S1.txt')
class_CRC_S1 <- read.table('~/LOBICO/data/short.random.forest.any/Normal-CRC_S1-biclass.txt')
model1_CRC_S1 <- dat_CRC_S1[LogicModel_CRC_S1[[1]],]
results_CRC_S1 <- (!model1_CRC_S1[1,]) & (!model1_CRC_S1[2,]) & (!model1_CRC_S1[3,])
table_CRC_S1 <- table(results_CRC_S1, t(class_CRC_S1))
accuracy_CRC_S1 <- (table_CRC_S1[1,1] + table_CRC_S1[2,2])/nrow(class_CRC_S1)
recall_CRC_S1 <- table_CRC_S1[2,2] / (table_CRC_S1[2,2] + table_CRC_S1[1,2])
precision_CRC_S1 <- table_CRC_S1[2,2] / (table_CRC_S1[2,2] + table_CRC_S1[2,1])
F1_CRC_S1 <- 2 * recall_CRC_S1 * precision_CRC_S1 / (recall_CRC_S1 + precision_CRC_S1)
rownames(dat_CRC_S1)[LogicModel_CRC_S1[[1]]]

#### 下面的内容接下来再做


## PAAD Logic Model
LogicModel_PAAD <- list(c(5,10))      # 5 & 10
dat_PAAD <- read.table('~/LOBICO/data/short.random.forest.any/Bi-Normal-PAAD.txt')
class_PAAD <- read.table('~/LOBICO/data/short.random.forest.any/Normal-PAAD-biclass.txt')
model1_PAAD <- dat_PAAD[LogicModel_PAAD[[1]],]
results_PAAD <- (model1_PAAD[1,]) & (!model1_PAAD[2,])
table_PAAD <- table(results_PAAD, t(class_PAAD))
accuracy_PAAD <- (table_PAAD[1,1] + table_PAAD[2,2])/nrow(class_PAAD)
accuracy_PAAD
rownames(dat_PAAD)[LogicModel_PAAD[[1]]]

short.random.forest.any <- c(accuracy_CRC, accuracy_CRC_S1)
short.random.forest.any <- as.data.frame(short.random.forest.any)
names(short.random.forest.any) <- "Accuracy"
short.random.forest.any$F1 <- c(F1_CRC, F1_CRC_S1)
short.random.forest.any$Type <- c("CRC", "CRC Stage I")
short.random.forest.any$model <- c("~1 & 9 & ~10 | ~1 & 5", "~5 & ~7 & ~8")
short.random.forest.any$method <- c(rep("short.random.forest.any", 2))
write.table(short.random.forest.any, '~/LOBICO/short.random.forest.any.ACCURACY.txt')

