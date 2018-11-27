	DROP DATABASE IF EXISTS sms;
	CREATE DATABASE IF NOT EXISTS sms;
	USE sms;


	CREATE TABLE IF NOT EXISTS users(
		user_id INT(10) AUTO_INCREMENT PRIMARY KEY,
		_type ENUM("admin","customer","employee") NOT NULL,
		first_name VARCHAR(20) NOT NULL,
		last_name VARCHAR(20) NOT NULL,
		email VARCHAR(50) NOT NULL UNIQUE,
		nic VARCHAR(10) NOT NULL UNIQUE,
		add_no VARCHAR(15) NOT NULL,
		street VARCHAR(20),
		city1 VARCHAR(20) NOT NULL,
		city2 VARCHAR(20),
		zip INT(5) NOT NULL,
		password_hash VARCHAR(50) NOT NULL
	);


	CREATE TABLE IF NOT EXISTS phone(
		user_id INT(10),
		phone VARCHAR(10) NOT NULL CHECK(phone LIKE '0_________'),
		FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY (user_id,phone)
	);

	CREATE TABLE IF NOT EXISTS employees(
		employee_id INT(10) AUTO_INCREMENT,
		_type ENUM('driver','assistant') NOT NULL,
		salary INT(10) CHECK (salary>0),
		FOREIGN KEY (employee_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY (employee_id)
	);

	CREATE TABLE IF NOT EXISTS employee_work_data(
		employee_id INT(10),
		week_no INT(2),
		workhours TIME NOT NULL,
		FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY (employee_id, week_no)
	);

	CREATE TABLE IF NOT EXISTS stores(
		store_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		city VARCHAR(20) NOT NULL,
		street VARCHAR(20) NOT NULL,
		contact_no VARCHAR(10) CHECK(contact_no LIKE '0_________')
	);

	CREATE TABLE IF NOT EXISTS routes(
		route_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		store_id INT(10) NOT NULL,
		max_time TIME NOT NULL,
		route_path VARCHAR(255) NOT NULL,
		FOREIGN KEY (store_id) REFERENCES stores(store_id) ON DELETE CASCADE ON UPDATE CASCADE
	);

	CREATE TABLE IF NOT EXISTS customers(
		customer_id INT(10) AUTO_INCREMENT,
		_type ENUM("retail","wholesale","customer") NOT NULL,
		PRIMARY KEY (customer_id),
		FOREIGN KEY (customer_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
	);

	CREATE TABLE IF NOT EXISTS products(
		product_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(20) NOT NULL,
		_type VARCHAR(20) NOT NULL,
		capacity INT(10) NOT NULL,
		wholesale_price FLOAT(12,2) NOT NULL,
		retail_price FLOAT(12,2) NOT NULL,
		end_price FLOAT(12,2) NOT NULL,
		available_qty INT(10) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS sales_data(
		product_id INT(10) NOT NULL,
		_date DATE  NOT NULL,
		city VARCHAR(20) NOT NULL,
		route_id INT(10) NOT NULL,
		item_sold INT(5) NOT NULL,
		FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (route_id) REFERENCES routes(route_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY (product_id,_date,route_id)
	);

	CREATE TABLE IF NOT EXISTS orders(
		order_id INT(10) PRIMARY KEY ,
		customer INT(10) NOT NULL,
		add_no VARCHAR(15) NOT NULL,
		street VARCHAR(20),
		city1 VARCHAR(20) NOT NULL,
		city2 VARCHAR(20),
		zip INT(5) NOT NULL,
		route_id INT(10) NOT NULL,
		delivery_date DATE NOT NULL,
		_value FLOAT(12,2) NOT NULL,
		status ENUM("processing","shipped","delivered") NOT NULL,
		FOREIGN KEY (customer) REFERENCES customers(customer_id),
		FOREIGN KEY (route_id) REFERENCES routes(route_id)
	);

	CREATE TABLE IF NOT EXISTS products_ordered(
		order_id INT(10) NOT NULL,
		product_id INT(10) NOT NULL,
		qty INT(10) NOT NULL,
		FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY (order_id,product_id)
	);

	CREATE TABLE IF NOT EXISTS train_schedule(
		train_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		_day INT(1) NOT NULL,
		_time TIME NOT NULL,
		capacity FLOAT(12,2) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS train_cities(
	  train_id INT(10),
	  city VARCHAR(20),
	  PRIMARY KEY (train_id,city),
	  FOREIGN KEY (train_id) REFERENCES train_schedule(train_id)
	);

	CREATE TABLE IF NOT EXISTS shipments(
		shipment_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		train_id INT(10) NOT NULL,
		_date DATE NOT NULL,
		status ENUM("processing","delivered") NOT NULL,
		capacity_left FLOAT(12,2) NOT NULL,
		FOREIGN KEY (train_id) REFERENCES train_schedule(train_id)
	);

	CREATE TABLE IF NOT EXISTS shipment_orders(
		shipment_id INT(10),
		order_id INT(10),
			store_id INT(10) NOT NULL,
		FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
		FOREIGN KEY (order_id) REFERENCES orders(order_id),
		PRIMARY KEY (shipment_id,order_id),
		FOREIGN KEY (store_id) REFERENCES stores(store_id)
	);

	CREATE TABLE IF NOT EXISTS trucks(
		truck_id INT(10) AUTO_INCREMENT,
		store_id INT(10) NOT NULL,
		status VARCHAR(20) NOT NULL,
		PRIMARY KEY (truck_id),
		FOREIGN KEY (store_id) REFERENCES stores(store_id)
	);

	CREATE TABLE IF NOT EXISTS truck_work_data(
		truck_id INT(10) NOT NULL,
		_date DATE NOT NULL,
		work_hours TIME NOT NULL,
		FOREIGN KEY (truck_id) REFERENCES trucks(truck_id),
		PRIMARY KEY (truck_id,_date)
	);

	CREATE TABLE IF NOT EXISTS truck_trip(
		truck_trip_id INT(10) PRIMARY KEY AUTO_INCREMENT,
		truck_id INT(10) NOT NULL,
		_date DATE NOT NULL,
		status VARCHAR(10) NOT NULL,
		driver_id INT(10) NOT NULL,
		assistant_id INT(10) NOT NULL,
		route_id INT(10) NOT NULL,
		FOREIGN KEY (truck_id) REFERENCES trucks(truck_id),
		FOREIGN KEY (driver_id) REFERENCES employees(employee_id),
		FOREIGN KEY (assistant_id) REFERENCES employees(employee_id),
		FOREIGN KEY (route_id) REFERENCES routes(route_id)
	);

	CREATE TABLE IF NOT EXISTS truck_trip_orders(
		truck_schedule_id INT(10),
		order_id INT(10),
		FOREIGN KEY (truck_schedule_id) REFERENCES truck_trip(truck_trip_id),
		FOREIGN KEY (order_id) REFERENCES orders(order_id),
		PRIMARY KEY (truck_schedule_id,order_id)
	);

	-- -- TRIGGERS TO SIMULATE CHECKS -- --

	-- EMAIL VALIDATION --
	#EMAIL_BEFORE_INSERT
	delimiter //
	CREATE TRIGGER trig_u_email_check_insert BEFORE INSERT ON users
		FOR EACH ROW
			BEGIN
				IF NEW.email NOT LIKE "%@%.%" THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Email';
				END IF;
			END
	//
	delimiter ;
	#EMAIL_BEFORE_UPDATE
	delimiter //
	CREATE TRIGGER trig_u_email_check_update BEFORE UPDATE ON users
		FOR EACH ROW
			BEGIN
				IF NEW.email NOT LIKE "%@%.%" THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Email';
				END IF;
			END
	//
	delimiter ;

	-- SALARY VALIDATION --
	#SALARY_BEFORE_INSERT
	delimiter //
	CREATE TRIGGER trig_salary_check_insert BEFORE INSERT ON employees
		FOR EACH ROW
			BEGIN
				IF NEW.salary <0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Salary Amount';
				END IF;
			END
	//
	delimiter ;
	#SALARY_BEFORE_UPDATE
	delimiter //
	CREATE TRIGGER trig_salary_check_update BEFORE UPDATE ON employees
		FOR EACH ROW
			BEGIN
				IF NEW.salary <0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Salary Amount';
				END IF;
			END
	//
	delimiter ;

	-- EMPLOYEE WORK DATA VALIDATION --
	#WORK_DATA_BEFORE_INSERT
	delimiter //
	CREATE TRIGGER trig_wk_data_check_insert BEFORE INSERT ON employee_work_data
		FOR EACH ROW
			BEGIN
				IF (TIME_TO_SEC(NEW.workhours)<0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Workhours';
				ELSEIF NEW.employee_id IN (SELECT employee_id FROM employees WHERE _type = "driver") AND ((TIME_TO_SEC(NEW.workhours) / 60)>2400)
					THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver Maximum Workhours Exceeded';
				ELSEIF NEW.employee_id IN (SELECT employee_id FROM employees WHERE _type = "assistant") AND ((TIME_TO_SEC(NEW.workhours) / 60)>3600)
					THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Assistant Maximum Workhours Exceeded';
				ELSEIF NEW.week_no <0 OR NEW.week_no>52 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Week Number';
				END IF;
			END
	//
	delimiter ;
	#WORK_DATA_BEFORE_UPDATE
	delimiter //
	CREATE TRIGGER trig_wk_data_check_update BEFORE UPDATE ON employee_work_data
		FOR EACH ROW
			BEGIN
				IF (TIME_TO_SEC(NEW.workhours)<0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Workhours';
				ELSEIF NEW.employee_id IN (SELECT employee_id FROM employees WHERE _type = "driver") AND ((TIME_TO_SEC(NEW.workhours) / 60)>2400)
					THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver Maximum Workhours Exceeded';
				ELSEIF NEW.employee_id IN (SELECT employee_id FROM employees WHERE _type = "assistant") AND ((TIME_TO_SEC(NEW.workhours) / 60)>3600)
					THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Assistant Maximum Workhours Exceeded';
				ELSEIF NEW.week_no <0 OR NEW.week_no>52 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Week Number';
				END IF;
			END
	//
	delimiter ;
	
	-- FUNCTIONS --
	DELIMITER //
	CREATE FUNCTION IF NOT EXISTS tot_capacity (qty INT, capacity INT) RETURNS INT
	  BEGIN
	    RETURN qty*capacity;
	  END//
	DELIMITER ;

	DELIMITER //
	CREATE FUNCTION IF NOT EXISTS getStoreId(o_id INT) RETURNS INT
	  BEGIN
	    DECLARE s_id INT;
	    SELECT stores.store_id INTO s_id FROM stores INNER JOIN orders ON orders.city2 = stores.city WHERE orders.order_id = o_id;
	    RETURN s_id;
	  END//
	DELIMITER ;

	-- PROCEDURES --
	DELIMITER //
	CREATE PROCEDURE getShipmentInfo(t_id INT, _date DATE)
    BEGIN
      SELECT * FROM shipments WHERE train_id = t_id and _date = _date;
    END//
  DELIMITER ;

  DELIMITER //
  CREATE PROCEDURE updateShipCapacity(ship_id INT,capacity INT)
    BEGIN
      DECLARE in_cap INT;
      SELECT capacity_left INTO in_cap FROM shipments WHERE shipment_id = ship_id;
      UPDATE shipments SET capacity_left = in_cap-capacity WHERE shipment_id = ship_id;
    END//
  DELIMITER ;
	-- VIEWS --
	CREATE VIEW orders_details AS SELECT o.order_id, o.route_id, o.city2, SUM(tot_capacity(qty,capacity)) AS total_capacity,o.status  FROM orders o LEFT JOIN products_ordered po on o.order_id = po.order_id LEFT JOIN products p on po.product_id = p.product_id GROUP BY o.order_id;
	CREATE VIEW trains_details AS SELECT ts.train_id,ts._day,ts._time,ts.capacity,tc.city FROM train_schedule ts LEFT JOIN train_cities tc ON ts.train_id = tc.train_id;



