library(dplyr)
normal_CRC_S1 <- read.table("~/LOBICO/data/short.random.forest.any/selected_feature_cpm_Normal-CRC_S1.txt", 
                  sep = '\t', header = T, row.names = 1)
normal_CRC <- read.table("~/LOBICO/data/short.random.forest.any/selected_feature_cpm_Normal-CRC.txt", 
                            sep = '\t', header = T, row.names = 1)
normal_PRAD <- read.table("~/LOBICO/data/short.random.forest.any/selected_feature_cpm_Normal-PRAD.txt", 
                         sep = '\t', header = T, row.names = 1)
normal_PAAD <- read.table("~/LOBICO/data/short.random.forest.any/selected_feature_cpm_Normal-PAAD.txt", 
                         sep = '\t', header = T, row.names = 1)

## Normal-CRC part
bi_normal_CRC <- normal_CRC
bi_normal_CRC <- as.data.frame(t(bi_normal_CRC))
bi_normal_CRC$names <- rownames(bi_normal_CRC)
bi_normal_CRC <- arrange(bi_normal_CRC, names)
rownames(bi_normal_CRC) <- bi_normal_CRC$names
bi_normal_CRC <- as.data.frame(t(bi_normal_CRC[,-11]))

a = nrow(bi_normal_CRC)
b = ncol(bi_normal_CRC)
for(i in 1:a){
  temp <- sum(normal_CRC[i,])/b + sd(normal_CRC[i,])
  for(j in 1:b){
    if(normal_CRC[i,j] >= temp){
      bi_normal_CRC[i,j] <- 1
    }
    else{
      bi_normal_CRC[i,j] <- 0
    }
  }
}
write.table(bi_normal_CRC, "~/LOBICO/data/short.random.forest.any/Bi-Normal-CRC.txt",
            sep = "\t", row.names = T, col.names = T)
normal_CRC_class <- c(rep(1, times = 100), rep(0, times = 50))
write.table(normal_CRC_class, "~/LOBICO/data/short.random.forest.any/Normal-CRC-biclass.txt",
            sep = "\t", row.names = F, col.names = F)

## Normal-CRC_S1 part
bi_normal_CRC_S1 <- normal_CRC_S1
bi_normal_CRC_S1 <- as.data.frame(t(bi_normal_CRC_S1))
bi_normal_CRC_S1$names <- rownames(bi_normal_CRC_S1)
bi_normal_CRC_S1 <- arrange(bi_normal_CRC_S1, names)
rownames(bi_normal_CRC_S1) <- bi_normal_CRC_S1$names
bi_normal_CRC_S1 <- as.data.frame(t(bi_normal_CRC_S1[,-11]))


a = nrow(bi_normal_CRC_S1)
b = ncol(bi_normal_CRC_S1)
for(i in 1:a){
  temp <- sum(normal_CRC_S1[i,])/b + sd(normal_CRC_S1[i,])
  for(j in 1:b){
    if(normal_CRC_S1[i,j] >= temp){
      bi_normal_CRC_S1[i,j] <- 1
    }
    else{
      bi_normal_CRC_S1[i,j] <- 0
    }
  }
}
write.table(bi_normal_CRC_S1, "~/LOBICO/data/short.random.forest.any/Bi-Normal-CRC_S1.txt",
            sep = "\t", row.names = T, col.names = T)
normal_CRC_S1_class <- c(rep(1, times = 25), rep(0, times = 50))
write.table(normal_CRC_S1_class, "~/LOBICO/data/short.random.forest.any/Normal-CRC_S1-biclass.txt",
            sep = "\t", row.names = F, col.names = F)

## Normal-PAAD part
bi_normal_PAAD <- normal_PAAD
bi_normal_PAAD <- as.data.frame(t(bi_normal_PAAD))
bi_normal_PAAD$names <- rownames(bi_normal_PAAD)
bi_normal_PAAD <- arrange(bi_normal_PAAD, names)
rownames(bi_normal_PAAD) <- bi_normal_PAAD$names
bi_normal_PAAD <- as.data.frame(t(bi_normal_PAAD[,-11]))


a = nrow(bi_normal_PAAD)
b = ncol(bi_normal_PAAD)
for(i in 1:a){
  temp <- sum(normal_PAAD[i,])/b + sd(normal_PAAD[i,])
  for(j in 1:b){
    if(normal_PAAD[i,j] >= temp){
      bi_normal_PAAD[i,j] <- 1
    }
    else{
      bi_normal_PAAD[i,j] <- 0
    }
  }
}
write.table(bi_normal_PAAD, "~/LOBICO/data/short.random.forest.any/Bi-Normal-PAAD.txt",
            sep = "\t", row.names = T, col.names = T)
normal_PAAD_class <- c(rep(0, times = 50), rep(1, times = 36))
write.table(normal_PAAD_class, "~/LOBICO/data/short.random.forest.any/Normal-PAAD-biclass.txt",
            sep = "\t", row.names = F, col.names = F)

## Normal-PRAD part
bi_normal_PRAD <- normal_PRAD
bi_normal_PRAD <- as.data.frame(t(bi_normal_PRAD))
bi_normal_PRAD$names <- rownames(bi_normal_PRAD)
bi_normal_PRAD <- arrange(bi_normal_PRAD, names)
rownames(bi_normal_PRAD) <- bi_normal_PRAD$names
bi_normal_PRAD <- as.data.frame(t(bi_normal_PRAD[,-11]))


a = nrow(bi_normal_PRAD)
b = ncol(bi_normal_PRAD)
for(i in 1:a){
  temp <- sum(normal_PRAD[i,])/b + sd(normal_PRAD[i,])
  for(j in 1:b){
    if(normal_PRAD[i,j] >= temp){
      bi_normal_PRAD[i,j] <- 1
    }
    else{
      bi_normal_PRAD[i,j] <- 0
    }
  }
}
write.table(bi_normal_PRAD, "~/LOBICO/data/short.random.forest.any/Bi-Normal-PRAD.txt",
            sep = "\t", row.names = T, col.names = T)
normal_PRAD_class <- c(rep(0, times = 50), rep(1, times = 6))
write.table(normal_PRAD_class, "~/LOBICO/data/short.random.forest.any/Normal-PRAD-biclass.txt",
            sep = "\t", row.names = F, col.names = F)



