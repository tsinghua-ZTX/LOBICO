Normal_CRC <- read.table("~/Downloads/adjust_bi_cpm_selected_features.Normal-CRC.txt", header = T, row.names = 1)
Log.Model.Normal_CRC <- list(5, c(1,7))
model1 <- Normal_CRC[Log.Model.Normal_CRC[[1]],]
model2 <- Normal_CRC[Log.Model.Normal_CRC[[2]],]
results <- (model1) | (model2[1,] | model2[2,])
sample_class <- c(rep(0, times = 32), rep(1, times = 12))
table(results, sample_class)
