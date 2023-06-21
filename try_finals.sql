USE try_finals
go

CREATE TABLE siswa(
kode_siswa char(10) PRIMARY KEY NOT NULL,
nama_siswa char(30) NOT NULL,
alamat_siswa char(50) NOT NULL,
tanggal_lahir_siswa date,
nilai_latihan int,
nilai_tugas int,
nilai_ujian int)



