## CRC Logic Model
LogicModel_CRC <- list(c(1, 2, 9), c(7,8))   # ~1 & ~2 & ~9 | ~7 & 8   
dat_CRC <- read.table('~/LOBICO/data/short.random.forest.up/Bi-Normal-CRC.txt')
class_CRC <- read.table('~/LOBICO/data/short.random.forest.up/Normal-CRC-biclass.txt')
model1_CRC <- dat_CRC[LogicModel_CRC[[1]],]
model2_CRC <- dat_CRC[LogicModel_CRC[[2]],]
results_CRC <- ((!model1_CRC[1,]) & (!model1_CRC[2,]) & (!model1_CRC[3,])) | 
  ((!model2_CRC[1,]) & model2_CRC[2,]) 
table_CRC <- table(results_CRC, t(class_CRC))
accuracy_CRC <- (table_CRC[1,1] + table_CRC[2,2])/nrow(class_CRC)
recall_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[1,2])
precision_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[2,1])
F1_CRC <- 2 * recall_CRC * precision_CRC / (recall_CRC + precision_CRC)
rownames(dat_CRC)[c(LogicModel_CRC[[1]])]

## CRC S1 Logic Model
LogicModel_CRC_S1 <- list(c(1,5,9), c(1,2,10))      # 1 & ~5 & 9 | ~1 & 2 & ~10 
dat_CRC_S1 <- read.table('~/LOBICO/data/short.random.forest.up/Bi-Normal-CRC_S1.txt')
class_CRC_S1 <- read.table('~/LOBICO/data/short.random.forest.up/Normal-CRC_S1-biclass.txt')
model1_CRC_S1 <- dat_CRC_S1[LogicModel_CRC_S1[[1]],]
model2_CRC_S1 <- dat_CRC_S1[LogicModel_CRC_S1[[2]],]
results_CRC_S1 <- (model1_CRC_S1[1,] & (!model1_CRC_S1[2,]) & model1_CRC_S1[3,]) | 
  ((!model2_CRC_S1[1,]) & (model2_CRC_S1[2,]) & (!model2_CRC_S1[3,]))
table_CRC_S1 <- table(results_CRC_S1, t(class_CRC_S1))
accuracy_CRC_S1 <- (table_CRC_S1[1,1] + table_CRC_S1[2,2])/nrow(class_CRC_S1)
recall_CRC_S1 <- table_CRC_S1[2,2] / (table_CRC_S1[2,2] + table_CRC_S1[1,2])
precision_CRC_S1 <- table_CRC_S1[2,2] / (table_CRC_S1[2,2] + table_CRC_S1[2,1])
F1_CRC_S1 <- 2 * recall_CRC_S1 * precision_CRC_S1 / (recall_CRC_S1 + precision_CRC_S1)
rownames(dat_CRC_S1)[LogicModel_CRC_S1[[1]]]

#### 下面的内容接下来再做


## PAAD Logic Model
#LogicModel_PAAD <- list(c(5,10))      # 5 & 10
#dat_PAAD <- read.table('~/LOBICO/data/short.random.forest.up/Bi-Normal-PAAD.txt')
#class_PAAD <- read.table('~/LOBICO/data/short.random.forest.up/Normal-PAAD-biclass.txt')
#model1_PAAD <- dat_PAAD[LogicModel_PAAD[[1]],]
#results_PAAD <- (model1_PAAD[1,]) & (!model1_PAAD[2,])
#table_PAAD <- table(results_PAAD, t(class_PAAD))
#accuracy_PAAD <- (table_PAAD[1,1] + table_PAAD[2,2])/nrow(class_PAAD)
#accuracy_PAAD
#rownames(dat_PAAD)[LogicModel_PAAD[[1]]]

short.random.forest.up <- c(accuracy_CRC, accuracy_CRC_S1)
short.random.forest.up <- as.data.frame(short.random.forest.up)
names(short.random.forest.up) <- "Accuracy"
short.random.forest.up$F1 <- c(F1_CRC, F1_CRC_S1)
short.random.forest.up$Precision <- c(precision_CRC, precision_CRC_S1)
short.random.forest.up$Recall <- c(recall_CRC, recall_CRC_S1)
short.random.forest.up$Type <- c("CRC", "CRC Stage I")
short.random.forest.up$model <- c("~1 & ~2 & ~9 | ~7 & 8 ", "1 & ~5 & 9 | ~1 & 2 & ~10 ")
short.random.forest.up$method <- c(rep("short.random.forest.up", 2))
write.table(short.random.forest.up, '~/LOBICO/short.random.forest.up.ACCURACY.txt')

