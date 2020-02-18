library(ggplot2)
library(ggthemes)

setwd('~/ResearchGit/PaperWriting/PEARC20RSE/')
threadver <- read.csv("VersionsThreads.csv")
famsize <- read.csv("GeneFamilies.csv")
bigthreadver <- read.csv("BigThreadsVersion.csv")

threadplot <- ggplot(threadver, aes(Threads, Time, color = factor(Version))) + ylab("Execution Time (sec)") +
  geom_line() + geom_point() + scale_color_discrete(name = "CAFE Version", labels = c("3.1","4.2","5.0")) +
  theme_stata()

famplot <- ggplot(famsize, aes(Families, Time), group=factor(Linetype)) + ylab("Execution Time (sec)") + 
  xlab("Number of Gene Families") + geom_line(aes(linetype=factor(Linetype))) + geom_point() + 
  theme_stata() + guides(linetype = FALSE)

bigplot <- ggplot(bigthreadver, aes(Threads, Time, color = factor(Version))) + ylab("Execution Time (sec)") +
  geom_line() + geom_point() + scale_color_discrete(name = "CAFE Version", labels = c("4.2","5.0")) +
  theme_stata()

ggsave("VersionsThreads.png", plot = threadplot)
ggsave("GeneFamilies.png", plot = famplot)
ggsave("BigThreadsVersion.png", plot = bigplot)