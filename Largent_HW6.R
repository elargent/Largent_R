# --------------------------------------------------- #
# ------------------- Homework #6 ------------------- #
# --------------------------------------------------- #

require(ggplot2)
require(grid)

# 1) Using ggplot2, we recreate the first graph. We use the geom_point 
# function to create the scatterplot and assign colors to the data points. 
# We also change labels. This includes the text, size, and color. 

diamond_data1 <- ggplot(diamonds, aes(x=diamonds$carat,y=diamonds$price))
color <- diamonds[[3]]
diamond_data1 <- diamond_data1 + geom_point(aes(color = factor(color)))
diamond_data1 <- diamond_data1 + labs(x="Weight", y="Price",
                                      title = "Diamonds - Weight to Price by Color")
diamond_data1 <- diamond_data1 + theme(plot.title=element_text(color="blue", size=20))
diamond_data1 <- diamond_data1 + theme(axis.title=element_text(face="bold"))
diamond_data1 <- diamond_data1 + theme(legend.title=element_text(face="bold"))
diamond_data1

# 2) Using ggplot2, we recreate the second graph. We use the geom_point 
# function to create the scatterplot and assign colors to the data points. 
# We also change labels. This includes the text, size, and color. 

diamonds2 <- diamonds
diamonds2$log_carat <- log(diamonds$carat)
diamonds2$log_price <- log(diamonds$price)

diamond_data2 <- ggplot(diamonds2, aes(x=diamonds2$log_carat,y=diamonds2$log_price))
color <- diamonds2[[3]]
diamond_data2 <- diamond_data2 + geom_point(aes(color = factor(color)))
diamond_data2 <- diamond_data2 + labs(x="Weight", y="Price",
                                      title = "Diamonds - Weight to Price (Linear)")
diamond_data2 <- diamond_data2 + theme(plot.title=element_text(color="blue", size=20))
diamond_data2 <- diamond_data2 + theme(axis.title=element_text(face="bold"))
diamond_data2 <- diamond_data2 + theme(legend.title=element_text(face="bold"))
diamond_data2

# 3) Using ggplot2, we recreate the third graph. We use the geom_point function 
# to create the scatterplot and assign colors to the data points. We also change 
# labels. This includes the text, size, and color. In addition to these steps, 
# we use the grid library to create a multi pannel graph. While the positions are 
# not 'exactly' the same as the original, they are very close.

diamonds3 <- diamonds
diamonds3$log_carat <- log(diamonds$carat)
diamonds3$log_price <- log(diamonds$price)
diamonds3$price_res <- resid(lm(diamonds3$log_price ~ diamonds3$log_carat))

diamond_data3_1 <- ggplot(diamonds3, aes(x=diamonds3$log_carat,y=diamonds3$price_res))
color <- diamonds3[[3]]
diamond_data3_1 <- diamond_data3_1 + geom_point(aes(color = factor(color)))
diamond_data3_1 <- diamond_data3_1 + labs(x="Weight", y="Price Residuals",
                                          title = "Diamonds - Weight to Price by Color")
diamond_data3_1 <- diamond_data3_1 + theme(plot.title=element_text(color="blue", size=20))
diamond_data3_1 <- diamond_data3_1 + theme(axis.title=element_text(face="bold"), legend.position="top")
diamond_data3_1 <- diamond_data3_1 + theme(legend.title=element_text(face="bold"))
diamond_data3_1

diamond_data3_2 <- ggplot(diamonds3, aes(x=diamonds$price))
diamond_data3_2 <- diamond_data3_2 + aes(y=..density..)
diamond_data3_2 <- diamond_data3_2 + geom_histogram(aes(color = factor(color)),binwidth=25) 
diamond_data3_2 <- diamond_data3_2 + theme(axis.title = element_blank(), legend.position="none")
diamond_data3_2

diamond_data3_3 <- ggplot(diamonds3, aes(x=diamonds$carat))
diamond_data3_3 <- diamond_data3_3 + aes(y=..density..)
diamond_data3_3 <- diamond_data3_3 + geom_histogram(aes(color = factor(color)),binwidth=.05) 
diamond_data3_3 <- diamond_data3_3 + theme(axis.title = element_blank(), legend.position="none")
diamond_data3_3

grid.newpage()
pushViewport(viewport(layout = grid.layout(10, 10)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(diamond_data3_1, vp = vplayout(1:8, 3:10))  # key is to define vplayout
print(diamond_data3_3, vp = vplayout(9:10, 4:9))
vplayout2 <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y, angle=90)
print(diamond_data3_2, vp = vplayout2(8:9, 3:10))

# 4) Using ggplot2, we recreate the fourth graph. We use the geom_point 
# function to create the scatterplot and assign colors to the data points. 
# We also change labels. This includes the text, size, and color. In addition 
# to these steps, we use the grid library to create a multi pannel graph. 
# While the positions are not 'exactly' the same as the original, they are 
# very close.

diamonds4 <- diamonds
diamonds4$log_carat <- log(diamonds$carat)
diamonds4$log_price <- log(diamonds$price)
diamonds4$price_res <- resid(lm(diamonds4$log_price ~ diamonds4$log_carat))

diamond_data4_1 <- ggplot(diamonds4, aes(x=diamonds4$log_carat,y=diamonds4$price_res))
color <- diamonds4[[3]]
diamond_data4_1 <- diamond_data4_1 + geom_point(aes(color = factor(color)))
diamond_data4_1 <- diamond_data4_1 + labs(x="Weight", y="Price Residuals",
                                          title = "Diamonds - Weight to Price by Color")
diamond_data4_1 <- diamond_data4_1 + theme(plot.title=element_text(color="blue", size=20))
diamond_data4_1 <- diamond_data4_1 + theme(axis.title=element_text(face="bold"), legend.position="top")
diamond_data4_1 <- diamond_data4_1 + theme(legend.title=element_text(face="bold"))
diamond_data4_1

diamond_data4_2 <- ggplot(diamonds4, aes(x=diamonds$price))
diamond_data4_2 <- diamond_data4_2 + aes(y=..density..)
diamond_data4_2 <- diamond_data4_2 + geom_histogram(aes(color = factor(color)),binwidth=25) 
diamond_data4_2 <- diamond_data4_2 + theme(axis.title = element_blank(), legend.position="none")
diamond_data4_2

diamond_data4_3 <- ggplot(diamonds4, aes(x=diamonds$carat))
diamond_data4_3 <- diamond_data4_3 + aes(y=..density..)
diamond_data4_3 <- diamond_data4_3 + geom_histogram(aes(color = factor(color)),binwidth=.05) 
diamond_data4_3 <- diamond_data4_3 + theme(axis.title = element_blank(), legend.position="none")
diamond_data4_3

grid.newpage()
pushViewport(viewport(layout = grid.layout(20, 20)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(diamond_data4_1, vp = vplayout(1:20, 1:20))  # key is to define vplayout
print(diamond_data4_3, vp = vplayout(4:6, 13:20))
print(diamond_data4_2, vp = vplayout(16:19, 2:10))

# --------------------------------------------------- #
# --------------------------------------------------- #
# --------------------------------------------------- #