# some plots
require(ggplot2)

yanks <- ggplot(baseball[which(baseball$Year >= 1960), ], aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90))
yanks + geom_point(aes(colour=Party))

yanksAll <- ggplot(baseball, aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90))
yanksAll + geom_point(aes(colour=Party))

amer <- ggplot(baseball[which(baseball$Year >= 1960), ], aes(x=Year, y=American)) + opts(axis.text.x=theme_text(angle=90))
amer + geom_point(aes(colour=Party))

amerAll <- ggplot(baseball, aes(x=Year, y=American)) + opts(axis.text.x=theme_text(angle=90))
amerAll + geom_point(aes(colour=Party))

ggfluctuation(xtabs(Yankees ~ Party + Year1960, baseball))
ggfluctuation(xtabs(American ~ Party + Year1960, baseball))



