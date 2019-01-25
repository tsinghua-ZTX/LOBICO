## CRC Logic Model
LogicModel_CRC <- list(1,3)   # 1 | 3
dat_CRC <- read.table('~/LOBICO/data/long.random.forest.down/Bi-Normal-CRC.txt')
class_CRC <- read.table('~/LOBICO/data/long.random.forest.down/Normal-CRC-biclass.txt')
model1_CRC <- dat_CRC[LogicModel_CRC[[1]],]
model2_CRC <- dat_CRC[LogicModel_CRC[[2]],]
results_CRC <- (model1_CRC) | (model2_CRC)
table_CRC <- table(results_CRC, t(class_CRC))
accuracy_CRC <- (table_CRC[1,1] + table_CRC[2,2])/nrow(class_CRC)
recall_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[1,2])
precision_CRC <- table_CRC[2,2] / (table_CRC[2,2] + table_CRC[2,1])
F1_CRC <- 2 * recall_CRC * precision_CRC / (recall_CRC + precision_CRC)
rownames(dat_CRC)[c(LogicModel_CRC[[1]], LogicModel_CRC[[2]])]

## HCC Logic Model
LogicModel_HCC <- list(4, c(3,4))      # 4 | 3 & ~4  
dat_HCC <- read.table('~/LOBICO/data/long.random.forest.down/Bi-Normal-HCC.txt')
class_HCC <- read.table('~/LOBICO/data/long.random.forest.down/Normal-HCC-biclass.txt')
model1_HCC <- dat_HCC[LogicModel_HCC[[1]],]
model2_HCC <- dat_HCC[LogicModel_HCC[[2]],]
results_HCC <- (model1_HCC) | ((model2_HCC[1,]) & (!model2_HCC[2,]) )
table_HCC <- table(results_HCC, t(class_HCC))
accuracy_HCC <- (table_HCC[1,1] + table_HCC[2,2])/nrow(class_HCC)
recall_HCC <- table_HCC[2,2] / (table_HCC[2,2] + table_HCC[1,2])
precision_HCC <- table_HCC[2,2] / (table_HCC[2,2] + table_HCC[2,1])
F1_HCC <- 2 * recall_HCC * precision_HCC / (recall_HCC + precision_HCC)
rownames(dat_HCC)[LogicModel_HCC[[1]]]

## PAAD Logic Model
LogicModel_PAAD <- list(5, c(3,10))      # 5 | ~3 & 10 
dat_PAAD <- read.table('~/LOBICO/data/long.random.forest.down/Bi-Normal-PAAD.txt')
class_PAAD <- read.table('~/LOBICO/data/long.random.forest.down/Normal-PAAD-biclass.txt')
model1_PAAD <- dat_PAAD[LogicModel_PAAD[[1]],]
model2_PAAD <- dat_PAAD[LogicModel_PAAD[[2]],]
results_PAAD <- (model1_PAAD[1,]) | ((!model2_PAAD[1,]) & model2_PAAD[2,])
table_PAAD <- table(results_PAAD, t(class_PAAD))
accuracy_PAAD <- (table_PAAD[1,1] + table_PAAD[2,2])/nrow(class_PAAD)
recall_PAAD <- table_PAAD[2,2] / (table_PAAD[2,2] + table_PAAD[1,2])
precision_PAAD <- table_PAAD[2,2] / (table_PAAD[2,2] + table_PAAD[2,1])
F1_PAAD <- 2 * recall_PAAD * precision_PAAD / (recall_PAAD + precision_PAAD)
rownames(dat_PAAD)[LogicModel_PAAD[[1]]]

long.random.forest.down <- c(accuracy_CRC, accuracy_HCC,accuracy_PAAD)
long.random.forest.down <- as.data.frame(long.random.forest.down)
names(long.random.forest.down) <- "Accuracy"
long.random.forest.down$F1 <- c(F1_CRC, F1_HCC, F1_PAAD)
long.random.forest.down$Precision <- c(precision_CRC, precision_HCC, precision_PAAD)
long.random.forest.down$Recall <- c(recall_CRC, recall_HCC, recall_PAAD)
long.random.forest.down$Type <- c("CRC", "HCC", "PAAD")
long.random.forest.down$model <- c("1 | 3", "4 | 3 & ~4", "5 | ~3 & 10")
long.random.forest.down$method <- c(rep("long.random.forest.down", 3))
write.table(long.random.forest.down, '~/LOBICO/long.random.forest.down.ACCURACY.txt')

