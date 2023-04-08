-- create database covid19indo;
-- use covid19indo;

select * from covid;

/* Buat kueri untuk menghitung total kasus aktif Covid-19 untuk setiap provinsi, 
 * lalu urutkan berdasarkan kasus tertinggi
 */
select distinct Province, sum(`Total Active Cases`) as Total_Kasus_Aktif
from covid
group by Province 
order by Province desc;

/*Ambil 2 lokasi kode iso dengan jumlah kematian 
 * paling sedikit karena Covid-19
 */
select distinct `Location ISO Code` Location_iso_code, sum(`Total Deaths`) Total_kematian
from covid
group by 1
order by 2
limit 2;

/*Cari tanggal dengan angka sembuh tertinggi di Indonesia, 
 * tampilkan dengan nilainya
 */

select distinct date as tanggal, MAX(`Total Recovered`) as angka_sembuh_tertinggi
from covid
where Country = "Indonesia"
group by 1
order by 1 desc
limit 1;

/*
 * Temukan total tingkat kematian kasus dan tingkat pemulihan 
 * kasus dari setiap kode iso lokasi dan urutkan berdasarkan nilai terendah
 */

select distinct `Location ISO Code` kode_iso_lokasi, sum(`Total Deaths`) total_kematian, sum(`Total Recovered`) total_pemulihan
from covid 
group by 1
order by 2,3;

/*
 * Tanggal berapa total kasus Covid-19 di Indonesia mencapai 30.000 kasus?
 */

select distinct date, `Total Cases` as Total_Kasus
from covid
where `Total Cases` = 30000
group by 1
order by 1;

/* Hitung jumlah data saat kasus covid mulai menyentuh 30.000 kasus
*/

select count(*) jumlah_data
from covid
where `Total Cases` >= 30000