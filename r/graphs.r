source("r/build-data.r")

# some plots
require(ggplot2)

# basics of all plots
basePlot <- ggplot() + aes(x=Year, colour=Party) + opts(axis.text.x=theme_text(angle=90)) + scale_y_continuous(breaks=0:1, labels=c("Loss", "Win")) + scale_colour_discrete("President")

# yankees since 1960
(yankees1960 <- basePlot + geom_point(data=baseball[which(baseball$Year >= 1960), ], aes(y=Yankees)) + labs(y="Yankee Win")  + opts(title="Yankees World Series Wins Since 1960") + scale_x_discrete(breaks=seq(from=1960, to=2011, by=2)))
# yankees all
(yankeesAll <- basePlot + geom_point(data=baseball, aes(y=Yankees)) + labs(y="Yankee Win")  + opts(title="Yankees World Series Wins") + scale_x_discrete(breaks=seq(from=1903, to=2011, by=4)))
# american league since 1960
(al1960 <- basePlot + geom_point(data=baseball[which(baseball$Year >= 1960), ], aes(y=American)) + labs(y="AL Win")  + opts(title="American League World Series Wins Since 1960") + scale_x_discrete(breaks=seq(from=1960, to=2011, by=2)))
# american league all
(alAll <- basePlot + geom_point(data=baseball, aes(y=American)) + labs(y="AL Win")  + opts(title="American League World Series Wins") + scale_x_discrete(breaks=seq(from=1903, to=2011, by=4)))

# fluctuation plots
(yankeeFluc <- ggfluctuation(xtabs(Yankees ~ Party + Year1960, baseball)) + labs(x="Year", y="President") + scale_x_discrete(labels=c("Post-1960", "Pre-1960")) + opts(title="Number of Yankee World Series Wins"))
(alFluc <- ggfluctuation(xtabs(American ~ Party + Year1960, baseball)) + labs(x="Year", y="President") + scale_x_discrete(labels=c("Post-1960", "Pre-1960")) + opts(title="Number of AL World Series Wins"))

# save plots
ggsave(filename="graphics/Yankees 1960.png", plot=yankees1960)
ggsave(filename="graphics/Yankees All.png", plot=yankeesAll)
ggsave(filename="graphics/AL 1960.png", plot=al1960)
ggsave(filename="graphics/AL All.png", plot=alAll)
ggsave(filename="graphics/Yankee Fluctuation.png", plot=yankeeFluc)
ggsave(filename="graphics/AL Fluctuation.png", plot=alFluc)