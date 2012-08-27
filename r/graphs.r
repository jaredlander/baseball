# some plots
require(ggplot2)

yanks <- ggplot(baseball[which(baseball$Year >= 1960), ], aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90))
yanks + geom_point(aes(colour=Party))

yanksAll <- ggplot(baseball, aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90))
yanksAll + geom_point(aes(colour=Party))