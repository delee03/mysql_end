create DATABASE if not EXISTS db_buoi2

use db_buoi2

CREATE TABLE users 
(
	user_id int PRIMARY KEY AUTO_INCREMENT ,
	full_name varchar(255),
	email varchar(255),
	password varchar(255),
	birthday varchar(200)
)

insert into users(full_name, email, password, birthday)
values ("Nguyễn Văn A", "a@gmail.com", "124", "10/12/2002"),
("Nguyễn Văn B", "b@gmail.com", "124", "10/12/2002"),
("Nguyễn Văn C", "c@gmail.com", "124", "10/12/2002"),
("Nguyễn Văn D", "d@gmail.com", "124", "10/12/2002")

create table foods(
food_id int PRIMARY KEY auto_increment, food_name VARCHAR(255), description VARCHAR(255), states boolean
)

drop table foods

insert into foods( food_name, description, states)
values ("món mì xào", "ngon dữ thần", true),
 ("món mì ý", "ngon dữ thần", true),
  ("món mì cay tứ xuyên", "ngon dữ thần", true),
   ("món lẩu tứ xuyên", "ngon dữ thần", false)
   
 create table orders
 (
 	order_id int PRIMARY KEY auto_increment,
 	food_id int,
 	user_id int
-- 	FOREIGN KEY (food_id) REFERENCES foods(food_id)
 )
 
 drop table orders
   
   
 alter table orders 
 add CONSTRAINT FOREIGN KEY (food_id) REFERENCES foods(food_id)
 
  alter table orders 
 add CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(user_id)
 
 --join dữ liệu viết truy vấn làm bài tập 3 app_foods
   
  --về các mối quan hệ trong sql 
  
  INSERT INTO orders(food_id, user_id)
  VALUES(1, 1),
  (1, 2),
  (2, 3),
  (2, 2),
  (3, 1)
  
  --inner join, left join, right join, cross join, 
  --group by, order by, filter => mysql
  -- buổi 3 bài tập làm bài tập app food
  
  --1 - n
  -- 1 - 1
  -- n - n
  -- đệ qui 
  
  SELECT * from users
  
  SELECT * from foods
  
   SELECT food_name, description from foods
  
  --lấy ra 2 cột fullname và email từ bảng users
  --1p 
  
  SELECT full_name, email  from users
  
  --trả về tên cột khác để mà dễ đọc france , nhật, tiếng việt
  
   SELECT full_name as "Họ tên", email as "Đây là email nè", birthday  from users
  
   WHERE email like "c@gmail.com"
   LIMIT 3
   
    --điều kiện để tìm lọc, -> WHERE 
   
   
  
  --tương tác với bảng many to many đó là bảng orders
  
  --inner join
  
  select * 
  from orders
  join users on users.user_id = orders.user_id
  
  --luôn luôn lấy bảng có số hàng nhỏ hơn đi so sánh với bảng có số hàng lớn hơn
  
  --nếu 2 bảng có số hàng bằng nhau thì bảng nào cũng được 
  
  
-- inner join foods on orders.food_id = foods.food_id
  
  
--for lồng đi từ mảng có số lượng ít hơn -> mảng có số lượng nhiều hơn
  
  --left join 
  select * 
  from users
  left join orders on users.user_id = orders.user_id
  
    select * 
  from orders
  right join foods on orders.food_id = foods.food_id
  
  --lấy tất cả những record bên trái của bảng users cho dù ko khớp với bảng bên phải luôn
  
  
  
  --right join
  --lấy tất cả những record bên phải của bảng orders cho dù không khớp với bảng bên trái
    select * 
  from orders
  right join users on users.user_id = orders.user_id
  
  --yêu cầu lấy ra tất cả user có trong hệ thống nhưng mà nó không mua hàng, không tương tác.....
  
  --cross join 
  
   select * 
	from users
  cross join orders 
  
  --4*5 = 20 => 4 users 1 ông thì có 5 orders
  
  --khách hàng or chủ yêu cầu mình thống kê coi ông nào mua hàng nhiều nhất trong cửa hàng
  --group by
  --order by
  --Query 1: Column 'user_id' in group statement is ambiguous -> debug
   select * 
  from orders
  join users on users.user_id = orders.user_id
  group by user_id
  --không biết user_id của bảng nào
  
  
  
  
    select * 
  from orders
  join users on users.user_id = orders.user_id
  group by orders.user_id
  --Query 1: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'db_buoi2.orders.order_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
  
  --do trùng lắp các cột -> không thể gom nhóm -> group

  select orders.user_id, users.user_id, users.full_name, users.`email`, users.`password`, COUNT(orders.user_id) as "Số lần mua"
  from orders
  join users on users.user_id = orders.user_id
  group by orders.user_id
  order by `Số lần mua` desc
  limit 1
  
 
 ---tìm 2 người đặt hàng nhiều nhất
  
  
  
 --Tìm 2 món ăn được mua nhiều nhất dựa trên bài trên .3p 
 select COUNT(orders.food_id) as "Số lần món được đặt", foods.food_id, foods.food_name, foods.description, foods.states
 from orders 
 join foods on orders.food_id = foods.food_id
 group by orders.food_id
 order by `Số lần món được đặt` desc
 LIMIT 2
 
  --Tìm người dùng không hoạt động trong hệ thống
--(không đặt hàng, không like, không đánh giá nhà
--hàng).

select users.user_id, users.full_name, users.email, users.`password`, users.birthday
from orders
right join users on orders.user_id = users.user_id
where orders.user_id is NULL 






