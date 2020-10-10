library("dplyr", lib.loc="~/R/win-library/3.6")
library("data.table", lib.loc="~/R/win-library/3.6")
library("ggplot2", lib.loc="~/R/win-library/3.6")
library("igraph", lib.loc="~/R/win-library/3.6")
links <- read.csv("C:/Users/Lenovo/Desktop/EDGES1.csv", header=T, as.is=T)
nodes <- read.csv("C:/Users/Lenovo/Desktop/NODES1.csv", header=T, as.is=T)
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
net <- simplify(net, remove.multiple = F, remove.loops = T)
colrs <- c("gray50", "tomato", "gold")
V(net)$color <- colrs[V(net)$media.type]
V(net)$size <- V(net)$audience.size*1
E(net)$arrow.size <- .1
# E(net)$width <- E(net)$weight/1
# V(net)$label <- NA
plot(net, edge.arrow.size=.4,vertex.label=V(net)$id)