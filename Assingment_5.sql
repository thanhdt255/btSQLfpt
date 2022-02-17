create table hang(
MS int primary key not null ,
tenHang varchar(255) not null,
diaChi varchar(255),
dienThoai varchar(255));
create table sanPham(
ID int primary key identity(1,1),
tenHang nvarchar(1000) not null,
moTaHang ntext,
donVi nvarchar(20),
gia int ,
soLuongHienCo int,
MSHang int foreign key references hang(MS)
 );
 alter table hang alter column diachi nvarchar(255);
 insert into hang(MS,tenHang,diaChi,dienThoai) values (122,'Asus','USA','9832388');
 insert into sanPham (tenHang,moTaHang,donVi,gia,soLuongHienCo,MSHang) 
 values (N'Máy Tính T450',N'Máy nhập cũ',N'Chiếc',1000,10,123),
 (N'Điện Thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,200,123),
 (N'Máy In Sámung 450',N'Máy in đang loại bình',N'Chiếc',100,10,123);
 delete from sanPham;
 select * from hang inner join sanPham on sanPham.MSHang=hang.MS;
 alter table sanPham alter column moTaHang nvarchar(4000);
 update hang set dienthoai='0'+dienthoai;
 select * from hang
 --Bài 3
  insert into hang(MS,tenHang,diaChi,dienThoai) values (223,'Acer','Taiwan','225563');
 insert into sanPham (tenHang,moTaHang,donVi,gia,soLuongHienCo,MSHang) 
 values (N'Máy Tính Thiên Địa',N'Máy nhập cũ hàng Second hand',N'Chiếc',1000,10,223),
 (N'Điện Thoại Nhái loại 1 APPLE',N'Điện thoại Đểu siêu cấp',N'Chiếc',233,556,223),
 (N'Máy In phát tán Covid 19',N'Máy phát tán, phát đảm bảo chết luôn',N'Chiếc',166,19,223);
   insert into hang(MS,tenHang,diaChi,dienThoai) values (421,'ThinkPad','China','666454');
 insert into sanPham (tenHang,moTaHang,donVi,gia,soLuongHienCo,MSHang) 
 values (N'Máy xem phim Thiên Địa',N'Chất lượng siêu tốt rõ từng chi tiết',N'Chiếc',6600,999,421),
 (N'Điện Thoại Vũ Trụ ',N'Điện thoại liên lạc giữa các vì sao',N'Chiếc',421,888,421),
 (N'Máy diệt khuẩn của China',N'Sau khi sử dụng bạn sẽ thấy vi khuẩn tăng gấp đôi',N'Đồ Vật',2,199999,421);
 --Bài 4
 -- Hiển thị các hãng sản xuất
 select tenHang as hangSX from hang;
 --Hiển thị các sản phẩm
 select tenHang as San_Pham from sanPham;
 -- Bài 5
 select tenHang from hang order by tenHang desc;--a
 select tenHang,gia from sanPham order by gia desc;--b
 select * from hang where tenHang='Asus';--c
 select tenHang,soLuongHienCo from sanPham where soLuongHienCo<11;--d
 select sanPham.*,hang.tenHang from sanPham inner join hang on hang.MS=sanPham.MSHang where hang.tenHang='Asus';--e
 -- Bài 6
 select count(tenHang) as so_Hang from hang;--a
 select count(tenHang) as so_Hang_cua_hang_ban from sanPham;--b
 select hang.tenHang,count(sanPham.tenHang)as Tong_so_SP_cua_hang from sanPham
 inner join hang on hang.MS=sanPham.MSHang
 group by hang.tenHang;--c
 select sum(soLuongHienCo) as Tong_so_SP_cua_Cua_Hang from sanPham;--d
 --Bài7
 alter table sanPham add constraint change_enviroment_of_money check(gia>'0');--a
 alter table hang  add constraint change_telephone check(dienThoai like'0%');--b
--Bài 8
--a
 create index New_tenhang on sanPham(tenHang);
 create index New_moTaHang on sanPham(moTaHang);
 --b
 create view View_SanPham as
 select ID,tenHang,gia from sanPham;
 select * from View_SanPham;
 drop view View_SanPham;
 create view View_SanPham_Hang as(
 select sanPham.ID,sanPham.tenHang as Ten_SP,hang.tenHang  from sanPham
 inner join hang on hang.MS=sanPham.MSHang);
 select * from View_SanPham_Hang;
 drop view View_SanPham_Hang;

