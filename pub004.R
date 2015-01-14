### This R code file generates the figures and maps for the publication 
### "Mobility and Urban Structure: A Case Study of Four Asian Capital Cities" 
### by Konstantin Greger, Yuji Murayama, published in "Tsukuba Geoenvironmental 
### Sciences" Vol. 10, 2014.

### All datasets need to be preprocessed using scripts analysis_v2.Rmd and 
### spatial_analysis.R!

theme_set(theme_bw(base_size = 8))

## Fig. 1
plotDhk09Activity <- ggplot(dhk09.trip, aes(activity)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsActivity[, 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotDhk09Activity <- ggplot(data.frame(table(dhk09.trip$activity) / 
#                                          (nrow(dhk09.trip) / 100)), 
#                             aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsActivity[, 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09Activity <- arrangeGrob(plotDhk09Activity, main = title.grob)

plotHni04Activity <- ggplot(hni04.trip, aes(activity)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsActivity[, 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotHni04Activity <- ggplot(data.frame(table(hni04.trip$activity) / 
#                                          (nrow(hni04.trip) / 100)), 
#                             aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsActivity[, 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04Activity <- arrangeGrob(plotHni04Activity, main = title.grob)

plotJkt02Activity <- ggplot(jkt02.trip, aes(activity)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsActivity[, 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotJkt02Activity <- ggplot(data.frame(table(jkt02.trip$activity) / 
#                                          (nrow(jkt02.trip) / 100)), 
#                             aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsActivity[, 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02Activity <- arrangeGrob(plotJkt02Activity, main = title.grob)

plotMnl96Activity <- ggplot(mnl96.trip, aes(activity)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsActivity[, 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotMnl96Activity <- ggplot(data.frame(table(mnl96.trip$activity) / 
#                                          (nrow(mnl96.trip) / 100)), 
#                             aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsActivity[, 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "d) Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96Activity <- arrangeGrob(plotMnl96Activity, main = title.grob)


png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig1.png",
    width = 17, height = 11.15, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(plotDhk09Activity, plotHni04Activity,
                         plotJkt02Activity, plotMnl96Activity,
                         ncol = 2))
dev.off()



## Fig. 2
plotDhk09TModeC <- ggplot(dhk09.subtrip, aes(tmodec)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotDhk09TModeC <- ggplot(data.frame(table(dhk09.subtrip$tmodec) / 
#                                        (nrow(dhk09.subtrip) / 100)), 
#                           aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09TModeC <- arrangeGrob(plotDhk09TModeC, main = title.grob)

plotHni04TModeC <- ggplot(hni04.subtrip, aes(tmodec)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotHni04TModeC <- ggplot(data.frame(table(hni04.subtrip$tmodec) / 
#                                        (nrow(hni04.subtrip) / 100)), 
#                           aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04TModeC <- arrangeGrob(plotHni04TModeC, main = title.grob)

plotJkt02TModeC <- ggplot(jkt02.subtrip, aes(tmodec)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotJkt02TModeC <- ggplot(data.frame(table(jkt02.subtrip$tmodec) / 
#                                        (nrow(jkt02.subtrip) / 100)), 
#                           aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02TModeC <- arrangeGrob(plotJkt02TModeC, main = title.grob)

plotMnl96TModeC <- ggplot(mnl96.subtrip, aes(tmodec)) +
  geom_bar(fill = "black") +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
  labs(x = NULL, y = NULL) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")
# plotMnl96TModeC <- ggplot(data.frame(table(mnl96.subtrip$tmodec) / 
#                                        (nrow(mnl96.subtrip) / 100)), 
#                           aes(Var1, Freq)) + 
#   geom_bar(fill = "black", stat = "identity") + 
#   scale_y_continuous(labels = comma) + 
#   scale_x_discrete(limits = labelsTModeC[c(1:9), 2]) + 
#   labs(x = NULL, y = NULL) + 
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
#   theme(legend.position = "none")
title.grob <- textGrob(
  label = "d) Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96TModeC <- arrangeGrob(plotMnl96TModeC, main = title.grob)


png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig2.png",
    width = 17, height = 11.15, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(plotDhk09TModeC, plotHni04TModeC,
                         plotJkt02TModeC, plotMnl96TModeC,
                         ncol = 2))
dev.off()



## Fig. 3
aggregate(dist ~ sex, dhk09.person, mean)
plotDhk09DistSex <- ggplot(dhk09.person, aes(x = sex, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 50, 100, 150), 
                     labels = c("0", "50", "100", "150 km")) +
  scale_x_discrete(limits = labelsSex[, 2]) +
  labs(y = NULL, 
       x = NULL)

aggregate(dist ~ age, dhk09.person, mean)
plotDhk09DistAge <- ggplot(dhk09.person, aes(x = age, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() + 
  scale_y_continuous(breaks = c(0, 50, 100, 150), 
                     labels = c("0", "50", "100", "150 km")) +
  scale_x_discrete(limits = labelsAge[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "a) Dhaka, by age group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09DistAge <- arrangeGrob(plotDhk09DistAge, main = title.grob)

aggregate(dist ~ occupc, dhk09.person, mean)
plotDhk09DistOccupC <- ggplot(dhk09.person, aes(x = occupc, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 50, 100, 150), 
                     labels = c("0", "50", "100", "150 km")) +
  scale_x_discrete(limits = labelsOccupC[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "b) Dhaka, by occupation group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09DistOccupC <- arrangeGrob(plotDhk09DistOccupC, main = title.grob)


aggregate(dist ~ sex, hni04.person, mean)
plotHni04DistSex <- ggplot(hni04.person, aes(x = sex, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 50, 100, 150, 200, 250), 
                     labels = c("0", "50", "100", "150", "200", "250 km")) +
  scale_x_discrete(limits = labelsSex[, 2]) +
  labs(y = NULL, 
       x = NULL)

aggregate(dist ~ age, hni04.person, mean)
plotHni04DistAge <- ggplot(hni04.person, aes(x = age, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 50, 100, 150, 200, 250), 
                     labels = c("0", "50", "100", "150", "200", "250 km")) +
  scale_x_discrete(limits = labelsAge[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "c) Hanoi, by age group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04DistAge <- arrangeGrob(plotHni04DistAge, main = title.grob)

aggregate(dist ~ occupc, hni04.person, mean)
plotHni04DistOccupC <- ggplot(hni04.person, aes(x = occupc, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 50, 100, 150, 200, 250), 
                     labels = c("0", "50", "100", "150", "200", "250 km")) +
  scale_x_discrete(limits = labelsOccupC[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "d) Hanoi, by occupation group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04DistOccupC <- arrangeGrob(plotHni04DistOccupC, main = title.grob)


aggregate(dist ~ sex, jkt02.person, mean)
plotJkt02DistSex <- ggplot(jkt02.person, aes(x = sex, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300, 400, 500), 
                     labels = c("0", "100", "200", "300", "400", "500 km")) +
  scale_x_discrete(limits = labelsSex[, 2]) +
  labs(y = NULL, 
       x = NULL)

aggregate(dist ~ age, jkt02.person, mean)
plotJkt02DistAge <- ggplot(jkt02.person, aes(x = age, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300, 400, 500), 
                     labels = c("0", "100", "200", "300", "400", "500 km")) +
  scale_x_discrete(limits = labelsAge[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "e) Jakarta, by age group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02DistAge <- arrangeGrob(plotJkt02DistAge, main = title.grob)

aggregate(dist ~ occupc, jkt02.person, mean)
plotJkt02DistOccupC <- ggplot(jkt02.person, aes(x = occupc, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300, 400, 500), 
                     labels = c("0", "100", "200", "300", "400", "500 km")) +
  scale_x_discrete(limits = labelsOccupC[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "f) Jakarta, by occupation group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02DistOccupC <- arrangeGrob(plotJkt02DistOccupC, main = title.grob)


aggregate(dist ~ sex, mnl96.person, mean)
plotMnl96DistSex <- ggplot(mnl96.person, aes(x = sex, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300), 
                     labels = c("0", "100", "200", "300 km")) +
  scale_x_discrete(limits = labelsSex[, 2]) +
  labs(y = NULL, 
       x = NULL)

aggregate(dist ~ age, mnl96.person, mean)
plotMnl96DistAge <- ggplot(mnl96.person, aes(x = age, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300), 
                     labels = c("0", "100", "200", "300 km")) +
  scale_x_discrete(limits = labelsAge[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "g) Manila, by age group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96DistAge <- arrangeGrob(plotMnl96DistAge, main = title.grob)

aggregate(dist ~ occupc, mnl96.person, mean)
plotMnl96DistOccupC <- ggplot(mnl96.person, aes(x = occupc, y = dist / 1000)) + 
  geom_boxplot(outlier.size = 1, size = .5) + 
  guides(fill = FALSE) + 
  coord_flip() +
  scale_y_continuous(breaks = c(0, 100, 200, 300), 
                     labels = c("0", "100", "200", "300 km")) +
  scale_x_discrete(limits = labelsOccupC[, 2]) +
  labs(y = NULL, 
       x = NULL)
title.grob <- textGrob(
  label = "h) Manila, by occupation group",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96DistOccupC <- arrangeGrob(plotMnl96DistOccupC, main = title.grob)


png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig3.png",
    width = 17, height = 24, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(plotDhk09DistAge, plotDhk09DistOccupC,
                         plotHni04DistAge, plotHni04DistOccupC,
                         plotJkt02DistAge, plotJkt02DistOccupC,
                         plotMnl96DistAge, plotMnl96DistOccupC,
                         ncol = 2))
dev.off()



## Fig. 4
names <- names(dhk09.commbehav)
names[3] <- "Activity"
names(dhk09.commbehav) <- names
plotDhk09CommTripStartHourAbs <- ggplot(dhk09.commbehav, 
                                        aes(phour_s, linetype = Activity)) +
  geom_freqpoly(aes(group = Activity), size = .5) +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   limits = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                              "10", "11", "12", "13", "14", "15", "16", "17", 
                              "18", "19", "20", "21", "22", "23"), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) + 
  scale_linetype_discrete(name = "Activity:") +
  labs(x = NULL, 
       y = NULL) +
  theme(legend.justification = c(1, 1), legend.position = c(1, 1), 
        legend.key = element_blank())
legendCommTripStartHourAbs <- 
  extractGgplot2Legend(plotDhk09CommTripStartHourAbs + 
                         theme(legend.position="bottom") + 
                         guides(fill = guide_legend(ncol = 3)))
plotDhk09CommTripStartHourAbs <- plotDhk09CommTripStartHourAbs + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09CommTripStartHourAbs <- arrangeGrob(plotDhk09CommTripStartHourAbs, 
                                             main = title.grob)

plotHni04CommTripStartHourAbs <- ggplot(hni04.commbehav, 
                                        aes(phour_s, linetype = activity)) +
  geom_freqpoly(aes(group = activity), size = .5) +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   limits = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                              "10", "11", "12", "13", "14", "15", "16", "17", 
                              "18", "19", "20", "21", "22", "23"), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) +
  labs(x = NULL, 
       y = NULL) +
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04CommTripStartHourAbs <- arrangeGrob(plotHni04CommTripStartHourAbs, 
                                             main = title.grob)

plotJkt02CommTripStartHourAbs <- ggplot(jkt02.commbehav, 
                                        aes(phour_s, linetype = activity)) +
  geom_freqpoly(aes(group = activity), size = .5) +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   limits = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                              "10", "11", "12", "13", "14", "15", "16", "17", 
                              "18", "19", "20", "21", "22", "23"), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) +
  labs(x = NULL, 
       y = NULL) +
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02CommTripStartHourAbs <- arrangeGrob(plotJkt02CommTripStartHourAbs, 
                                             main = title.grob)

plotMnl96CommTripStartHourAbs <- ggplot(mnl96.commbehav, 
                                        aes(phour_s, linetype = activity)) +
  geom_freqpoly(aes(group = activity), size = .5) +
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   limits = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                              "10", "11", "12", "13", "14", "15", "16", "17", 
                              "18", "19", "20", "21", "22", "23"), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) +
  labs(x = NULL, 
       y = NULL) +
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "d) Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96CommTripStartHourAbs <- arrangeGrob(plotMnl96CommTripStartHourAbs, 
                                             main = title.grob)

png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig4.png",
    width = 17, height = 11.15, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(plotDhk09CommTripStartHourAbs,
                         plotHni04CommTripStartHourAbs,
                         plotJkt02CommTripStartHourAbs,
                         plotMnl96CommTripStartHourAbs,
                         nrow = 2),
             legendCommTripStartHourAbs, heights=c(9.4, .6))
dev.off()


## Fig. 5
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapDhk09Points <- arrangeGrob(mapDhk09Points, 
                              main = title.grob)

title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapHni04Points <- arrangeGrob(mapHni04Points, 
                              main = title.grob)

title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapJkt02Points <- arrangeGrob(mapJkt02Points, 
                              main = title.grob)

title.grob <- textGrob(
  label = "d) Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapMnl96Points <- arrangeGrob(mapMnl96Points, 
                              main = title.grob)

png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig5.png",
    width = 17, height = 18, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(mapDhk09Points,
                         mapHni04Points,
                         mapJkt02Points,
                         mapMnl96Points,
                         nrow = 2))
dev.off()


## Fig. 6
plotDhk09StatSTDist <- ggplot(dhk09.stdist_stat, aes(x = phour, y = pcount, 
                                                     color = Buffer)) + 
  geom_line(, size = .5) + 
  labs(x = NULL, y = NULL) + 
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) + 
  scale_linetype_discrete(name = "Buffer:") + 
  scale_color_brewer(palette = "Paired") + 
  theme(legend.key = element_blank())
legendStatSTDist <- 
  extractGgplot2Legend(plotDhk09StatSTDist + 
                         theme(legend.position="right") + 
                         guides(fill = guide_legend(ncol = 1)))
plotDhk09StatSTDist <- plotDhk09StatSTDist + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotDhk09StatSTDist <- arrangeGrob(plotDhk09StatSTDist, 
                                   main = title.grob)

plotHni04StatSTDist <- ggplot(hni04.stdist_stat, aes(x = phour, y = pcount, 
                                                     color = Buffer)) + 
  geom_line(, size = .5) + 
  labs(x = NULL, y = NULL) + 
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) + 
  scale_linetype_discrete() + 
  scale_color_brewer(palette = "Paired") + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotHni04StatSTDist <- arrangeGrob(plotHni04StatSTDist, 
                                   main = title.grob)

plotJkt02StatSTDist <- ggplot(jkt02.stdist_stat, aes(x = phour, y = pcount, 
                                                     color = Buffer)) + 
  geom_line(, size = .5) + 
  labs(x = NULL, y = NULL) + 
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) + 
  scale_linetype_discrete() + 
  scale_color_brewer(palette = "Paired") + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotJkt02StatSTDist <- arrangeGrob(plotJkt02StatSTDist, 
                                   main = title.grob)

plotMnl96StatSTDist <- ggplot(mnl96.stdist_stat, aes(x = phour, y = pcount, 
                                                     color = Buffer)) + 
  geom_line(, size = .5) + 
  labs(x = NULL, y = NULL) + 
  scale_y_continuous(labels = comma) + 
  scale_x_discrete(breaks = seq(0, 24, 3), 
                   labels = c("00:00", "03:00", "06:00", "09:00", "12:00", 
                              "15:00", "18:00", "21:00", "24:00")) + 
  scale_linetype_discrete() + 
  scale_color_brewer(palette = "Paired") + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "d) Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
plotMnl96StatSTDist <- arrangeGrob(plotMnl96StatSTDist, 
                                   main = title.grob)

png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig6.png",
    width = 17, height = 11.15, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(plotDhk09StatSTDist,
                         plotHni04StatSTDist,
                         plotJkt02StatSTDist,
                         plotMnl96StatSTDist,
                         nrow = 2),
             legendStatSTDist, ncol = 2, widths=c(9, 1))
dev.off()


## Fig. 7
title.grob <- textGrob(
  label = "a) Dhaka, at 00:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapDhk09Density0 <- arrangeGrob(mapDhk09Density0, 
                              main = title.grob)

title.grob <- textGrob(
  label = "b) Dhaka, at 12:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapDhk09Density12 <- arrangeGrob(mapDhk09Density12, 
                              main = title.grob)

title.grob <- textGrob(
  label = "c) Hanoi, at 00:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapHni04Density0 <- arrangeGrob(mapHni04Density0, 
                                main = title.grob)

title.grob <- textGrob(
  label = "d) Hanoi, at 12:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapHni04Density12 <- arrangeGrob(mapHni04Density12, 
                                 main = title.grob)

# title.grob <- textGrob(
#   label = "e)",
#   x = unit(0, "lines"), 
#   y = unit(0, "lines"),
#   hjust = 0, vjust = 0,
#   gp = gpar(fontsize = 10))
# mapJkt02Density0 <- arrangeGrob(mapJkt02Density0, 
#                                 main = title.grob)
# 
# title.grob <- textGrob(
#   label = "f)",
#   x = unit(0, "lines"), 
#   y = unit(0, "lines"),
#   hjust = 0, vjust = 0,
#   gp = gpar(fontsize = 10))
# mapJkt02Density12 <- arrangeGrob(mapJkt02Density12, 
#                                  main = title.grob)

title.grob <- textGrob(
  label = "e) Manila, at 00:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapMnl96Density0 <- arrangeGrob(mapMnl96Density0, 
                                main = title.grob)

title.grob <- textGrob(
  label = "f) Manila, at 12:00",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapMnl96Density12 <- arrangeGrob(mapMnl96Density12, 
                                 main = title.grob)

png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig7.png",
    width = 17, height = 24, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(mapDhk09Density0,
                         mapDhk09Density12,
                         mapHni04Density0,
                         mapHni04Density12,
                         mapMnl96Density0,
                         mapMnl96Density12,
                         nrow = 3))
dev.off()






### unused

## Fig. 8
legendMapBins <- 
  extractGgplot2Legend(mapdhk09Bins + 
                         theme(legend.position="bottom") + 
                         guides(fill = guide_legend(ncol = 3)))
mapdhk09Bins <- mapdhk09Bins + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "a) Dhaka",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapdhk09Bins <- arrangeGrob(mapdhk09Bins, 
                            main = title.grob)

maphni04Bins <- maphni04Bins + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "b) Hanoi",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
maphni04Bins <- arrangeGrob(maphni04Bins, 
                            main = title.grob)

mapjkt02Bins <- mapjkt02Bins + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "c) Jakarta",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapjkt02Bins <- arrangeGrob(mapjkt02Bins, 
                            main = title.grob)

mapmnl96Bins <- mapmnl96Bins + 
  theme(legend.position = "none")
title.grob <- textGrob(
  label = "d) Metro Manila",
  x = unit(0, "lines"), 
  y = unit(0, "lines"),
  hjust = 0, vjust = 0,
  gp = gpar(fontsize = 10))
mapmnl96Bins <- arrangeGrob(mapmnl96Bins, 
                            main = title.grob)

png(filename = "/Users/konstantingreger/Documents/University of Tsukuba/Publications/pub004/img/fig8.png",
    width = 17, height = 19, units = "cm", res = 300, pointsize = 10)
grid.arrange(arrangeGrob(mapdhk09Bins,
                         maphni04Bins,
                         mapjkt02Bins,
                         mapmnl96Bins,
                         nrow = 2),
             legendMapBins, heights=c(9.4, .6))
dev.off()



table(dhk09.commbehav$phour_s, dhk09.commbehav$activity)
table(hni04.commbehav$phour_s, hni04.commbehav$activity)
table(jkt02.commbehav$phour_s, jkt02.commbehav$activity)
table(mnl96.commbehav$phour_s, mnl96.commbehav$activity)


table(subset(dhk09.trip, activity != "Home", activity)) / (sum(table(subset(dhk09.trip, activity != "Home", activity))) / 100)
table(subset(hni04.trip, activity != "Home", activity)) / (sum(table(subset(hni04.trip, activity != "Home", activity))) / 100)
table(subset(jkt02.trip, activity != "Home", activity)) / (sum(table(subset(jkt02.trip, activity != "Home", activity))) / 100)
table(subset(mnl96.trip, activity != "Home", activity)) / (sum(table(subset(mnl96.trip, activity != "Home", activity))) / 100)


## comparison age distributio of sample pop vs. country pop
# load country population data
popdat <- read.csv("../raw_data/CIA/popdat.csv", sep = ";", header = TRUE)
popdat$pop <- with(popdat, male + female)
popdat$agec <- factor(popdat$age, ordered = TRUE)
poptot <- summaryBy(pop ~ country, popdat, FUN = c(sum))
popdat <- merge(popdat, poptot, by = "country")
popdat$poprel <- with(popdat, pop / (pop.sum / 100))

# munge population data: dhk09
dhk09.person$agec <- cut(as.numeric(dhk09.person$age), 
                     breaks = c(-Inf, 3, 5, 11, 13, Inf),
                     labels = c("[0-15[", "[15-25[", "[25-55[", "[55-64[", 
                                "[65-Inf["))
popdat.dhk09 <- ddply(dhk09.person, ~ agec, summarize, pop = length(pid))
poptot.dhk09 <- sum(popdat.dhk09$pop)
popdat.dhk09$poprel <- popdat.dhk09$pop / (poptot.dhk09 / 100)
popdat.dhk09 <- merge(popdat.dhk09, popdat[popdat$country == "Bangladesh", ], 
                      by = "agec")
# plot population data: dhk09
plotAgeCompDhk09 <- ggplot(popdat.dhk09, aes(x = agec)) + 
  geom_bar(aes(y = poprel.x, fill = agec), stat = "identity") + 
  geom_bar(aes(y = poprel.y), stat = "identity", 
           fill = NA, color = "black", linetype = "dashed") +
  scale_y_continuous(labels = comma) +
  scale_x_discrete(limits = levels(popdat$agec)) + 
  scale_fill_discrete(h = gradientAge, drop = FALSE) + 
  labs(x = "Age Group", y = "Percent of Population") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")

# munge population data: hni04
hni04.person$agec <- cut(as.numeric(hni04.person$age), 
                         breaks = c(-Inf, 3, 5, 11, 13, Inf),
                         labels = c("[0-15[", "[15-25[", "[25-55[", "[55-64[", 
                                    "[65-Inf["))
popdat.hni04 <- ddply(hni04.person, ~ agec, summarize, pop = length(pid))
poptot.hni04 <- sum(popdat.hni04$pop)
popdat.hni04$poprel <- popdat.hni04$pop / (poptot.hni04 / 100)
popdat.hni04 <- merge(popdat.hni04, popdat[popdat$country == "Vietnam", ], 
                      by = "agec")
# plot population data: dhk09
plotAgeCompHni04 <- ggplot(popdat.hni04, aes(x = agec)) + 
  geom_bar(aes(y = poprel.x, fill = agec), stat = "identity") + 
  geom_bar(aes(y = poprel.y), stat = "identity", 
           fill = NA, color = "black", linetype = "dashed") +
  scale_y_continuous(labels = comma) +
  scale_x_discrete(limits = levels(popdat$agec)) + 
  scale_fill_discrete(h = gradientAge, drop = FALSE) + 
  labs(x = "Age Group", y = "Percent of Population") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")

# munge population data: jkt02
jkt02.person$agec <- cut(as.numeric(jkt02.person$age), 
                         breaks = c(-Inf, 3, 5, 11, 13, Inf),
                         labels = c("[0-15[", "[15-25[", "[25-55[", "[55-64[", 
                                    "[65-Inf["))
popdat.jkt02 <- ddply(jkt02.person, ~ agec, summarize, pop = length(pid))
poptot.jkt02 <- sum(popdat.jkt02$pop)
popdat.jkt02$poprel <- popdat.jkt02$pop / (poptot.jkt02 / 100)
popdat.jkt02 <- merge(popdat.jkt02, popdat[popdat$country == "Indonesia", ], 
                      by = "agec")
# plot population data: dhk09
plotAgeCompJkt02 <- ggplot(popdat.jkt02, aes(x = agec)) + 
  geom_bar(aes(y = poprel.x, fill = agec), stat = "identity") + 
  geom_bar(aes(y = poprel.y), stat = "identity", 
           fill = NA, color = "black", linetype = "dashed") +
  scale_y_continuous(labels = comma) +
  scale_x_discrete(limits = levels(popdat$agec)) + 
  scale_fill_discrete(h = gradientAge, drop = FALSE) + 
  labs(x = "Age Group", y = "Percent of Population") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")

# munge population data: mnl96
mnl96.person$agec <- cut(as.numeric(mnl96.person$age), 
                         breaks = c(-Inf, 3, 5, 11, 13, Inf),
                         labels = c("[0-15[", "[15-25[", "[25-55[", "[55-64[", 
                                    "[65-Inf["))
popdat.mnl96 <- ddply(mnl96.person, ~ agec, summarize, pop = length(pid))
poptot.mnl96 <- sum(popdat.mnl96$pop)
popdat.mnl96$poprel <- popdat.mnl96$pop / (poptot.mnl96 / 100)
popdat.mnl96 <- merge(popdat.mnl96, popdat[popdat$country == "Philippines", ], 
                      by = "agec")
# plot population data: dhk09
plotAgeCompMnl96 <- ggplot(popdat.mnl96, aes(x = agec)) + 
  geom_bar(aes(y = poprel.x, fill = agec), stat = "identity") + 
  geom_bar(aes(y = poprel.y), stat = "identity", 
           fill = NA, color = "black", linetype = "dashed") +
  scale_y_continuous(labels = comma) +
  scale_x_discrete(limits = levels(popdat$agec)) + 
  scale_fill_discrete(h = gradientAge, drop = FALSE) + 
  labs(x = "Age Group", y = "Percent of Population") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  theme(legend.position = "none")

# plot all four population data comparisons
grid.arrange(plotAgeCompDhk09, plotAgeCompHni04, plotAgeCompJkt02, 
             plotAgeCompMnl96, 
             ncol = 2, 
             main = "Age Group Comparison")