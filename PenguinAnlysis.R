library(tidyverse)

data <- read_table("data/penguin_data.txt")

glimpse(data)

model1<- lm( bill_length_mm ~ sex, data=data)
summary(model1)
ggplot(na.omit(data), aes(x=sex, y=bill_length_mm, color=species)) +
  geom_violin() +
  stat_smooth(method="lm")
ggsave("figs/BillLEngthVsSex.png")

model2<- lm( bill_length_mm ~ body_mass_g, data=data)
summary(model2)
ggplot(data, aes(x=body_mass_g, y=bill_length_mm, color=species)) +
  geom_point() +
  stat_smooth(method="lm")
dev.copy(pdf,"figs/BodyMassvsBill_Length.pdf")
dev.off()
#can also use ggsave("figs/BodymassVsBill_Length.png")
#Subset the data to only include males
datamale <- data[which(data$sex == "male"),]
write.table (datamale, "results/penguin_data_male.csv")
#Imporved version  of saving a file
write_tsv(datamale, "results/penguin_data_male.txt")


