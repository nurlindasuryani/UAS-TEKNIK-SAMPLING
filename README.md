# ESTIMASI TINGKAT SELF-REGULATED LEARNING MAHASISWA PROGRAM STUDI STATISTIKA UNIVERSITAS MATARAM MENGGUNAKAN TWO-STAGE CLUSTER SAMPLING
## DESKRIPSI PROYEK
Proyek ini bertujuan untuk mengestimasi tingkat Self-Regulated Learning (SRL) mahasiswa Program Studi Statistika Universitas Mataram menggunakan metode Two-Stage Cluster Sampling. Penelitian dilakukan dengan menyebarkan kuesioner kepada mahasiswa terpilih berdasarkan desain sampling dua tahap. Tahap pertama adalah pemilihan cluster (misalnya berdasarkan angkatan atau kelas), sedangkan tahap kedua adalah pemilihan mahasiswa secara acak dari setiap cluster yang terpilih.
Data yang dikumpulkan berupa jawaban kuesioner menggunakan skala Likert empat tingkat. Selanjutnya dilakukan pengolahan data yang meliputi uji validitas, uji reliabilitas, pembentukan skor SRL, pembersihan data (data cleaning), perhitungan peluang terpilihnya sampel, pembentukan bobot sampel, serta analisis estimasi menggunakan metode Two-Stage Cluster Sampling. Hasil analisis akan menghasilkan estimasi rata-rata tingkat Self-Regulated Learning mahasiswa beserta ukuran presisinya, seperti standard error, interval kepercayaan 95%, dan relative standard error (RSE).
Proyek ini diharapkan memberikan gambaran yang akurat mengenai tingkat Self-Regulated Learning mahasiswa Program Studi Statistika Universitas Mataram. Hasil penelitian dapat dimanfaatkan sebagai dasar evaluasi dan penyusunan kebijakan akademik untuk meningkatkan kemampuan belajar mandiri mahasiswa, sekaligus menjadi contoh penerapan metode survei dan teknik estimasi berbasis Two-Stage Cluster Sampling dalam penelitian statistika.
## STRUKTUR REPOSITORY
# Struktur Repository

# DAFTAR ISI

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
1	A 2023	Mahasiswa Statistika Angkatan 2023 Kelas A
2	B 2023	Mahasiswa Statistika Angkatan 2023 Kelas B
3	A 2024	Mahasiswa Statistika Angkatan 2024 Kelas A
4	B 2024	Mahasiswa Statistika Angkatan 2024 Kelas B
5	A 2025	Mahasiswa Statistika Angkatan 2025 Kelas A
6	B 2025	Mahasiswa Statistika Angkatan 2025 Kelas B

Pengambilan sampel menggunakan metode Two-Stage Cluster Sampling. Pada tahap pertama dilakukan pemilihan kelas sebagai klaster secara acak sederhana. Selanjutnya, pada tahap kedua dilakukan pemilihan mahasiswa secara acak dari setiap kelas yang terpilih sebagai responden penelitian.

Populasi Mahasiswa Statistika

│

▼

6 Cluster (Kelas)
┌──────────────────────┐
│ A2023 │ B2023 │ A2024│
│ B2024 │ A2025 │ B2025│
└──────────────────────┘
│
Pengundian Acak
│
▼
Cluster Terpilih
┌────────────────┐
│    A2024       │
│    B2025       │
└────────────────┘
│
Pemilihan Mahasiswa Secara Acak
│
┌──────────────┐
│ A2024 = 11   │
│ B2025 = 19   │
└──────────────┘
│
▼
Total Sampel = 30

## ANALISIS DATA

### 1. Import Data

### 2. Persiapan Data

### 3. Mengubah Data Menjadi Numeriks

### 4. Uji Validitas

### 5. Uji Reliabilitas

### 5. Uji Reliabilitas

### 7. Statistik Deskriptif

### 8. Frekuensi Responden

### 9. Menentukan Bobot Sampling

### 10. Menghitung Bobot Akhir

### 11. Membentuk Desain Survei

### 12. Estimasi Parameter

### 13. Kategorisasi Tingkat Kemandirian Belajar

### 14. Estimasi Kategori
