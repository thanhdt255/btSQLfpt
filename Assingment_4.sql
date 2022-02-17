create table NHACUNGCAP(
MaNhaCC char(6) primary key  ,
TenNhaCC nvarchar(255) not null ,
DiaChi nvarchar(255),
soDT varchar(255),
MaSoThue varchar(255));
create table MUCPHI(
MaMP char(4) primary key  ,
DonGia varchar(255) not null ,
MoTa nvarchar(255)
);
create table LOAIDICHVU(
MaLoaiDV nchar(4) primary key,
TenLoaiDV ntext not null
);
create table DONGXE(
DongXe nvarchar(255) primary key,
HangXe nvarchar(255) not null,
SoChoNgoi int,);
create table DANGKYCUNGCAP(
MaDKCC char(5) primary key,
MaNhaCC char(6) foreign key references NHACUNGCAP(MaNhaCC),
MaLoaiDV nchar(4) foreign key references LOAIDICHVU(MaLoaiDV),
DongXe nvarchar(255) foreign key references DONGXE(DongXe),
MaMP char(4)foreign key references MUCPHI(MaMP),
NgayBatDauCungCap date,
NgayKetThucCungCap date,
SoLuongXeDangKy int,);
drop table DANGKYCUNGCAP;
drop table NHACUNGCAP;
drop table LOAIDICHVU;
drop table DONGXE;
drop table MUCPHI;

select * from NHACUNGCAP ;
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC001',N'Cty TNHH Toàn Pháp',N'Hai Chau','05113992888','5688941');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC002',N'Cty Cổ phần Đông Du',N'Lien Chieu','05119999999','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC003',N' Ong Nguyen Van A',N' Hoa Thua','0511390000','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC004',N' Cty Cổ phần Toàn Cầu Xanh',N'Hai Chau ','051190458345','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC005',N' Cty TNHH MÀ ',N'Thanh Khê','0511397566','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC006',N'Bà Trần Thị Bích Vân ',N'Lien Chieu','05113587469 ','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC007',N'Cty TNHH Phan Thành ',N'Thanh Khê',' 05113987456','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC008',N'Ông Phan Đình Nam',N'Lien Chieu','05113992889','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC009',N' Tập đoàn Đông Nam Á Cty ',N'Lien Chieu','05113992889','456789');
insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) values('NCC010',N'Cổ phần Rạng đông',N'Lien Chieu','05113992889','456789');
select * from LOAIDICHVU;
insert into LOAIDICHVU(MaLoaiDV,TenLoaiDV) values ('DV01',N' Dịch vụ xe taxi');
insert into LOAIDICHVU(MaLoaiDV,TenLoaiDV) values ('DV02',N' Dịch vụ xe buýt công cộng theo tuyến cố định');
insert into LOAIDICHVU(MaLoaiDV,TenLoaiDV) values ('DV03',N' Dịch vụ xe cho thuê theo hợp đồng');
select *from MUCPHI;
insert into MUCPHI(MaMP,DonGia,MoTa) values ('MP01','10 000',N' Áp dụng từ 1/2015');
insert into MUCPHI(MaMP,DonGia,MoTa) values ('MP02','15 000',N' Áp dụng từ 2/2015');
insert into MUCPHI(MaMP,DonGia,MoTa) values ('MP03','20 000',N' Áp dụng từ 1/2010');
insert into MUCPHI(MaMP,DonGia,MoTa) values ('MP04','15 000',N' Áp dụng từ 2/2011');
select * from DONGXE;
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Hiace','Toyota',16);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Vios','Toyota',5);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Escape','Ford',5);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Cerato','KIA',7);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Forte','KIA',5);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Starex','Huyndai',7);
insert into DONGXE(Dongxe,HangXe,SoChoNgoi) values ('Grand-i10','Huyndai',7);
select *from DANGKYCUNGCAP;
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20',3);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK004','NCC004','DV03','Cerato','MP04','2015-11-20','2019-11-20',7);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1);
---
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK006','NCC004','DV03','Starex','MP04','2015-11-30','2016-01-25',8);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK007','NCC005','DV01','Cerato','MP03','2015-11-30','2016-01-25',2);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK008','NCC006','DV01','Vios','MP02','2016-02-28','2016-08-15',9);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK009','NCC005','DV03','Grand-i10','MP02','2016-04-27','2017-04-30',10);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK010','NCC006','DV01','Forte','MP02','2015-11-21','2016-02-22',4);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK011','NCC007','DV01','Forte','MP01','2016-12-25','2017-02-20',5);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK012','NCC007','DV03','Cerato','MP01','2016-04-14','2017-12-20',6);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK013','NCC003','DV02','Cerato','MP01','2015-12-21','2016-12-21',8);
----
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK014','NCC008','DV02','Cerato','MP01','2016-05-20','2016-12-30',1);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK015','NCC003','DV01','Hiace','MP02','2018-04-24','2019-11-20',6);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK016','NCC001','DV03','Grand-i10','MP02','2016-06-22','2016-12-21',8);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK017','NCC002','DV03','Cerato','MP03','2016-09-30','2019-09-30',4);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK018','NCC008','DV03','Escape','MP04','2017-12-13','2018-09-30',2);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK019','NCC003','DV03','Escape','MP03','2016-01-24','2016-12-30',8);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK020','NCC002','DV03','Cerato','MP04','2016-01-24','2016-12-30',7);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK021','NCC006','DV01','Forte','MP02','2015-01-30','2016-12-30',9);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK022','NCC002','DV02','Cerato','MP04','2016-07-25','2017-12-30',6);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20',5);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK024','NCC003','DV03','Forte','MP04','2017-12-23','2019-11-30',8);
insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values ('DK025','NCC003','DV03','Hiace','MP02','2016-08-24','2017-10-25',1);

--- bài 3
select * from DONGXE where SoChoNgoi>5
--- bài 4
select * from DANGKYCUNGCAP
 where ( DongXe in (select DongXe from DONGXE where HangXe= 'Toyota') 
        and MaMP in (select MaMP from MUCPHI where DonGia like '15 000' ) ) or
		(DongXe in (select DongXe from DONGXE where HangXe='KIA')
		and MaMP in (select DongXe from MUCPHI where DonGia like '20 000'))
--- bài 5
select DANGKYCUNGCAP.*,NHACUNGCAP.TenNhaCC from DANGKYCUNGCAP
inner join NHACUNGCAP on DANGKYCUNGCAP.MaNhaCC=NHACUNGCAP.MaNhaCC order by TenNhaCC asc ;
select DANGKYCUNGCAP.*,NHACUNGCAP.TenNhaCC,NHACUNGCAP.MaSoThue from DANGKYCUNGCAP
inner join NHACUNGCAP on DANGKYCUNGCAP.MaNhaCC=NHACUNGCAP.MaNhaCC order by MaSoThue desc ;
-- bài 6
select count(MaDKCC) as SoLanDKCC,NHACUNGCAP.TenNhaCC from DANGKYCUNGCAP
inner join NHACUNGCAP on DANGKYCUNGCAP.MaNhaCC=NHACUNGCAP.MaNhaCC 
where NgayBatDauCungCap>='2015-11-20'
group by NHACUNGCAP.TenNhaCC 
--bài 7
select distinct HangXe from DONGXE
-- bài 8
select MaDKCC ,DANGKYCUNGCAP.MaNhaCC ,TenNhaCC,DiaChi,MaSoThue,TenLoaiDV,DonGia,HangXe,NgayBatDauCungCap,NgayKetThucCungCap from DANGKYCUNGCAP
full join LOAIDICHVU on DANGKYCUNGCAP.MaLoaiDV=LOAIDICHVU.MaLoaiDV
full join MUCPHI on MUCPHI.MaMP=DANGKYCUNGCAP.MaMP
full join DONGXE on DONGXE.DongXe=DANGKYCUNGCAP.DongXe
full join NHACUNGCAP on NHACUNGCAP.MaNhaCC=DANGKYCUNGCAP.MaNhaCC
---bài 9
select  distinct NHACUNGCAP.*,DANGKYCUNGCAP.DongXe from NHACUNGCAP
inner join DANGKYCUNGCAP on NHACUNGCAP.MaNhaCC=DANGKYCUNGCAP.MaNhaCC
where DongXe in('Hiace','Cerato')