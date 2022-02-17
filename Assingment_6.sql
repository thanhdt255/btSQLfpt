
create table TacGia(
ID int primary key identity(1,1),
TenTG nvarchar(100)
);
create table NhaXB(
ID int primary key identity(1,1),
TenXB nvarchar(100),
DiaChi nvarchar(255)
);
create table LoaiSach(
ID int primary key identity(1,1),
TenLoaiSach nvarchar(100)
);
create table Sach(
Ma char(4) primary key not null,
TenSach nvarchar(255),
NoiDungTT ntext,
NamXB datetime,
LanXB int,
Gia int,
SoLuong int,
ID_TGia int foreign key references TacGia(ID),
ID_LoaiSach int foreign key references LoaiSach(ID),
ID_NhaXB int foreign key references NhaXB(ID) 
);
drop table Sach,LoaiSach,NhaXB,TacGia;
truncate table Sach;
truncate table LoaiSach;
truncate table NhaXB;
truncate table TacGia;
--Bài 2 chèn dữ liêu vào CSDL mẫu
insert into TacGia(TenTG) values(N'Eran Katz');
insert into NhaXB(TenXB,DiaChi) values (N'Tri thức',N'53 Nguyễn Du,Hai Bà Trưng,Hà Nội');
insert into LoaiSach(TenLoaiSach) values(N'Khoa Học Xã Hội');
insert into Sach(Ma,TenSach,NoiDungTT,NamXB,LanXB,Gia,SoLuong,ID_TGia,ID_LoaiSach,ID_NhaXB)
values ('B001',N'Trí tuệ Do Thái',N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì
 và nguồn gốc trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ những bí
  ẩn về sự thông thái của người Do Thái, của một dân tộc thông tuệ với những phương pháp
   và kỹ thuật phát triển tầng lớp trí thức đã được giữ kín hàng nghìn năm như một bí ẩn
    mật mang tính văn hóa.','2010',1,10000,1001,1,1,1);
	insert into TacGia(TenTG) values(N'Mai Huy Hoat');
insert into NhaXB(TenXB,DiaChi) values (N'Nói phét',N'53 Nguyễn Du,Hai Bà Trưng,Hà Nội');
insert into LoaiSach(TenLoaiSach) values(N'Nói phét có nghề');
insert into Sach(Ma,TenSach,NoiDungTT,NamXB,LanXB,Gia,SoLuong,ID_TGia,ID_LoaiSach,ID_NhaXB)
values ('A001',N'Trí tuệ Nói phét',N'Bạn có muốn biết Cách nói phet','2010',1,10000,100,2,2,2);
	select * from Sach
--Bài 3 liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
select TenSach from Sach where NamXB>2008 ;
--Bài 4 Liệt kê 10 cuón sách có giá bán cao nhất
select top 10 TenSach,Gia from Sach order by Gia desc;
-- Bài 5 tìm những cuốn sách có tiêu dề chứa từ " tin học"
Select TenSach from Sach where TenSach like '%tin học%';
-- bài 6 liệ kê các cuốn sách có tên bắt đầu bằng với chữ 'T' theo thứ tự giảm dần
select TenSach,Gia from Sach where TenSach like 'T%' order by Gia desc;
--Bài 7 liệt kê các cuốn sách của nhà xuất bản Tri thức
select Tensach,TenXB from Sach inner join NhaXB on Sach.ID_NhaXB=NhaXB.ID where TenXB=N'Tri thức';
--Bài 8 Lấy thông tin chi tiết về nhà xuất bản cuốn sách "Trí Tuệ Do Thái"
select NhaXB.*,Sach.TenSach from NhaXB inner join Sach on Sach.ID_NhaXB=NhaXB.ID where TenSach like N'Trí tuệ Do Thái';
--Bài 9 hiển thị các thông tin về các cuốn sách
Select Sach.Ma,Sach.TenSach,Sach.NamXB,NhaXB.TenXB,LoaiSach.TenLoaiSach from Sach 
inner join NhaXB on NhaXB.ID=Sach.ID_NhaXB
inner join LoaiSach on LoaiSach.ID=Sach.ID_LoaiSach
--Bài 10 Tìm cuốn sách có giá bán đắt nhất
Select top 1 * from Sach order by Gia;
--Bài 11 Tìm cuốn sách có số lượng lớn nhất trong kho
select top 1 * from Sach order by SoLuong;
--Bài 12 tìm các cuốn sách của tác giả "Eran Katz"
select TenSach from Sach where ID_TGia =(select ID from TacGia where TenTG like 'Eran Katz') ;
--Bài 13 giảm giá bán 10% các cuốn sách xuất bản từ 2008 trở về trước
update Sach set Gia=Gia-0.1*Gia
where NamXB<'2015';
--Bài 14 thống kê đầu sách của mõi nhà xuất bản
select NhaXB.TenXB,count(Sach.Ma) as So_Sach from Sach
inner join NhaXB on NhaXB.ID=Sach.ID_NhaXB
group by NhaXB.TenXB
--Bài 15 thông kê số đầu sách của mỗi loại sách
select count(Ma) as So_Dau_Sach,LoaiSach.TenLoaiSach from Sach
inner join LoaiSach on Sach.ID_LoaiSach=LoaiSach.ID
group by LoaiSach.TenLoaiSach
--Bài 16 đặt chỉ mục index cho trường tên sách
create index TenSach_Index on Sach(TenSach);
--Bài 17 viết view lấy thông tin gồm : Mã Sách , tên sach tác giả , nhà xb bà giá bán
create view Sach_view as
select Sach.Ma,Sach.TenSach,TacGia.ID,NhaXB.TenXB,Sach.Gia from Sach
inner join TacGia on TacGia.ID=Sach.ID_TGia
inner join NhaXB on NhaXB.ID=Sach.ID_NhaXB;
select * from Sach_view
--Baì 18 Viết Store Procedure: 
◦ --SP_Them_Sach: thêm mới một cuốn sách 
create procedure SP_Them_Sach
@Ma char(4), 
@TenSach nvarchar(255),
@NoiDungTT ntext,
@NamXB datetime,
@LanXB int,
@Gia int,
@SoLuong int,
@TenTG nvarchar(100),
@TenXB nvarchar(100),
@DiaChi nvarchar(255),
@TenLoaiSach nvarchar(100)
as
begin
insert into TacGia(TenTG) values(@TenTG);
insert into NhaXB(TenXB,DiaChi) values (@TenXB,@DiaChi);
insert into LoaiSach(TenLoaiSach) values(@TenLoaiSach);
insert into Sach(Ma,TenSach,NoiDungTT,NamXB,LanXB,Gia,SoLuong)
values (@Ma,@TenSach,@NoiDungTT,@NamXB,@LanXB,@Gia,@SoLuong);
declare @ID_TGia int=(select ID from TacGia where TenTG like @TenTG);
 declare @ID_LoaiSach int=(select ID from LoaiSach where TenLoaiSach like @TenLoaiSach);
 declare @ID_NhaXB int=(select ID from NhaXB where TenXB like @TenXB) ;
update Sach set ID_LoaiSach=@ID_LoaiSach,
ID_NhaXB=@ID_NhaXB,
ID_TGia=@ID_TGia
where Ma=@Ma;
end;
drop procedure SP_Them_Sach
exec SP_Them_Sach 
@Ma='C220', 
@TenSach=N'Dạy con làm giàu',
@NoiDungTT=N'Tóm tắt cách làm giàu cùa các con tỉ phú',
@NamXB='2021',
@LanXB=2,
@Gia=2000000,
@SoLuong=3,
@TenTG =N'Mai Huy Hoạt nhé',
@TenXB =N'FPT-APTECH',
@DiaChi=N'Nam định-Việt Nam',
@TenLoaiSach =N'Sách chiến thần';
select* from Sach
 --SP_Tim_Sach: Tìm các cuốn sách theo từ khóa
 create procedure SP_Tim_Sach 
 @search_book nvarchar(255)as
 select * from Sach where TenSach like @search_book; 
-- SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục 
create procedure SP_Sach_ChuyenMuc
@Sach_ChuyenMuc nvarchar(255) as
select * from Sach inner join LoaiSach on LoaiSach.ID=Sach.ID_LoaiSach where TenLoaiSach like @Sach_ChuyenMuc;
--Bài 19 viết trigger không cho phép xoã các cuốn sách vẫn còn trong kho ( số lượng >0)
create trigger Khong_cho_delete on Sach
after delete
as if exists ( select * from deleted where SoLuong>0) begin
 print(N' Sách có số lượng lớn hơn 0, không được xoá');
 rollback transaction;
 end
 delete from Sach where Ma='C220'
 --Bài 20: Viết trigger chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này. 
 create trigger Khong_cho_xoa_Loai_sach
 on LoaiSach
 after delete
 as if exists (select * from deleted where ID =( select ID_LoaiSach from Sach where SoLuong>0)) begin
  print(N'Vẫn còn sách thuộc Loại sách này=>không được xoá đâu!!');
 rollback transaction;
 end
 select* from LoaiSach
 select * from Sach
 delete from LoaiSach where ID=3



