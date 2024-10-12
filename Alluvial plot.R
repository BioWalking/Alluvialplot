library(ggplot2)
library(ggalluvial)
library(ggsci)
mydata<- result %>%
  gather(key="Cell",value="Expression",PreHTC:preInfC) %>%
  dplyr::select(Mixture,Expression,everything())
ggplot(data =mydata,
       aes(x = Mixture,
           y = Expression,
           alluvium = Cell)) +
  geom_alluvium(aes(fill = Cell, colour = Cell),
                alpha = .75, decreasing = FALSE, size=0.1,color="black") +
  theme_bw() +
  theme(legend.position = "right",
        panel.grid=element_blank(),
        panel.spacing.x = unit(-2,units = "cm"),
        strip.background = element_rect(
          color="white", fill="white", 
          linetype="solid",size=0.8),
        strip.text.x = element_text(size = 18,face = "bold"),
        axis.text = element_text(size = 18,color="black",margin = margin(t = 0)),
        axis.title = element_text(face = "bold",size = 18,colour = "black"),
        legend.title = element_text(face = "bold",size =18,color="black"),
        legend.text = element_text(size =16,color="black"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_line(size = 0.3)) +
  scale_fill_brewer(type = "qual", palette = "Set3") +
  scale_color_brewer(type = "qual", palette = "Set3") +
  labs(x = NULL,y= "Proportion of cell types after deconvolution")