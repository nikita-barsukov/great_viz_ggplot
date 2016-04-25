require(ggplot2)
require(scales)
require(ggthemes)
source('load_data.R')
options(scipen = 99999)

color_ggplot = ggplot(data=ds, 
                      aes(x=fertility,
                          y=gdp_pc,
                          size=population,
                          color=region)) +
  geom_point(alpha = 0.5) +
  geom_smooth(se=FALSE,
              color='black',
              size=0.2) +
  ggtitle("Fertility rate and GDP per capita") +
  scale_x_continuous(name='Births per woman') +
  scale_y_continuous(labels = comma, name='GDP per head, 2011 prices') +
  scale_color_discrete(name='') +
  scale_size(guide=FALSE)

economist_ggplot = color_ggplot + theme_economist() + scale_colour_economist() 
print(economist_ggplot)
ggsave('plots/economist_ggplot.png',width=9, height=5)

few_ggplot = color_ggplot + theme_few() + scale_colour_few()
print(few_ggplot)
ggsave('plots/few_ggplot.png',width=7, height=5)
