# ESTIMASI TINGKAT SELF-REGULATED LEARNING MAHASISWA PROGRAM STUDI STATISTIKA UNIVERSITAS MATARAM MENGGUNAKAN TWO-STAGE CLUSTER SAMPLING
## DESKRIPSI PROYEK
Proyek ini bertujuan untuk mengestimasi tingkat Self-Regulated Learning (SRL) mahasiswa Program Studi Statistika Universitas Mataram menggunakan metode Two-Stage Cluster Sampling. Penelitian dilakukan dengan menyebarkan kuesioner kepada mahasiswa terpilih berdasarkan desain sampling dua tahap. Tahap pertama adalah pemilihan cluster (misalnya berdasarkan angkatan atau kelas), sedangkan tahap kedua adalah pemilihan mahasiswa secara acak dari setiap cluster yang terpilih.
Data yang dikumpulkan berupa jawaban kuesioner menggunakan skala Likert empat tingkat. Selanjutnya dilakukan pengolahan data yang meliputi uji validitas, uji reliabilitas, pembentukan skor SRL, pembersihan data (data cleaning), perhitungan peluang terpilihnya sampel, pembentukan bobot sampel, serta analisis estimasi menggunakan metode Two-Stage Cluster Sampling. Hasil analisis akan menghasilkan estimasi rata-rata tingkat Self-Regulated Learning mahasiswa beserta ukuran presisinya, seperti standard error, interval kepercayaan 95%, dan relative standard error (RSE).
Proyek ini diharapkan memberikan gambaran yang akurat mengenai tingkat Self-Regulated Learning mahasiswa Program Studi Statistika Universitas Mataram. Hasil penelitian dapat dimanfaatkan sebagai dasar evaluasi dan penyusunan kebijakan akademik untuk meningkatkan kemampuan belajar mandiri mahasiswa, sekaligus menjadi contoh penerapan metode survei dan teknik estimasi berbasis Two-Stage Cluster Sampling dalam penelitian statistika.
## STRUKTUR REPOSITORY

## LATAR BELAKANG
Self-Regulated Learning (SRL) merupakan kemampuan individu dalam mengatur, mengendalikan, dan mengevaluasi proses belajarnya secara mandiri untuk mencapai tujuan akademik. Mahasiswa yang memiliki tingkat SRL yang baik cenderung mampu menetapkan target belajar, mengelola waktu, mencari sumber belajar tambahan, serta melakukan evaluasi terhadap hasil belajar yang telah dicapai. Kemampuan ini sangat penting terutama bagi mahasiswa Program Studi Statistika yang dituntut memiliki kemampuan berpikir kritis, analitis, dan mandiri dalam memahami berbagai konsep statistik.
Setiap mahasiswa memiliki tingkat Self-Regulated Learning yang berbeda-beda. Perbedaan tersebut dipengaruhi oleh berbagai faktor, seperti motivasi belajar, manajemen waktu, lingkungan belajar, serta kebiasaan belajar. Oleh karena itu, diperlukan penelitian untuk mengetahui gambaran tingkat Self-Regulated Learning mahasiswa Program Studi Statistika Universitas Mataram.
Penelitian ini menggunakan metode Two-Stage Cluster Sampling, yaitu teknik pengambilan sampel dua tahap. Pada tahap pertama dipilih kelas secara acak sebagai klaster, kemudian pada tahap kedua dipilih mahasiswa secara acak dari kelas yang terpilih. Teknik ini dipilih karena lebih efisien dalam proses pengumpulan data dan sesuai dengan kondisi populasi yang terbagi dalam beberapa kelas.
Hasil penelitian ini diharapkan dapat memberikan informasi mengenai tingkat Self-Regulated Learning mahasiswa Program Studi Statistika Universitas Mataram serta menjadi bahan evaluasi bagi program studi dalam menyusun strategi peningkatan kualitas pembelajaran.

## TUJUAN PENELITIAN
•	Mengetahui tingkat Self-Regulated Learning mahasiswa Program Studi Statistika Universitas Mataram.
•	Mengestimasi rata-rata tingkat Self-Regulated Learning mahasiswa menggunakan metode Two-Stage Cluster Sampling.
•	Mengetahui tingkat ketelitian hasil estimasi melalui perhitungan SE, RSE, Interval Kepercayaan 95%, dan Design Effect (Deff).

## METODOLOGI PENELITIAN
Jenis Penelitian
Penelitian ini merupakan penelitian kuantitatif dengan metode survei. Data dikumpulkan melalui penyebaran kuesioner kepada mahasiswa Program Studi Statistika Universitas Mataram untuk memperoleh informasi mengenai tingkat Self-Regulated Learning.
2.2 Populasi dan Sampel
Populasi dalam penelitian ini adalah seluruh mahasiswa Program Studi Statistika Universitas Mataram yang menjadi sasaran penelitian.
No	Cluster	Keterangan
1	A 2023	  Mahasiswa Statistika Angkatan 2023 Kelas A
2	B 2023	  Mahasiswa Statistika Angkatan 2023 Kelas B
3	A 2024	  Mahasiswa Statistika Angkatan 2024 Kelas A
4	B 2024  	Mahasiswa Statistika Angkatan 2024 Kelas B
5	A 2025	  Mahasiswa Statistika Angkatan 2025 Kelas A
6	B 2025	  Mahasiswa Statistika Angkatan 2025 Kelas B

Pengambilan sampel menggunakan metode Two-Stage Cluster Sampling. Pada tahap pertama dilakukan pemilihan kelas sebagai klaster secara acak sederhana. Selanjutnya, pada tahap kedua dilakukan pemilihan mahasiswa secara acak dari setiap kelas yang terpilih sebagai responden penelitian.
<img width="237" height="391" alt="image" src="https://github.com/user-attachments/assets/838cea4c-bb90-452f-b599-e7ddff221100" />

## ANALISIS DATA
# MEMANGGIL PACKAGE

library(readxl)
library(psych)
library(survey)

Keterangan:
library(readxl) digunakan untuk membaca data yang tersimpan dalam file Excel (.xlsx).
library(psych) digunakan untuk melakukan analisis psikometrik, seperti uji reliabilitas menggunakan Cronbach's Alpha.
library(survey) digunakan untuk menganalisis data survei yang menggunakan desain sampling kompleks, seperti Two-Stage Cluster Sampling.

# IMPORT DATA
DATA_TEKSAM <- read_excel("tugas teksam/DATA TEKSAM.xlsx")
View(DATA_TEKSAM)

Keterangan:
read_excel() digunakan untuk mengimpor data kuesioner dari file Excel ke dalam R.
Data disimpan pada objek DATA_TEKSAM.
View() digunakan untuk menampilkan data sehingga dapat diperiksa apakah data telah terbaca dengan benar.
Item Pertanyaan

# ITEM PERTANYAAN

item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

Keterangan:

Membuat sebuah vektor bernama item yang berisi seluruh variabel pertanyaan pada kuesioner.
Vektor ini akan digunakan pada proses analisis berikutnya sehingga tidak perlu menuliskan nama variabel satu per satu.

### Mengubah Data Menjadi Numeriks

DATA_TEKSAM[item] <- lapply(DATA_TEKSAM[item],
                            function(x) as.numeric(as.character(x)))

Keterangan:

Mengubah seluruh jawaban responden menjadi tipe data numerik.
Langkah ini diperlukan karena perhitungan statistik seperti rata-rata, korelasi, dan simpangan baku hanya dapat dilakukan pada data numerik.
### Uji Validitas
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

Keterangan:

Menghitung skor total setiap responden menggunakan rowSums().
Melakukan uji validitas setiap butir pertanyaan menggunakan korelasi Pearson.
Nilai r_hitung dibandingkan dengan r_tabel = 0,361.
Item dinyatakan Valid apabila r_hitung > r_tabel, sedangkan jika lebih kecil dinyatakan Tidak Valid.
### Uji Reliabilitas
hasil_alpha <- alpha(DATA_TEKSAM[item])

hasil_alpha

hasil_alpha$total$raw_alpha

Keterangan:

Menghitung nilai Cronbach's Alpha untuk mengetahui konsistensi jawaban responden.
Semakin tinggi nilai Alpha menunjukkan instrumen semakin reliabel.
Umumnya instrumen dikatakan reliabel apabila nilai Alpha ≥ 0,70.
Menghitung Skor

# MENGHITUNG SKOR

DATA_TEKSAM$Skor <- rowMeans(DATA_TEKSAM[item], na.rm = TRUE)

Keterangan:

Menghitung rata-rata skor seluruh item untuk setiap responden.
Nilai inilah yang digunakan sebagai skor Self-Regulated Learning masing-masing mahasiswa.
### Statistik Deskriptif
summary(DATA_TEKSAM$Skor)

mean(DATA_TEKSAM$Skor)

sd(DATA_TEKSAM$Skor)

min(DATA_TEKSAM$Skor)

max(DATA_TEKSAM$Skor)

Keterangan:

summary() menampilkan ringkasan statistik data.
mean() menghitung rata-rata skor.
sd() menghitung simpangan baku.
min() mencari nilai terkecil.
max() mencari nilai terbesar.
### Frekuensi Responden
table(DATA_TEKSAM$KELAS)

table(DATA_TEKSAM$ANGKATAN)

Keterangan:
Menampilkan jumlah responden berdasarkan kelas.
Menampilkan jumlah responden berdasarkan angkatan.
# INFORMASI SAMPLING

M <- 6
m <- 2

NA24 <- 25
NB25 <- 31

nA24 <- 11
nB25 <- 19

Keterangan:

M adalah jumlah cluster dalam populasi.
m adalah jumlah cluster yang dipilih.
NA24 dan NB25 adalah jumlah populasi pada masing-masing cluster.
nA24 dan nB25 adalah jumlah sampel yang diambil dari masing-masing cluster.
Peluang Pemilihan

# PELUANG PEMILIHAN

P1 <- m/M

P2_A24 <- nA24/NA24
P2_B25 <- nB25/NB25

Pi_A24 <- P1 * P2_A24
Pi_B25 <- P1 * P2_B25

Keterangan:

Menghitung peluang pemilihan cluster pada tahap pertama.
Menghitung peluang pemilihan mahasiswa pada tahap kedua.
Mengalikan kedua peluang untuk memperoleh peluang keseluruhan responden terpilih.
Bobot Dasar

# BOBOT DASAR

Bobot_A24 <- 1/Pi_A24
Bobot_B25 <- 1/Pi_B25

Keterangan:

Bobot dasar dihitung sebagai kebalikan dari peluang pemilihan.
Bobot ini digunakan agar hasil analisis dapat mewakili populasi.
Response Rate

# RESPONSE RATE

Target <- 30

ResponseRate <- nrow(DATA_TEKSAM)/Target

ResponseRate

Keterangan:

Menghitung tingkat respons responden.
Response Rate diperoleh dari jumlah responden yang mengisi kuesioner dibagi target sampel.

### Menghitung Bobot Akhir

DATA_TEKSAM$Bobot_Akhir <-
  ifelse(DATA_TEKSAM$KELAS=="A",
         Bobot_A24/ResponseRate,
         Bobot_B25/ResponseRate)

Keterangan:

Menyesuaikan bobot dasar dengan response rate.
Bobot akhir digunakan dalam seluruh analisis survei sehingga hasil estimasi lebih representatif terhadap populasi.
### Membentuk Desain Survei

design_cluster <- svydesign(
  id = ~KELAS,
  weights = ~Bobot_Akhir,
  data = DATA_TEKSAM
)

Keterangan:

Membentuk objek desain survei menggunakan package survey.
id = ~KELAS menunjukkan bahwa kelas merupakan cluster.
weights = ~Bobot_Akhir menunjukkan bobot yang digunakan pada analisis.
### 12. Estimasi Parameter
mean_kb <- svymean(~Skor,
                   design_cluster)

mean_kb

Keterangan:

svymean() digunakan untuk menghitung estimasi rata-rata (mean) tingkat kemandirian belajar berdasarkan desain Two-Stage Cluster Sampling.
~Skor menunjukkan variabel yang akan diestimasi, yaitu skor Self-Regulated Learning.
design_cluster adalah objek desain survei yang telah memuat informasi cluster dan bobot sampel.
Hasil mean_kb merupakan estimasi rata-rata tingkat kemandirian belajar mahasiswa pada populasi.
###  Kategorisasi Tingkat SELF-REGULATED LEARNING

DATA_TEKSAM$Kategori <- cut(
  DATA_TEKSAM$Skor,
  breaks = c(1,1.75,2.50,3.25,4),
  labels = c("Sangat Rendah",
             "Rendah",
             "Tinggi",
             "Sangat Tinggi"),
  include.lowest = TRUE
)

Keterangan:

Fungsi cut() digunakan untuk mengelompokkan skor Self-Regulated Learning ke dalam beberapa kategori.
Interval kategori yang digunakan adalah:
1,00–1,75 = Sangat Rendah
1,76–2,50 = Rendah
2,51–3,25 = Tinggi
3,26–4,00 = Sangat Tinggi
Hasil pengelompokan disimpan pada variabel Kategori.
# Estimasi Kategori
design_cluster <- svydesign(
  id = ~KELAS,
  weights = ~Bobot_Akhir,
  data = DATA_TEKSAM
)

Keterangan:

Memperbarui objek desain survei setelah variabel Kategori ditambahkan ke dalam data.
Langkah ini memastikan bahwa variabel kategori ikut dikenali dalam analisis survei.

## HASIL DAN PEMBAHASAN

# Uji Validitas
Hasil uji validitas menunjukkan:

| Item | r hitung | Keputusan   |
| ---- | -------: | ----------- |
| P1   |    0,353 | Tidak Valid |
| P2   |    0,456 | Valid       |
| P3   |    0,443 | Valid       |
| P4   |    0,365 | Valid       |
| P5   |    0,489 | Valid       |
| P6   |    0,363 | Valid       |
| P7   |    0,466 | Valid       |
| P8   |    0,462 | Valid       |
| P9   |    0,090 | Tidak Valid |
| P10  |    0,597 | Valid       |

Interpretasi

Berdasarkan uji validitas menggunakan korelasi Pearson dengan nilai r tabel = 0,361, diperoleh bahwa 8 dari 10 butir pertanyaan dinyatakan valid, yaitu P2, P3, P4, P5, P6, P7, P8, dan P10. Sementara itu P1 dan P9 tidak valid karena memiliki nilai r hitung lebih kecil dari r tabel.

## Uji Reliabilitas

Nilai:

Cronbach Alpha = 0,734

Interpretasi

Nilai Cronbach Alpha sebesar 0,734 (>0,70) menunjukkan bahwa instrumen penelitian memiliki reliabilitas yang baik, sehingga kuesioner memiliki konsistensi internal yang memadai untuk digunakan dalam penelitian.

## Skor SRL

Mean = 2,367
Median = 2,200
Minimum = 1,900
Maksimum = 3,700

Interpretasi

Skor Self-Regulated Learning diperoleh dari rata-rata jawaban 10 item pada setiap responden. Nilai rata-rata sebesar 2,367 menunjukkan bahwa secara umum tingkat Self-Regulated Learning mahasiswa berada pada kategori Rendah.

## Cleaning Missing Value
Output Alpha:

miss = 0

Interpretasi

Tidak ditemukan data yang hilang (missing value = 0) pada seluruh item kuesioner sehingga tidak diperlukan proses imputasi maupun penghapusan data.
## Deteksi & Penghapusan Outlier
<img width="461" height="311" alt="image" src="https://github.com/user-attachments/assets/8b578d91-f11c-46c4-8aa0-1239c6bec562" />
<img width="454" height="306" alt="image" src="https://github.com/user-attachments/assets/a47867bd-51ef-42f9-b19a-295ea5e55f7e" />

Interpretasi

Berdasarkan gambar terdapat beberapa nilai outlier pada skor sekitar 2,9–3,7.

## Analisis SRS

Mean = 2,367
SD = 0,392

Interpretasi

Pada pendekatan Simple Random Sampling (SRS) diperoleh rata-rata skor Self-Regulated Learning sebesar 2,367.

## Analisis Two-Stage Cluster Sampling
Hasil

Mean = 2,380

SE = 0,083

Interpretasi

Setelah memperhitungkan bobot dan desain cluster, estimasi rata-rata Self-Regulated Learning menjadi 2,380. Nilai ini sedikit lebih besar dibandingkan rata-rata SRS karena mempertimbangkan struktur pengambilan sampel.

## Confidence Interval 95%

2,217 – 2,543

Interpretasi

Dengan tingkat kepercayaan 95%, rata-rata Self-Regulated Learning populasi diperkirakan berada pada interval 2,217 hingga 2,543.
## Relative Standard Error (RSE)

3,50 %

Interpretasi

Nilai RSE sebesar 3,50% berada jauh di bawah batas 25%, sehingga estimasi rata-rata memiliki ketelitian yang sangat baik dan layak digunakan sebagai dasar pengambilan kesimpulan.
## Design Effect (DEFF)

DEFF = 1,481

Interpretasi

Nilai Design Effect sebesar 1,481 menunjukkan bahwa varians pada desain Two-Stage Cluster Sampling sekitar 1,48 kali lebih besar dibandingkan jika menggunakan Simple Random Sampling.

## KESIMPULAN

Berdasarkan hasil penelitian mengenai Kajian Tingkat Self-Regulated Learning (SRL) Mahasiswa Program Studi Statistika Universitas Mataram Menggunakan Two-Stage Cluster Sampling, dapat disimpulkan bahwa:

Hasil uji validitas menunjukkan bahwa dari 10 butir pertanyaan yang digunakan, terdapat 8 butir yang valid dan 2 butir yang tidak valid, yaitu item P1 dan P9. Sementara itu, hasil uji reliabilitas memperoleh nilai Cronbach's Alpha sebesar 0,734, sehingga instrumen penelitian dinyatakan reliabel dan layak digunakan sebagai alat pengumpulan data

Hasil statistik deskriptif menunjukkan bahwa rata-rata skor Self-Regulated Learning (SRL) mahasiswa adalah 2,367, dengan skor minimum 1,900, skor maksimum 3,700, dan simpangan baku sebesar 0,392. Secara umum, nilai tersebut menunjukkan bahwa tingkat Self-Regulated Learning mahasiswa masih berada pada kategori Rendah.
Berdasarkan analisis menggunakan Two-Stage Cluster Sampling, diperoleh estimasi rata-rata tingkat Self-Regulated Learning sebesar 2,380 dengan Standard Error sebesar 0,083 dan Interval Kepercayaan 95% sebesar 2,217–2,543. Nilai Relative Standard Error (RSE) sebesar 3,50% menunjukkan bahwa hasil estimasi memiliki tingkat ketelitian yang sangat baik karena berada di bawah batas 25%. Selain itu, nilai Design Effect (DEFF) sebesar 1,481 menunjukkan bahwa varians pada desain Two-Stage Cluster Sampling sekitar 1,48 kali lebih besar dibandingkan dengan Simple Random Sampling akibat adanya pengelompokan (cluster).
Berdasarkan kategorisasi tingkat Self-Regulated Learning, diperoleh bahwa sekitar 75,31% mahasiswa berada pada kategori Rendah, 20,68% berada pada kategori Tinggi, 4,01% berada pada kategori Sangat Tinggi, dan tidak terdapat mahasiswa yang berada pada kategori Sangat Rendah. Hal ini menunjukkan bahwa sebagian besar mahasiswa Program Studi Statistika Universitas Mataram masih memiliki tingkat Self-Regulated Learning yang relatif rendah sehingga perlu adanya upaya untuk meningkatkan kemampuan mengatur proses belajar secara mandiri.
Perbandingan antara Simple Random Sampling (SRS) dan Two-Stage Cluster Sampling menunjukkan bahwa kedua metode menghasilkan rata-rata yang hampir sama (2,367 pada SRS dan 2,380 pada Two-Stage Cluster Sampling). Namun, metode Two-Stage Cluster Sampling lebih tepat digunakan karena memperhitungkan struktur cluster dan bobot sampel, serta menghasilkan ukuran ketelitian estimasi seperti Standard Error, Confidence Interval, Relative Standard Error, dan Design Effect, sehingga estimasi yang diperoleh lebih representatif terhadap populasi penelitian
