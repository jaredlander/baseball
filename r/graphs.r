# some plots
require(ggplot2)

ggplot(baseball, aes(x=Year, y=Yankees)) + geom_point()