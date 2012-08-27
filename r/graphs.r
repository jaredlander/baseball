# some plots
require(ggplot2)

yanks <- ggplot(baseball[which(baseball$Year >= 1960), ], aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90)) + opts(title="Yankees World Series Wins") + labs(x="Yankee Win") + scale_x_discrete(breaks=seq(from=1960, to=2011, by=2)) + scale_y_continuous(breaks=0:1, labels=c("Loss", "Win"))
yanks + geom_point(aes(colour=Party)) + scale_colour_discrete("President")

yanksAll <- ggplot(baseball, aes(x=Year, y=Yankees)) + opts(axis.text.x=theme_text(angle=90))
yanksAll + geom_point(aes(colour=Party))

amer <- ggplot(baseball[which(baseball$Year >= 1960), ], aes(x=Year, y=American)) + opts(axis.text.x=theme_text(angle=90))
amer + geom_point(aes(colour=Party))

amerAll <- ggplot(baseball, aes(x=Year, y=American)) + opts(axis.text.x=theme_text(angle=90))
amerAll + geom_point(aes(colour=Party))

ggfluctuation(xtabs(Yankees ~ Party + Year1960, baseball))
ggfluctuation(xtabs(American ~ Party + Year1960, baseball))



