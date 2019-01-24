dat <- read.table("~/Downloads/cpm_selected_features.Normal-CRC.txt", sep = '\t', header = T, row.names = 1)
adjust_bi_data <- dat
a = nrow(dat)
b = ncol(dat)
for(i in 1:a){
  temp <- sum(dat[i,])/a + sd(dat[i,])
  for(j in 1:b){
    if(dat[i,j] >= temp){
      adjust_bi_data[i,j] <- 1
    }
    else{
      adjust_bi_data[i,j] <- 0
    }
  }
}
write.table(adjust_bi_data, "~/Downloads/adjust_bi_cpm_selected_features.Normal-CRC.txt", sep = "\t", row.names = T, col.names = T)

