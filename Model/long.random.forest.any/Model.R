## CRC Logic Model
LogicModel_CRC <- list(9, c(2,3))   # 9 | 2 & 3 
dat_CRC <- read.table('~/LOBICO/data/long.random.forest.any/Bi-Normal-CRC.txt')
class_CRC <- read.table('~/LOBICO/data/long.random.forest.any/Normal-CRC-biclass.txt')
model1_CRC <- dat_CRC[LogicModel_CRC[[1]],]
model2_CRC <- dat_CRC[LogicModel_CRC[[2]],]
results_CRC <- (model1_CRC) | (model2_CRC[1,] & model2_CRC[2,])
table_CRC <- table(results_CRC, t(class_CRC))
accuracy_CRC <- (table_CRC[1,1] + table_CRC[2,2])/nrow(class_CRC)
accuracy_CRC
rownames(dat_CRC)[c(LogicModel_CRC[[1]], LogicModel_CRC[[2]])]

## HCC Logic Model
LogicModel_HCC <- list(1,8)      # 1 | 8 
dat_HCC <- read.table('~/LOBICO/data/long.random.forest.any/Bi-Normal-HCC.txt')
class_HCC <- read.table('~/LOBICO/data/long.random.forest.any/Normal-HCC-biclass.txt')
model1_HCC <- dat_HCC[LogicModel_HCC[[1]],]
model2_HCC <- dat_HCC[LogicModel_HCC[[2]],]
results_HCC <- model1_HCC | model2_HCC
table_HCC <- table(results_HCC, t(class_HCC))
accuracy_HCC <- (table_HCC[1,1] + table_HCC[2,2])/nrow(class_HCC)
accuracy_HCC
rownames(dat_HCC)[LogicModel_HCC[[1]]]

## PAAD Logic Model
LogicModel_PAAD <- list(c(4,5), 9, 2)      # ~4 & 5 | 9 | 2
dat_PAAD <- read.table('~/LOBICO/data/long.random.forest.any/Bi-Normal-PAAD.txt')
class_PAAD <- read.table('~/LOBICO/data/long.random.forest.any/Normal-PAAD-biclass.txt')
model1_PAAD <- dat_PAAD[LogicModel_PAAD[[1]],]
model2_PAAD <- dat_PAAD[LogicModel_PAAD[[2]],]
model3_PAAD <- dat_PAAD[LogicModel_PAAD[[3]],]
results_PAAD <- ((!model1_PAAD[1,]) & model1_PAAD[2,] ) | model2_PAAD | model3_PAAD
table_PAAD <- table(results_PAAD, t(class_PAAD))
accuracy_PAAD <- (table_PAAD[1,1] + table_PAAD[2,2])/nrow(class_PAAD)
accuracy_PAAD
rownames(dat_PAAD)[LogicModel_PAAD[[1]]]

long.random.forest.any <- c(accuracy_CRC, accuracy_HCC,accuracy_PAAD)
long.random.forest.any <- as.data.frame(long.random.forest.any)
names(long.random.forest.any) <- "Accuracy"
long.random.forest.any$Type <- c("CRC", "HCC", "PAAD")
long.random.forest.any$model <- c("9 | 2 & 3", "1 | 8", "~4 & 5 | 9 | 2")
long.random.forest.any$method <- c(rep("long.random.forest.any", 3))
write.table(long.random.forest.any, '~/LOBICO/long.random.forest.any.ACCURACY.txt')

