INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ("customer","Maduranga","Wijesiri","maduranga.official@gmail.com","957463556V","1/152","minuwangoda road","Bolawalana","Maradagahamula",26354,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ("customer","Sankalpa","Sankalpa","sankalpa.official@gmail.com","966376859V","1/252","angoda road","Bolawalana","Gampaha",46374,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ("customer","Buddhi","Buddhi","buddmhi.official@gmail.com","964635278V","1/262","koswaththa road","Bolawalana","kandy",16253,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ("customer","kaumini","kavishka","kahumini.official@gmail.com","966493728V","1/362","diulapitiya road","Bolawalana","Negombo",16253,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ("customer","kashuni","kashew","kashuni.official2@gmail.com","966453027V","1/343","kuliyapitiya road","kollupitiya","colambo",16253,MD5(10));

INSERT INTO `users` (`user_id`, `_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES (NULL, 'employee', 'abc', 'cde', 'abc11@gmail.com', '123456780V', '92/D', 'Ovitigama', 'Pugoda', NULL, '10660', MD5('123'));
INSERT INTO `users` (`user_id`, `_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES (NULL, 'employee', 'abc1', 'cde1', 'abc12@gmail.com', '223456789V', '92/D', 'Ovitigama', 'Pugoda', NULL, '10660', MD5('123'));
INSERT INTO `users` (`user_id`, `_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES (NULL, 'employee', 'abc2', 'cde2', 'abc22@gmail.com', '323456789V', '92/D', 'Ovitigama', 'Pugoda', NULL, '10660', MD5('123'));
INSERT INTO `users` (`user_id`, `_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES (NULL, 'employee', 'abc3', 'cde3', 'abc33@gmail.com', '423456789V', '92/D', 'Ovitigama', 'Pugoda', NULL, '10660', MD5('123'));
INSERT INTO `users` (`user_id`, `_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES (NULL, 'employee', 'abc4', 'cde4', 'abc44@gmail.com', '523456789V', '92/D', 'Ovitigama', 'Pugoda', NULL, '10660', MD5('123'));

INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ('admin','Isuru','Wijesiri','Isuru.official@gmail.com','957463526V','1/152','kelaniya road','kelaniya','Colombo',26354,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ('admin','Harith','Sankalpa','Harith.official@gmail.com','964374859V','1/252','angoda road','asgiriya','Gampaha',46374,MD5(10));
INSERT INTO `users`(`_type`, `first_name`, `last_name`, `email`, `nic`, `add_no`, `street`, `city1`, `city2`, `zip`, `password_hash`) VALUES ('admin','Kawwa','kavi','kawwa.official@gmail.com','964635673V','1/262','koswaththa road','Bolawalana','Ampara',16253,MD5(10));

INSERT INTO `phone`(`user_id`, `phone`) VALUES (1,'0763546374');
INSERT INTO `phone`(`user_id`, `phone`) VALUES (2,'0772636374');
INSERT INTO `phone`(`user_id`, `phone`) VALUES (3,'0754469374');
INSERT INTO `phone`(`user_id`, `phone`) VALUES (4,'0712736253');

INSERT INTO `customers`(`customer_id`, `_type`) VALUES (1,"retail");
INSERT INTO `customers`(`customer_id`, `_type`) VALUES (2,"wholesale");
INSERT INTO `customers`(`customer_id`, `_type`) VALUES (3,"customer");
INSERT INTO `customers`(`customer_id`, `_type`) VALUES (4,"retail");
INSERT INTO `customers`(`customer_id`, `_type`) VALUES (5,"customer");


INSERT INTO `employees` (`employee_id`, `_type`, `salary`) VALUES ('6', 'driver', '10000');
INSERT INTO `employees` (`employee_id`, `_type`, `salary`) VALUES ('7', 'driver', '10000');
INSERT INTO `employees` (`employee_id`, `_type`, `salary`) VALUES ('8', 'assistant', '10000');
INSERT INTO `employees` (`employee_id`, `_type`, `salary`) VALUES ('9', 'assistant', '10000');
INSERT INTO `employees` (`employee_id`, `_type`, `salary`) VALUES ('10', 'assistant', '10000');

INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (6,1,"40:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (7,1,"40:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (8,1,"45:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (9,1,"40:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (10,1,"40:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (6,2,"40:00:00");
INSERT INTO `employee_work_data`(`employee_id`, `week_no`, `workhours`) VALUES (7,2,"35:00:00");



INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (1,'colombo', 'almer street', 0776352836);
INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (2,'negombo','minuwangos', 0715263748);
INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (3,'galle','dsfsfsdf', 0763546241);
INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (4,'matara','dgfdggc', 0726351726);
INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (5,'jaffna','sdsffds', 0773524162);
INSERT INTO `stores` (`store_id`,`city`,`street`, `contact_no`) VALUES (6,'trinco','sdfdsf', 0716352738);


INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (1,1,'00:30:00','sdf, fdgfg, sfsfdsdf');
INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (2,2,'01:00:00','dfgfdg, dsfdsfdsf, sdfsdfsd');
INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (3,3,'02:00:00','dsfsd, awew, rter');
INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (4,4,'01:00:00','sdh, asad, xcvcxv');
INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (5,5,'01:00:00','sdsds, wefw, ghkj');
INSERT INTO `routes` (`route_id`,`store_id`, `max_time`, `route_path`) VALUES (6,6,'01:00:00','gkfok, ghjkk, gkjhk');


INSERT INTO `products`(`name`, `_type`, `capacity`, `wholesale_price`, `retail_price`, `end_price`, `available_qty`) VALUES ('product1','a','100',150,160,160,100);
INSERT INTO `products`(`name`, `_type`, `capacity`, `wholesale_price`, `retail_price`, `end_price`, `available_qty`) VALUES ('product2','b','150',250,270,270,200);
INSERT INTO `products`(`name`, `_type`, `capacity`, `wholesale_price`, `retail_price`, `end_price`, `available_qty`) VALUES ('product3','c','155',250,270,270,200);
INSERT INTO `products`(`name`, `_type`, `capacity`, `wholesale_price`, `retail_price`, `end_price`, `available_qty`) VALUES ('product4','d','170',250,270,270,200);
INSERT INTO `products`(`name`, `_type`, `capacity`, `wholesale_price`, `retail_price`, `end_price`, `available_qty`) VALUES ('product5','d','250',250,270,270,200);

INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (1,'2018-11-21','colombo',1,5);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (2,'2018-11-22','colombo',1,10);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (5,'2018-11-24','matara',4,15);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (3,'2018-11-24','galle',3,7);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (4,'2018-11-25','trinco',4,8);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (2,'2018-11-27','negombo',2,3);
INSERT INTO `sales_data`(`product_id`, `_date`, `city`, `route_id`, `item_sold`) VALUES (3,'2018-11-28','jaffna',6,10);

INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (1,1,'152/1','sdfsfsdf','dsfsfd','colombo',23,1,'2018-12-01',25,'sdfsdf');
INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (2,3,'34/2','sdfsfdsfsdf','bjds','negombo',76,2,'2018-12-03',75,'sdfhsdf');
INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (3,2,'156/2','sdfsffbsdf','dsfsdf','galle',34,1,'2018-12-04',55,'sdfsdfkj');
INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (4,4,'55/1','sdfsfsdnhf','dsfsdsdf','matara',54,4,'2018-12-02',25,'sdfsioldf');
INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (5,5,'64/2','sdfsfcsdf','mcvbmn','jaffna',34,6,'2018-12-03',34,'sdfsdfjkl');
INSERT INTO `orders`(`order_id`, `customer`, `add_no`, `street`, `city1`, `city2`, `zip`, `route_id`, `delivery_date`, `_value`, `status`) VALUES (6,2,'78/4','sdfshfsnbdf','hgjh','trinco',50,5,'2018-12-04',45,'sdfsiodf');

INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (1,2,2);
INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (2,1,5);
INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (3,2,3);
INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (4,4,10);
INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (5,3,28);
INSERT INTO `products_ordered`(`order_id`, `product_id`, `qty`) VALUES (6,5,10);

INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-21','08:00:00','colombo',50);
INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-22','09:00:00','negombo',50);
INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-23','10:00:00','galle',50);
INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-24','07:00:00','matara',50);
INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-25','08:00:00','jaffna',50);
INSERT INTO `train_schedule`(`_day`, `_time`, `city`, `capacity`) VALUES ('2018-11-26','10:00:00','trinco',50);

INSERT INTO `train_trip`(`train_schedule_id`, `_date`, `status`) VALUES (1,'2018-11-21','fdgdfg');
INSERT INTO `train_trip`(`train_schedule_id`, `_date`, `status`) VALUES (2,'2018-11-22','fdsf');
INSERT INTO `train_trip`(`train_schedule_id`, `_date`, `status`) VALUES (3,'2018-11-23','fdhjgdfg');
INSERT INTO `train_trip`(`train_schedule_id`, `_date`, `status`) VALUES (4,'2018-11-24','fdgdfddfdg');
INSERT INTO `train_trip`(`train_schedule_id`, `_date`, `status`) VALUES (5,'2018-11-25','fdgdfbg');

INSERT INTO `shipments`(`train_trip_id`, `store_id`, `delivery_date`, `status`, `capacity_left`) VALUES (1,1,'2018-11-21','fhgjtufgj',50);
INSERT INTO `shipments`(`train_trip_id`, `store_id`, `delivery_date`, `status`, `capacity_left`) VALUES (2,2,'2018-11-23','fd',65);
INSERT INTO `shipments`(`train_trip_id`, `store_id`, `delivery_date`, `status`, `capacity_left`) VALUES (3,3,'2018-11-23','ffdufgj',80);
INSERT INTO `shipments`(`train_trip_id`, `store_id`, `delivery_date`, `status`, `capacity_left`) VALUES (5,4,'2018-11-25','uiuugj',70);
INSERT INTO `shipments`(`train_trip_id`, `store_id`, `delivery_date`, `status`, `capacity_left`) VALUES (4,5,'2018-11-25','kl',50);

























