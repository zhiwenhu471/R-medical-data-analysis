library(ggplot2)

# Convert the variable dose from a numeric to a factor variable
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

# Basic box plot
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot()
p
# Rotate the box plot
p + coord_flip()
# Notched box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(notch=TRUE)
# Change outlier, color, shape and size
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(outlier.colour="red", outlier.shape=8,
               outlier.size=4)
# Box plot with mean points
p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)
# choose which items to display
p + scale_x_discrete(limits=c("0.5", "2"))
# Box plot with dot plot
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
# Box plot with jittered points
# 0.2 : degree of jitter in x direction
p + geom_jitter(shape=16, position=position_jitter(0.2))
# Change box plot line colors by groups
p<-ggplot(ToothGrowth, aes(x=dose, y=len, color=dose)) +
  geom_boxplot()
p
# Use custom color palettes
p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# Use brewer color palettes
p+scale_color_brewer(palette="Dark2")
# Use grey scale
p + scale_color_grey() + theme_classic()
# Use single color
ggplot(ToothGrowth, aes(x=dose, y=len)) +
  geom_boxplot(fill='#A4A4A4', color="black")+
  theme_classic()
# Change box plot colors by groups
p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) +
  geom_boxplot()
p
# Use custom color palettes
p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# use brewer color palettes
p+scale_fill_brewer(palette="Dark2")
# Use grey scale
p + scale_fill_grey() + theme_classic()
# change the legend position
p + theme(legend.position="top")
p + theme(legend.position="bottom")
p + theme(legend.position="left")
p + theme(legend.position="right")
p + theme(legend.position="none") # Remove legend
