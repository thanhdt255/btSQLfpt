create table customer(
ID int primary key,
name varchar(50) ,
address varchar(255),
telephone int
);
create table products(
ID int primary key,
name varchar(255),
discription text,
donVi int,
price int
);
create table donHang(
ma int primary key,
ngayDH date,
ID_KH int foreign key references customer(ID)
);
create  table DHSP(
 ID_SP int foreign key references products(ID),
 ma_DH int foreign key references donHang(ma),
 soLuong int,
 monney int
)
;