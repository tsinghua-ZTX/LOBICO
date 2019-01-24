## CRC Logic Model
LogicModel_CRC <- list(7, c(6,9))   # 7 | (6 & 9)
dat_CRC <- read.table('~/LOBICO/data/long.random.forest.any/Bi-Normal-CRC.txt')
class_CRC <- read.table('~/LOBICO/data/long.random.forest.any/Normal-CRC-biclass.txt')
model1_CRC <- dat_CRC[LogicModel_CRC[[1]],]
model2_CRC <- dat_CRC[LogicModel_CRC[[2]],]
results_CRC <- (model1_CRC) | (model2_CRC[1,] | model2_CRC[2,])
table_CRC <- table(results_CRC, t(class_CRC))
accuracy_CRC <- (table_CRC[1,1] + table_CRC[2,2])/nrow(class_CRC)
accuracy_CRC
rownames(dat_CRC)[c(LogicModel_CRC[[1]], LogicModel_CRC[[2]])]

## HCC Logic Model
LogicModel_HCC <- list(c(3,6))      # ~3 & ~6
dat_HCC <- read.table('~/LOBICO/data/long.random.forest.any/Bi-Normal-HCC.txt')
class_HCC <- read.table('~/LOBICO/data/long.random.forest.any/Normal-HCC-biclass.txt')
model1 <- dat_HCC[LogicModel_HCC[[1]],]
model1_HCC <- dat_HCC[LogicModel_HCC[[1]],]
results_HCC <- (!model1_HCC[1,]) & (!model1_HCC[2,])
table_HCC <- table(results_HCC, t(class_HCC))
accuracy_HCC <- (table_HCC[1,1] + table_HCC[2,2])/nrow(class_HCC)
accuracy_HCC
rownames(dat_HCC)[LogicModel_HCC[[1]]]
