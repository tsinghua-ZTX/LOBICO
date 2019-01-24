library(dplyr)
library(ggplot2)
long.random.forest.any <- read.table("~/LOBICO/long.random.forest.any.ACCURACY.txt", header = T)
long.random.forest.down <- read.table("~/LOBICO/long.random.forest.down.ACCURACY.txt", header = T)
short.random.forest.any <- read.table("~/LOBICO/short.random.forest.any.ACCURACY.txt", header = T)
short.random.forest.up <- read.table("~/LOBICO/short.random.forest.up.ACCURACY.txt", header = T)
summary_data <- rbind(long.random.forest.any, long.random.forest.down, short.random.forest.any, short.random.forest.up )
names(summary_data) <- c("Accuracy", "Type", "Model", "Method")

general_plot <- ggplot(data = summary_data, aes(x = Type, y = Accuracy, fill = Method)) + 
  geom_col( position="dodge") + 
  coord_flip() + scale_fill_brewer(palette="Set2") + 
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(),
           panel.background = element_blank(),axis.line = element_line(colour = "black"))
general_plot

scirep_data <- summary_data[which(summary_data$Method == "short.random.forest.up" | 
                                 summary_data$Method == "short.random.forest.any" ),]

scirep_plot <- ggplot(data = scirep_data, aes(x = Type, y = Accuracy, fill = Method)) + 
  geom_col( width = 0.75,
            position=position_dodge(0.9)) + 
  coord_flip() + scale_fill_brewer(palette="Set2") + 
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),axis.line = element_line(colour = "black")) +
  theme(legend.position="top",
        legend.direction = "vertical") + 
  guides(fill = guide_legend(reverse=TRUE))
scirep_plot

exbro_data <- summary_data[which(summary_data$Type == "HCC" | 
                                   summary_data$Type == "PAAD"),]

exbro_plot <- ggplot(data = exbro_data, aes(x = Type, y = Accuracy, fill = Method)) + 
  geom_col( width = 0.75,
            position=position_dodge(0.9)) + 
  coord_flip() + scale_fill_brewer(palette="Set1") + 
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),axis.line = element_line(colour = "black")) +
  theme(legend.position="top",
        legend.direction = "vertical")
exbro_plot
