require(ggplot2)
require(scales)
require(ggthemr)
source('load_data.R')
options(scipen = 99999)

color_ggplot = ggplot(data=ds, 
                      aes(x=fertility,
                          y=gdp_pc,
                          size=population,
                          colour=region)) +
  geom_point(alpha = 0.5) +
  geom_smooth(se=FALSE,
              colour='black',
              size=0.2) +
  ggtitle("Fertility rate and GDP per capita") +
  scale_x_continuous(name='Births per woman') +
  scale_y_continuous(labels = comma, name='GDP per head, 2011 prices') +
  theme(legend.position="bottom", legend.title=element_blank()) +
  scale_size(guide=FALSE)

ggthemr('dust')
print(color_ggplot)
ggsave('plots/dust_theme_ggplot.png',width=7, height=5)

ggthemr_reset()
ggthemr('fresh')
print(color_ggplot)
ggsave('plots/fresh_theme_ggplot.png',width=7, height=5)
ggthemr('flat')
print(color_ggplot)
ggsave('plots/flat_theme_ggplot.png',width=7, height=5)
