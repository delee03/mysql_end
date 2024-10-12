CREATE DATABASE if not EXISTS demo_db

--không phân biệt chữ hoa và thường như các nn lập trình
--cẩn thận khi tạo các cái biến trùng tên với phương thức của mysql

drop DATABASE demo_db

--table --add, update name, xóa (done)
--column -- add, sửa tên, xóa , thay đổi kiểu dữ liệu (done)
--ràng buộc kiểu dữ liệu
--not null, unique, primary key, foreign key 

create table users
(
	user_id int, 
	full_name VARCHAR(255),
	email VARCHAR(100)
)


drop table user 

rename table users to Users

--alter 
ALTER TABLE Users 
add column password VARCHAR(255)

--alter kết hợp với modify
alter table Users  
modify email VARCHAR(200)

--alter 
alter table Users 
rename column full_name  to hoTen 

SELECT version();
--
insert into
INSERT INTO
    Users(user_id, hoTen, email, password)
values
    (1, "Nguyễn Văn B", "test@gmail.com", "123"),
    (1, "Nguyen Van C", "test@gmail.com", "123"),
    (1, "Nguyen Van D", "test@gmail.com", "123") TRUNCATE TABLE Users -- t ạ o cho m ì nh 1 table products (id, tenSanPham, NgaySX, HBH, TrangThai) -- th ê m cho m ì nh 5 record Products 2p 
    create table Products (
        id int NOT NULL UNIQUE,
        tenSP VARCHAR(255),
        ngaySX VARCHAR(255),
        ngayBH VARCHAR(255),
        States boolean 
    )
    
insert into
    Products
values
    (1, "iphone 16", "10/10/2024", "10/10/2026", true),
    (2, "iphone 17", "10/10/2025", "10/10/2026", true),
    (3, "iphone 18", "10/10/2026", "10/10/2026", FALSE),
    (4, "iphone 19", "10/10/2027", "10/10/2026", FALSE) 
    -- constraint - r à ng bu ộ c alter Products
    
 TRUNCATE table Products
 
 alter table Products
modify
    State boolean NOT NULL
    
alter table Products 
add UNIQUE(id)

drop table Products

alter table Products 
add CONSTRAINT UNIQUE(tenSP)
--create index -> nói được 

create table `unique` (id int, facebook_id int, google_id int, aws_id int, microsoft_id int)

alter table `unique`
add CONSTRAINT key_value  UNIQUE(id, facebook_id)

--primary key

ALTER table `unique`
add PRIMARY KEY (aws_id)

--xóa primary key 

ALTER table `unique`
drop index key_value

--gom nhóm group tạo 2 primary key
alter table `unique`
add CONSTRAINT group_pk PRIMARY KEY(google_id, microsoft_id)

--thêm 5 record cho bảng unique kiểu int
--1p 

insert into `unique`(id, facebook_id, google_id, aws_id, microsoft_id)  VALUES
(1, 1, 1, 1, 1),
(1,2,3,4,5)
