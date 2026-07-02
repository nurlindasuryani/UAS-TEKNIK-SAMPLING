#=========================================================
# ESTIMASI TINGKAT KEMANDIRIAN BELAJAR
# TWO STAGE CLUSTER SAMPLING
#=========================================================

#=========================================================
# MEMANGGIL PACKAGE
#=========================================================

library(readxl)
library(psych)
library(survey)

#=========================================================
# IMPORT DATA
#=========================================================

DATA_TEKSAM <- read_excel("tugas teksam/DATA TEKSAM.xlsx")

View(DATA_TEKSAM)

#=========================================================
# ITEM PERTANYAAN
#=========================================================

item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

#=========================================================
# UBAH KE NUMERIC
#=========================================================

DATA_TEKSAM[item] <- lapply(DATA_TEKSAM[item],
                            function(x) as.numeric(as.character(x)))

#=========================================================
# UJI VALIDITAS
#=========================================================

DATA_TEKSAM$TOTAL <- rowSums(DATA_TEKSAM[item], na.rm = TRUE)

hasil_validitas <- data.frame()

for(i in item){
  
  total_koreksi <- DATA_TEKSAM$TOTAL - DATA_TEKSAM[[i]]
  
  uji <- cor.test(DATA_TEKSAM[[i]],
                  total_koreksi,
                  method="pearson")
  
  hasil_validitas <- rbind(
    hasil_validitas,
    data.frame(
      Item=i,
      r_hitung=round(uji$estimate,3),
      p_value=round(uji$p.value,4)
    )
  )
}

r_tabel <- 0.361

hasil_validitas$Keputusan <-
  ifelse(hasil_validitas$r_hitung > r_tabel,
         "Valid",
         "Tidak Valid")

hasil_validitas

#=========================================================
# UJI RELIABILITAS
#=========================================================

hasil_alpha <- alpha(DATA_TEKSAM[item])

hasil_alpha

hasil_alpha$total$raw_alpha

#=========================================================
# MENGHITUNG SKOR
#=========================================================

DATA_TEKSAM$Skor <- rowMeans(DATA_TEKSAM[item], na.rm = TRUE)

#=========================================================
# STATISTIK DESKRIPTIF
#=========================================================

summary(DATA_TEKSAM$Skor)

mean(DATA_TEKSAM$Skor)

sd(DATA_TEKSAM$Skor)

min(DATA_TEKSAM$Skor)

max(DATA_TEKSAM$Skor)

#=========================================================
# FREKUENSI RESPONDEN
#=========================================================

table(DATA_TEKSAM$KELAS)

table(DATA_TEKSAM$ANGKATAN)

table(DATA_TEKSAM$JK)

#=========================================================
# INFORMASI SAMPLING
#=========================================================

M <- 6
m <- 2

NA24 <- 25
NB25 <- 31

nA24 <- 11
nB25 <- 19

#=========================================================
# PELUANG PEMILIHAN
#=========================================================

P1 <- m/M

P2_A24 <- nA24/NA24
P2_B25 <- nB25/NB25

Pi_A24 <- P1 * P2_A24
Pi_B25 <- P1 * P2_B25

#=========================================================
# BOBOT DASAR
#=========================================================

Bobot_A24 <- 1/Pi_A24
Bobot_B25 <- 1/Pi_B25

#=========================================================
# RESPONSE RATE
#=========================================================

Target <- 30

ResponseRate <- nrow(DATA_TEKSAM)/Target

ResponseRate

#=========================================================
# BOBOT AKHIR
#=========================================================

DATA_TEKSAM$Bobot_Akhir <-
  ifelse(DATA_TEKSAM$KELAS=="A",
         Bobot_A24/ResponseRate,
         Bobot_B25/ResponseRate)

#=========================================================
# DESAIN SURVEI
#=========================================================

design_cluster <- svydesign(
  id = ~KELAS,
  weights = ~Bobot_Akhir,
  data = DATA_TEKSAM
)

#=========================================================
# ESTIMASI RATA-RATA
#=========================================================

mean_kb <- svymean(~Skor,
                   design_cluster)

mean_kb

#=========================================================
# STANDARD ERROR
#=========================================================

SE(mean_kb)

#=========================================================
# CONFIDENCE INTERVAL
#=========================================================

confint(mean_kb)

#=========================================================
# RELATIVE STANDARD ERROR
#=========================================================

RSE <- (SE(mean_kb)/coef(mean_kb))*100

RSE

cat("Nilai RSE =",
    round(RSE,2),
    "%\n")

#=========================================================
# DESIGN EFFECT
#=========================================================

svymean(~Skor,
        design_cluster,
        deff = TRUE)

#=========================================================
# ESTIMASI PER CLUSTER
#=========================================================

svyby(~Skor,
      ~KELAS,
      design_cluster,
      svymean)

#=========================================================
# KATEGORI TINGKAT KEMANDIRIAN BELAJAR
#=========================================================

DATA_TEKSAM$Kategori <- cut(
  DATA_TEKSAM$Skor,
  breaks = c(1,1.75,2.50,3.25,4),
  labels = c("Sangat Rendah",
             "Rendah",
             "Tinggi",
             "Sangat Tinggi"),
  include.lowest = TRUE
)

#=========================================================
# UPDATE DESAIN SURVEI
#=========================================================

design_cluster <- svydesign(
  id = ~KELAS,
  weights = ~Bobot_Akhir,
  data = DATA_TEKSAM
)

#=========================================================
# ESTIMASI KATEGORI
#=========================================================

svytable(~Kategori,
         design_cluster)

prop.table(
  svytable(~Kategori,
           design_cluster)
)

library(ggplot2)
library(dplyr)
#=========================================================

#VISUALISASI 1 HISTOGRAM SKOR

#=========================================================

ggplot(DATA_TEKSAM, aes(x = Skor)) +
  geom_histogram(binwidth = 0.25,
                 fill = "steelblue",
                 color = "black") +
  labs(title = "Distribusi Skor SELF-REGULATED LEARNING",
       x = "Skor",
       y = "Frekuensi") +
  theme_minimal()

#VISUALISASI 2 BOXPLOT

#=========================================================

ggplot(DATA_TEKSAM,
       aes(y = Skor)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Boxplot Skor SELF-REGULATED LEARNING",
       y = "Skor") +
  theme_minimal()

#VISUALISASI 3 JUMLAH RESPONDEN PER KELAS

#=========================================================

ggplot(DATA_TEKSAM,
       aes(x = KELAS,
           fill = KELAS)) +
  geom_bar() +
  labs(title = "Jumlah Responden per Kelas",
       x = "Kelas",
       y = "Frekuensi") +
  theme_minimal(
    
#VISUALISASI 7 RATA-RATA SKOR PER KELAS

#=========================================================

ggplot(DATA_TEKSAM,
       aes(x = KELAS,
           y = Skor,
           fill = KELAS)) +
  stat_summary(fun = mean,
               geom = "bar") +
  labs(title = "Rata-rata Skor SELF-REGULATED LEARNING per Kelas",
       x = "Kelas",
       y = "Rata-rata Skor") +
  theme_minimal()

library(ggplot2)

ggplot(DATA_TEKSAM, aes(x = Kategori, fill = Kategori)) +
  geom_bar(color = "black") +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.4
  ) +
  labs(
    title = "Tingkat SELF-REGULATED LEARNING Mahasiswa",
    x = "Kategori",
    y = "Jumlah Responden"
  ) +
  theme_minimal()
