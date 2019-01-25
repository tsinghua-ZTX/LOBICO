normal_CRC <- read.table("~/LOBICO/data/long.random.forest.any/selected_feature_cpm_Normal-CRC.txt", 
                  sep = '\t', header = T, row.names = 1)
normal_HCC <- read.table("~/LOBICO/data/long.random.forest.any/selected_feature_cpm_Normal-HCC.txt", 
                         sep = '\t', header = T, row.names = 1)
normal_PAAD <- read.table("~/LOBICO/data/long.random.forest.any/selected_feature_cpm_Normal-PAAD.txt", 
                         sep = '\t', header = T, row.names = 1)
## Normal-CRC part
bi_normal_CRC <- normal_CRC
a = nrow(bi_normal_CRC)
b = ncol(bi_normal_CRC)
for(i in 1:a){
  temp <- sum(normal_CRC[i,])/b
  sample_mean_CRC <- sum(normal_CRC[i,33:44]) / 12
  if(temp <= sample_mean_CRC){
    for(j in 1:b){
      if(normal_CRC[i,j] >= temp + sd(normal_CRC[i,])){
        bi_normal_CRC[i,j] <- 1
      }
      else{
        bi_normal_CRC[i,j] <- 0
      }
    }
  }
  else{
    for(j in 1:b){
      if(normal_CRC[i,j] <= temp - sd(normal_CRC[i,])){
        bi_normal_CRC[i,j] <- 1
      }
      else{
        bi_normal_CRC[i,j] <- 0
      }
    }  
  }
}
write.table(bi_normal_CRC, "~/LOBICO/data/long.random.forest.any/Bi-Normal-CRC.txt",
            sep = "\t", row.names = T, col.names = T)
normal_CRC_class <- c(rep(0, times = 32), rep(1, times = 12))
write.table(normal_CRC_class, "~/LOBICO/data/long.random.forest.any/Normal-CRC-biclass.txt",
            sep = "\t", row.names = F, col.names = F)

## Normal-HCC part
bi_normal_HCC <- normal_HCC
a = nrow(bi_normal_HCC)
b = ncol(bi_normal_HCC)
for(i in 1:a){
  temp <- sum(normal_HCC[i,])/b
  sample_mean_HCC <- sum(normal_HCC[i,33:53]) / 21
  if(temp <= sample_mean_HCC){
    for(j in 1:b){
      if(normal_HCC[i,j] >= temp + sd(normal_HCC[i,])){
        bi_normal_HCC[i,j] <- 1
      }
      else{
        bi_normal_HCC[i,j] <- 0
      }
    }
  }
  else{
    for(j in 1:b){
      if(normal_HCC[i,j] <= temp - sd(normal_HCC[i,])){
        bi_normal_HCC[i,j] <- 1
      }
      else{
        bi_normal_HCC[i,j] <- 0
      }
    }  
  }
}
write.table(bi_normal_HCC, "~/LOBICO/data/long.random.forest.any/Bi-Normal-HCC.txt",
            sep = "\t", row.names = T, col.names = T)
normal_HCC_class <- c(rep(0, times = 32), rep(1, times = 21))
write.table(normal_HCC_class, "~/LOBICO/data/long.random.forest.any/Normal-HCC-biclass.txt",
            sep = "\t", row.names = F, col.names = F)

## Normal-PAAD part
bi_normal_PAAD <- normal_PAAD
a = nrow(bi_normal_PAAD)
b = ncol(bi_normal_PAAD)
for(i in 1:a){
  temp <- sum(normal_PAAD[i,])/b
  sample_mean_PAAD <- sum(normal_PAAD[i,33:46]) / 14
  if(temp <= sample_mean_PAAD){
    for(j in 1:b){
      if(normal_PAAD[i,j] >= temp + sd(normal_PAAD[i,])){
        bi_normal_PAAD[i,j] <- 1
      }
      else{
        bi_normal_PAAD[i,j] <- 0
      }
    }
  }
  else{
    for(j in 1:b){
      if(normal_PAAD[i,j] <= temp - sd(normal_PAAD[i,])){
        bi_normal_PAAD[i,j] <- 1
      }
      else{
        bi_normal_PAAD[i,j] <- 0
      }
    }  
  }
}
write.table(bi_normal_PAAD, "~/LOBICO/data/long.random.forest.any/Bi-Normal-PAAD.txt",
            sep = "\t", row.names = T, col.names = T)
normal_PAAD_class <- c(rep(0, times = 32), rep(1, times = 14))
write.table(normal_PAAD_class, "~/LOBICO/data/long.random.forest.any/Normal-PAAD-biclass.txt",
            sep = "\t", row.names = F, col.names = F)
