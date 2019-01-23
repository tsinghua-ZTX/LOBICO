dat <- read.table("~/Downloads/cpm_selected_features.Normal-CRC.txt", sep = '\t', header = T, row.names = 1)
bi_data <- dat
adjust_bi_data <- dat
for(i in 1:nrow(dat)){
  for(j in 1:ncol(dat)){
    if(abs(dat[i,j]) >= 0.5){
      bi_data[i,j] = 1
    }
    else{
      bi_data[i,j] = 0
    }
  }
}
write.table(bi_data, "~/Downloads/bi_cpm_selected_features.Normal-CRC.txt", sep = "\t", row.names = T, col.names = T)

for(i in 1:nrow(dat)){
  for(j in 1:ncol(dat)){
    if(dat[i,j] >= 0.6){
      adjust_bi_data[i,j] = 1
    }
    else{
      adjust_bi_data[i,j] = 0
    }
  }
}
write.table(adjust_bi_data, "~/Downloads/adjust_bi_cpm_selected_features.Normal-CRC.txt", sep = "\t", row.names = T, col.names = T)

sum(dat)


