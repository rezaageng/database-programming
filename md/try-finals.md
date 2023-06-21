# Latihan Persiapan UAS Pemograman Basis Data

Reza Ageng Trihandoko (223040085)

## Essay

### Soal 1

```sql
SELECT DISTINCT siswa.nama_siswa,
siswa.alamat_siswa
```

Bertujuan untuk mengembalikan nilai yang unik dari kolom `nama_siswa` dan `alamat_siswa` dari table `siswa`.

### Soal 2

```sql
SELECT siswa.kode_siswa, (siswa.nilai_latihan * 0.5) + (siswa.nilai_tugas * 0.5) as
Nilai_Harian
FROM siswa
```

Output:

| kode_siswa | Nilai_Harian |
| ---------- | ------------ |
| S017       | 550          |

### Soal 3

Perbedaan antara `BETWEEN` dan `IN` adalah `BETWEEN` digunakan untuk menampilkan data yang berada diantara nilai tertentu, sedangkan `IN` digunakan untuk menampilkan data yang memiliki nilai tertentu.

### Soal 4

Perbedaan antara `UNION` dan `UNION ALL` adalah `UNION` digunakan untuk menggabungkan dua atau lebih tabel yang memiliki struktur yang sama dan hanya mengembalikan nilai yang unik, sedangkan `UNION ALL` digunakan untuk menggabungkan dua atau lebih tabel yang memiliki struktur yang sama dan mengembalikan semua nilai yang ada.

### Soal 5

Yang dimaksud dengan _sub query (nested query)_ adalah query yang berada didalam query lainnya.

Contoh:

```sql
SELECT * FROM siswa WHERE kode_siswa IN (
  SELECT kode_siswa FROM nilai WHERE nilai_tugas > 80
)
```

## SQL Query

### Soal 1

```sql
SELECT AVG(biaya_proyek) FROM proyek
```

### Soal 2

```sql
SELECT staff.nama_staff, kerja_proyek.tanggal_mulai_kerja
FROM staff NATURAL JOIN kerja_proyek
WHERE YEAR(staff.tanggal_lahir) = 1995
```

### Soal 3

```sql
SELECT * FROM staff NATURAL JOIN kerja_proyek NATURAL JOIN proyek
WHERE id_proyek = 'P-IT234'
AND nama_proyek = 'Information System Development Pasundan University'
```

### Soal 4

```sql
SELECT staff.id_staff, staff.nama_staff FROM staff
LEFT JOIN kerja_proyek ON staff.id_staff = kerja_proyek.id_staff
WHERE kerja_proyek.id_staff IS NULL AND staff.jabatan = '2'
```

### Soal 5

```sql
SELECT id_staff, nama_staff,
CASE jabatan
  WHEN '1' THEN 'Komisaris'
  WHEN '2' THEN 'Direktur'
  WHEN '3' THEN 'Manager'
  ELSE 'Staff Proyek'
END as jabatan
FROM staff
```

## Transaksi SQL

### Soal 1

```sql
START TRANSACTION;

INSERT INTO staff VALUES (
  'S-IT2',
  'Reza Ageng Trihandoko',
  'Bandung',
  '082220238766',
  '2003-04-07',
  'l',
  '2'
);

INSERT INTO proyek VALUES (
  'P-IT7',
  'Artificial intelligence development',
  'Bandung',
  '2021-08-02',
  '2023-04-24',
  '1000000000'
);

INSERT INTO kerja_proyek VALUES (
  '2021-08-02',
  'S-IT2',
  'P-IT7'
);

COMMIT;
```

### Soal 2

```sql
START TRANSACTION;

SELECT id_staff, nama_staff, jabatan FROM staff
UPDATE staff SET jabatan = '2' WHERE jabatan = '3'

COMMIT;
```

### Soal 3

```sql
START TRANSACTION;

SELECT staff.id_staff, staff.nama_staff, staff.no_hp, staff.jabatan FROM staff
INNER JOIN kerja_proyek ON staff.id_staff = kerja_proyek.id_staff

DELETE FROM kerja_proyek
WHERE id_proyek IN (
  SELECT id_proyek
  FROM proyek
  WHERE nama_proyek = 'Information System Development Pasundan University'
) LIMIT 2;

COMMIT;
```
