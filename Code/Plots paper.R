############################################################################################
################# Gender-impact COVID-19 access on time-sensitive conditions  ##############
################# CoV-IMPACT-C                                           ###################
################# Autor: C. Cuadrado                                     ###################
################# v1: Sept 4, 2020                                       ###################
############################################################################################

### Limpiar espacio de trabajo
rm(list = ls(all.names = TRUE))

library(haven)
library(dplyr)
library(ggplot2)

data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/All cancer (excluding cervical, breast and testicular cancer).dta")
setwd("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Graphs")
colnames(data)

# Leukemia
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Leukemia.dta")
cancer <- "leukemia"

data <- data %>% rename(año=ano,
                sexo=sexo_,
                casos=`_freq`,
                grupo_exp=grupo)

leukemia <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
leukemia
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# Breast cancer
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Breast cancer.dta")
cancer <- "breast cancer"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
breast <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
breast
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# Cervical cancer
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Cervical cancer.dta")
cancer <- "cervical cancer"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
cervical <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
cervical
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5) 

# Lymphoma
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Lymphoma.dta")
cancer <- "lymphoma"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
lymphoma <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
lymphoma
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# Gastric cancer
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Gastric cancer.dta")
cancer <- "gastric cancer"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
gastric <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
gastric
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# Colorectal cancer
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Colorectal cancer.dta")
cancer <- "colorectal cancer"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
colorectal <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  ylim(0, NA) +
  xlim(0, 37) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
colorectal
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# Stroke
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Stroke.dta")
disease <- "stroke"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
stroke <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", disease, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
stroke
ggsave(paste(disease,".png"), width = 8*1.5, height = 6*1.5)   

# Myocardial infarction
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Myocardial infarction.dta")
disease <- "myocardial infarction"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
mi <- ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
mi
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)   

# All cancer (including cervical, breast and testicular cancer)
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/All cancer (including sex specific cancer).dta")
cancer <- "all-cancers"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5) 

# All cancer (excluding cervical, breast and testicular cancer)
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/All cancer (excluding sex specific cancer).dta")
cancer <- "all-cancers (excluding sex-specific)"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
ggplot(data %>% filter(semana>1) %>% 
         mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5) 


# All cardiovascular
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Cardiovascular diseases.dta")
cancer <- "major cardiovascular events"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
cv <- ggplot(data %>% filter(semana>1) %>% 
               mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019")) %>%
         group_by(semana, año, grupo_exp) %>% summarise(casos=sum(casos),
                                                        pred=sum(nhat),
                                                        ub=sum(ulim_nh),
                                                        lb=sum(llim_nh)) %>%
         group_by(semana, grupo_exp) %>% summarise(casos=mean(casos),
                                                   pred=mean(pred),
                                                   ub=mean(ub),
                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE)
cv
ggsave(paste(cancer,".png"), width = 8*1.5, height = 6*1.5)  

# Sex comparison

# All cardiovascular
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/Cardiovascular diseases.dta")
cancer <- "major cardiovascular events"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
cv.sex <- ggplot(data %>% filter(semana>1) %>% 
                   mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019"),
                                 sexo=ifelse(sexo==1, "Women", "Men")) %>%
               group_by(semana, año, sexo, grupo_exp) %>% summarise(casos=sum(casos),
                                                              pred=sum(nhat),
                                                              ub=sum(ulim_nh),
                                                              lb=sum(llim_nh)) %>%
               group_by(semana, sexo, grupo_exp) %>% summarise(casos=mean(casos),
                                                         pred=mean(pred),
                                                         ub=mean(ub),
                                                         lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE) +
  facet_wrap(~ sexo, scales = "fixed")
cv.sex
ggsave(paste(cancer,"sex.png"), width = 8*1.5, height = 6*1.5)  

# All cancer (excluding cervical, breast and testicular cancer)
data <- read_dta("~/Documents/GitHub/GES-covid-gender/gender-impact-access-covid/Data/All cancer (excluding sex specific cancer).dta")
cancer <- "all-cancers (excluding sex-specific)"
data <- data %>% rename(año=ano,
                        sexo=sexo_,
                        casos=`_freq`,
                        grupo_exp=grupo)
cancer.sex <- ggplot(data %>% filter(semana>1) %>% 
                       mutate(grupo_exp=ifelse(grupo_exp==1,"2020","2017-2019"),
                                 sexo=ifelse(sexo==1, "Women", "Men")) %>%
                   group_by(semana, año, sexo, grupo_exp) %>% summarise(casos=sum(casos),
                                                                        pred=sum(nhat),
                                                                        ub=sum(ulim_nh),
                                                                        lb=sum(llim_nh)) %>%
                   group_by(semana, sexo, grupo_exp) %>% summarise(casos=mean(casos),
                                                                   pred=mean(pred),
                                                                   ub=mean(ub),
                                                                   lb=mean(lb)),  aes(x=semana, y=casos, fill=grupo_exp)) +
  geom_point(alpha=0.3, aes(color=grupo_exp)) +
  geom_line(aes(x=semana, y=pred, color=grupo_exp)) +
  geom_ribbon(aes(ymin=lb, ymax=ub, group=grupo_exp), alpha=0.3) +
  ylim(0, NA) +
  xlim(0, 37) +
  theme_minimal() + labs(y=paste("Number of", cancer, "new diagnosis"), x="Week", fill="Period") +
  geom_vline(xintercept=11, # Semana de inicio medidas COVID-19
             linetype="dotted", color = "red") + theme_minimal() + guides(color=FALSE) +
  facet_wrap(~ sexo, scales = "fixed")
cancer.sex
ggsave(paste(cancer,"sex.png"), width = 8*1.5, height = 6*1.5)  


library(ggpubr)

ggarrange(mi + labs(y="Number of events",x="", title="A. Myocardial infarction"), 
          stroke + labs(y="Number of events",x="", title="B. Stroke"), 
          breast + labs(y="Number of events",x="", title="C. Breast cancer"), 
          cervical + labs(y="Number of events",x="", title="D. Cervical cancer"), 
          colorectal + labs(y="Number of events",x="", title="E. Colorectal cancer"), 
          gastric + labs(y="Number of events",x="", title="F. Gastric cancer"), 
          lymphoma + labs(y="Number of events", title="G. Lymphoma"), 
          leukemia + labs(y="Number of events", title="H. Leukemia"), 
          ncol = 2, nrow=4, common.legend = T, 
          legend="bottom")
ggsave("Figure 1.pdf", 
       device = "pdf",
       dpi = "retina",
       width = 10*1.5, height = 10*1.5)  

ggarrange(cancer.sex + labs(y="Number of events",x="", title="A. All-cancers (excluding sex-specific)"), 
          cv.sex + labs(y="Number of events",x="", title="B. Major cardiovascular events (stroke and myocardial infarction)"), nrow = 2,
          common.legend = T, 
          legend="bottom")
ggsave("Figure 2.pdf", 
       device = "pdf",
       dpi = "retina",
       width = 8*1.5, height = 6*1.5)  



