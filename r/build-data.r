require(RCurl)
require(XML)
require(plyr)

# get world series info from wikipedia
dataPage <- "http://en.wikipedia.org/wiki/List_of_World_Series_champions"
worldSeries <- readHTMLTable(dataPage, which = 3, skip.rows = 5, stringsAsFactors=FALSE)

# remove years where world series not played
worldSeries <- worldSeries[which(!worldSeries$Year %in% c(1904, 1994)), ]
# keep only certain columns
worldSeries <- worldSeries[, c("Year", "Winning team", "Winning league", "Losing team", "Losing league")]
# give better names
names(worldSeries) <- c("Year", "WinningTeam", "WinningLeague", "LosingTeam", "LosingLeague")

lengthen.pres <- function(vect)
{
    data.frame(President=vect$President, Party=vect$Party, Year=vect$Start:(vect$End - 1))
}

# load president data
presidents <- read.table("data/presidents.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

# make a year for each president
presidents <- ddply(presidents, "President", lengthen.pres)
# remove years when world series not played
presidents <- presidents[which(!presidents$Year %in% c(1901, 1902, 1904, 1994)), ]
presidents <- presidents[order(presidents$Year), ]
# put Kennedy back in for 1963 since he was in office in October
presidents$President[which(presidents$Year == 1963)] <- "John Fitzgerald Kennedy"

# join both together
baseball <- join(worldSeries, presidents, by="Year")
baseball$Yankees <- ifelse(baseball$WinningTeam == "New York Yankees", 1, 0)
baseball$American <- ifelse(baseball$WinningLeague == "AL", 1, 0)
# make party a factor
baseball$Party <- factor(baseball$Party, levels=c("Republican", "Democrat"))