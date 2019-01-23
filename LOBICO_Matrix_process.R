dat <- read.table("~/Downloads/cpm_selected_features.Normal-CRC.txt", sep = '\t', header = T, row.names = 1)
adjust_bi_data <- dat
#bi_data <- dat
#for(i in 1:nrow(dat)){
  for(j in 1:ncol(dat)){
    if(abs(dat[i,j]) >= 0.8){
      bi_data[i,j] = 1
    }
    else{
      bi_data[i,j] = 0
    }
  }
}
#write.table(bi_data, "~/Downloads/bi_cpm_selected_features.Normal-CRC.txt", sep = "\t", row.names = T, col.names = T)

a = nrow(dat)
b = ncol(dat)
for(i in 1:a){
  temp <- sum(dat[i,])/a + 2 * sd(dat[i,])
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

