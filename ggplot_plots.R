require(ggplot2)
require(scales)
source('load_data.R')
options(scipen = 99999)

default_ggplot = ggplot(data=ds) +
  geom_point(aes(x=fertility, 
                 y=gdp_pc, 
                 size=population),
             color=alpha('black', 0.5))
print(default_ggplot)
ggsave('plots/default_ggplot.png',width=7, height=5)

better_ggplot = ggplot(data=ds) +
  geom_point(aes(x=fertility, 
                 y=gdp_pc, 
                 size=population),
             color=alpha('black', 0.5)) +
  ggtitle("Fertility rate and GDP per capita") +
  scale_x_continuous(name='Births per woman') +
  scale_y_continuous(labels = comma, name='GDP per head, 2011 prices') +
  scale_size(labels=comma, name='Population')
print(better_ggplot)
ggsave('plots/better_ggplot.png',width=7, height=5)

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
  scale_size(guide=FALSE) +
  theme(legend.position="bottom")
print(color_ggplot)
ggsave('plots/color_ggplot.png',width=7, height=5)

# built-in themes

ggsave("plots/theme_minimal_ggplot.png",
  plot = color_ggplot + theme_minimal() + theme(legend.position="bottom"),
  width=7, height=5 )

ggsave("plots/theme_classic_ggplot.png",
       plot = color_ggplot + theme_classic() + theme(legend.position="bottom"),
       width=7, height=5 )
