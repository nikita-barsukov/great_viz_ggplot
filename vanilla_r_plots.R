source('load_data.R')

# basic scatterplot
png("plots/basic_r.png",1500,1500, units="px", res=300)
plot(ds$fertility, ds$gdp_pc)
dev.off()

# plot with title and axis labels and point
png("plots/basic_r_better.png",1500,1500, units="px", res=300)
plot(ds$fertility, 
     ds$gdp_pc, 
     pch=19,
     col=alpha('black', 0.5),
     main='Fertility rate and GDP per capita',
     xlab='Births per woman',
     ylab='GDP per head, 2011 prices')
dev.off()

