#My first R code
xlim <- c(-16.738281, 56.601563)
ylim <- c(-35.039321, 36.856229)
map("world", col="#191919", fill=TRUE, bg="#000000", lwd=0.05, xlim=xlim, ylim=ylim)
pal <- colorRampPalette(c("#333333", "white", "#1292db"))
colors <- pal(100)
mydata=read.csv("/Users/newuser/Downloads/flights/the_File2.csv")
fsub<-mydata[order(mydata$number.of.routes),]
#maxcnt<-max(fsub$number.of.routes)
maxcnt<-16
for(j in 1:length(fsub$long..departure..decimal..1)){
	
inter <- gcIntermediate(c(fsub[j,]$long..departure..decimal., fsub[j,]$lat..departure..decimal.), c(fsub[j,]$long..departure..decimal..1, fsub[j,]$lat..departure..decimal..1), n=200, addStartEnd=TRUE)
colindex <- round( (fsub[j,]$number.of.routes / maxcnt) * length(colors) )

lines(inter, col=colors[colindex], lwd=0.8)
}