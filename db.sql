 START TRANSACTION ;;
CREATE TABLE IF NOT EXISTS 'django_migrations' (
	'id'	integer NOT NULL,
	'app'	varchar(255) NOT NULL,
	'name'	varchar(255) NOT NULL,
	'applied'	datetime NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'auth_group_permissions' (
	'id'	integer NOT NULL,
	'group_id'	integer NOT NULL,
	'permission_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('permission_id') REFERENCES 'auth_permission'('id')  ,
	FOREIGN KEY('group_id') REFERENCES 'auth_group'('id')  
);
CREATE TABLE IF NOT EXISTS 'auth_user_groups' (
	'id'	integer NOT NULL,
	'user_id'	integer NOT NULL,
	'group_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('user_id') REFERENCES 'auth_user'('id')  ,
	FOREIGN KEY('group_id') REFERENCES 'auth_group'('id')  
);
CREATE TABLE IF NOT EXISTS 'auth_user_user_permissions' (
	'id'	integer NOT NULL,
	'user_id'	integer NOT NULL,
	'permission_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('permission_id') REFERENCES 'auth_permission'('id')  ,
	FOREIGN KEY('user_id') REFERENCES 'auth_user'('id')  
);
CREATE TABLE IF NOT EXISTS 'django_admin_log' (
	'id'	integer NOT NULL,
	'action_time'	datetime NOT NULL,
	'object_id'	text,
	'object_repr'	varchar(200) NOT NULL,
	'change_message'	text NOT NULL,
	'content_type_id'	integer,
	'user_id'	integer NOT NULL,
	'action_flag'	smallint unsigned NOT NULL CHECK('action_flag' >= 0),
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('content_type_id') REFERENCES 'django_content_type'('id')  ,
	FOREIGN KEY('user_id') REFERENCES 'auth_user'('id')  
);
CREATE TABLE IF NOT EXISTS 'django_content_type' (
	'id'	integer NOT NULL,
	'app_label'	varchar(100) NOT NULL,
	'model'	varchar(100) NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'auth_permission' (
	'id'	integer NOT NULL,
	'content_type_id'	integer NOT NULL,
	'codename'	varchar(100) NOT NULL,
	'name'	varchar(255) NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('content_type_id') REFERENCES 'django_content_type'('id')  
);
CREATE TABLE IF NOT EXISTS 'auth_group' (
	'id'	integer NOT NULL,
	'name'	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'auth_user' (
	'id'	integer NOT NULL,
	'password'	varchar(128) NOT NULL,
	'last_login'	datetime,
	'is_superuser'	boolean NOT NULL,
	'username'	varchar(150) NOT NULL UNIQUE,
	'last_name'	varchar(150) NOT NULL,
	'email'	varchar(254) NOT NULL,
	'is_staff'	boolean NOT NULL,
	'is_active'	boolean NOT NULL,
	'date_joined'	datetime NOT NULL,
	'first_name'	varchar(150) NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'cars_auction' (
	'id'	integer NOT NULL,
	'capacity'	integer NOT NULL,
	'city'	varchar(30) NOT NULL,
	'state'	varchar(30) NOT NULL,
	'auc_date'	date NOT NULL,
	'start_time'	time NOT NULL,
	'end_time'	time NOT NULL,
	'no_of_cars'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'cars_manufacturers' (
	'id'	integer NOT NULL,
	'name'	varchar(40) NOT NULL,
	'country'	varchar(12) NOT NULL,
	'year_founded'	integer NOT NULL,
	'revenue'	real NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'cars_person' (
	'id'	integer NOT NULL,
	'name'	varchar(50) NOT NULL,
	'dob'	date NOT NULL,
	'vehicle_preference'	varchar(20) NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT)
);
CREATE TABLE IF NOT EXISTS 'cars_vehicle' (
	'id'	integer NOT NULL,
	'model_name'	varchar(40) NOT NULL,
	'no_of_doors'	integer NOT NULL,
	'mpg'	real NOT NULL,
	'car_availabilty'	integer NOT NULL,
	'seating_capacity'	integer NOT NULL,
	'vehicle_type'	varchar(10) NOT NULL,
	'manufacturer_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('manufacturer_id') REFERENCES 'cars_manufacturers'('id')  
);
CREATE TABLE IF NOT EXISTS 'cars_cars' (
	'id'	integer NOT NULL,
	'vin'	varchar(17) NOT NULL,
	'plate_no'	varchar(8) NOT NULL,
	'no_of_accidents'	integer NOT NULL,
	'year'	integer NOT NULL,
	'model'	varchar(10) NOT NULL,
	'color'	varchar(8) NOT NULL,
	'base_price'	real NOT NULL,
	'manufacturer_id'	integer NOT NULL,
	'owner_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('manufacturer_id') REFERENCES 'cars_manufacturers'('id')  ,
	FOREIGN KEY('owner_id') REFERENCES 'cars_person'('id')  
);
CREATE TABLE IF NOT EXISTS 'cars_auction_person' (
	'id'	integer NOT NULL,
	'auct_id'	integer NOT NULL,
	'pers_id'	integer NOT NULL,
	PRIMARY KEY('id' AUTO_INCREMENT),
	FOREIGN KEY('pers_id') REFERENCES 'cars_person'('id')  ,
	FOREIGN KEY('auct_id') REFERENCES 'cars_auction'('id')  
);
CREATE TABLE IF NOT EXISTS 'django_session' (
	'session_key'	varchar(40) NOT NULL,
	'session_data'	text NOT NULL,
	'expire_date'	datetime NOT NULL,
	PRIMARY KEY('session_key')
);
INSERT IGNORE INTO 'django_migrations' VALUES (1,'contenttypes','0001_initial','2020-11-30 23:17:53.912947');
INSERT IGNORE INTO 'django_migrations' VALUES (2,'auth','0001_initial','2020-11-30 23:17:53.943810');
INSERT IGNORE INTO 'django_migrations' VALUES (3,'admin','0001_initial','2020-11-30 23:17:53.966110');
INSERT IGNORE INTO 'django_migrations' VALUES (4,'admin','0002_logentry_remove_auto_add','2020-11-30 23:17:54.000769');
INSERT IGNORE INTO 'django_migrations' VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-11-30 23:17:54.021657');
INSERT IGNORE INTO 'django_migrations' VALUES (6,'contenttypes','0002_remove_content_type_name','2020-11-30 23:17:54.073529');
INSERT IGNORE INTO 'django_migrations' VALUES (7,'auth','0002_alter_permission_name_max_length','2020-11-30 23:17:54.093853');
INSERT IGNORE INTO 'django_migrations' VALUES (8,'auth','0003_alter_user_email_max_length','2020-11-30 23:17:54.125524');
INSERT IGNORE INTO 'django_migrations' VALUES (9,'auth','0004_alter_user_username_opts','2020-11-30 23:17:54.149819');
INSERT IGNORE INTO 'django_migrations' VALUES (10,'auth','0005_alter_user_last_login_null','2020-11-30 23:17:54.176294');
INSERT IGNORE INTO 'django_migrations' VALUES (11,'auth','0006_require_contenttypes_0002','2020-11-30 23:17:54.179916');
INSERT IGNORE INTO 'django_migrations' VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-11-30 23:17:54.205325');
INSERT IGNORE INTO 'django_migrations' VALUES (13,'auth','0008_alter_user_username_max_length','2020-11-30 23:17:54.231288');
INSERT IGNORE INTO 'django_migrations' VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-11-30 23:17:54.251306');
INSERT IGNORE INTO 'django_migrations' VALUES (15,'auth','0010_alter_group_name_max_length','2020-11-30 23:17:54.279534');
INSERT IGNORE INTO 'django_migrations' VALUES (16,'auth','0011_update_proxy_permissions','2020-11-30 23:17:54.295587');
INSERT IGNORE INTO 'django_migrations' VALUES (17,'auth','0012_alter_user_first_name_max_length','2020-11-30 23:17:54.316557');
INSERT IGNORE INTO 'django_migrations' VALUES (18,'cars','0001_initial','2020-11-30 23:17:54.365904');
INSERT IGNORE INTO 'django_migrations' VALUES (19,'sessions','0001_initial','2020-11-30 23:17:54.375226');
INSERT IGNORE INTO 'django_admin_log' VALUES (1,'2020-12-01 04:00:32.192001','1','Manufacturers object (1)','[]',2,1,2);
INSERT IGNORE INTO 'django_admin_log' VALUES (2,'2020-12-01 04:01:08.409827','2','Manufacturers object (2)','[{'added': {}}]',2,1,1);
INSERT IGNORE INTO 'django_admin_log' VALUES (3,'2020-12-01 04:01:29.207222','2','Manufacturers object (2)','[]',2,1,2);
INSERT IGNORE INTO 'django_admin_log' VALUES (4,'2020-12-01 19:08:18.371729','2','Manufacturers object (2)','[]',2,1,2);
INSERT IGNORE INTO 'django_admin_log' VALUES (5,'2020-12-01 22:53:03.621068','3','Manufacturers object (3)','[{'added': {}}]',2,2,1);
INSERT IGNORE INTO 'django_content_type' VALUES (1,'cars','auction');
INSERT IGNORE INTO 'django_content_type' VALUES (2,'cars','manufacturers');
INSERT IGNORE INTO 'django_content_type' VALUES (3,'cars','person');
INSERT IGNORE INTO 'django_content_type' VALUES (4,'cars','vehicle');
INSERT IGNORE INTO 'django_content_type' VALUES (5,'cars','cars');
INSERT IGNORE INTO 'django_content_type' VALUES (6,'cars','auction_person');
INSERT IGNORE INTO 'django_content_type' VALUES (7,'admin','logentry');
INSERT IGNORE INTO 'django_content_type' VALUES (8,'auth','permission');
INSERT IGNORE INTO 'django_content_type' VALUES (9,'auth','group');
INSERT IGNORE INTO 'django_content_type' VALUES (10,'auth','user');
INSERT IGNORE INTO 'django_content_type' VALUES (11,'contenttypes','contenttype');
INSERT IGNORE INTO 'django_content_type' VALUES (12,'sessions','session');
INSERT IGNORE INTO 'auth_permission' VALUES (1,1,'add_auction','Can add auction');
INSERT IGNORE INTO 'auth_permission' VALUES (2,1,'change_auction','Can change auction');
INSERT IGNORE INTO 'auth_permission' VALUES (3,1,'delete_auction','Can delete auction');
INSERT IGNORE INTO 'auth_permission' VALUES (4,1,'view_auction','Can view auction');
INSERT IGNORE INTO 'auth_permission' VALUES (5,2,'add_manufacturers','Can add manufacturers');
INSERT IGNORE INTO 'auth_permission' VALUES (6,2,'change_manufacturers','Can change manufacturers');
INSERT IGNORE INTO 'auth_permission' VALUES (7,2,'delete_manufacturers','Can delete manufacturers');
INSERT IGNORE INTO 'auth_permission' VALUES (8,2,'view_manufacturers','Can view manufacturers');
INSERT IGNORE INTO 'auth_permission' VALUES (9,3,'add_person','Can add person');
INSERT IGNORE INTO 'auth_permission' VALUES (10,3,'change_person','Can change person');
INSERT IGNORE INTO 'auth_permission' VALUES (11,3,'delete_person','Can delete person');
INSERT IGNORE INTO 'auth_permission' VALUES (12,3,'view_person','Can view person');
INSERT IGNORE INTO 'auth_permission' VALUES (13,4,'add_vehicle','Can add vehicle');
INSERT IGNORE INTO 'auth_permission' VALUES (14,4,'change_vehicle','Can change vehicle');
INSERT IGNORE INTO 'auth_permission' VALUES (15,4,'delete_vehicle','Can delete vehicle');
INSERT IGNORE INTO 'auth_permission' VALUES (16,4,'view_vehicle','Can view vehicle');
INSERT IGNORE INTO 'auth_permission' VALUES (17,5,'add_cars','Can add cars');
INSERT IGNORE INTO 'auth_permission' VALUES (18,5,'change_cars','Can change cars');
INSERT IGNORE INTO 'auth_permission' VALUES (19,5,'delete_cars','Can delete cars');
INSERT IGNORE INTO 'auth_permission' VALUES (20,5,'view_cars','Can view cars');
INSERT IGNORE INTO 'auth_permission' VALUES (21,6,'add_auction_person','Can add auction_ person');
INSERT IGNORE INTO 'auth_permission' VALUES (22,6,'change_auction_person','Can change auction_ person');
INSERT IGNORE INTO 'auth_permission' VALUES (23,6,'delete_auction_person','Can delete auction_ person');
INSERT IGNORE INTO 'auth_permission' VALUES (24,6,'view_auction_person','Can view auction_ person');
INSERT IGNORE INTO 'auth_permission' VALUES (25,7,'add_logentry','Can add log entry');
INSERT IGNORE INTO 'auth_permission' VALUES (26,7,'change_logentry','Can change log entry');
INSERT IGNORE INTO 'auth_permission' VALUES (27,7,'delete_logentry','Can delete log entry');
INSERT IGNORE INTO 'auth_permission' VALUES (28,7,'view_logentry','Can view log entry');
INSERT IGNORE INTO 'auth_permission' VALUES (29,8,'add_permission','Can add permission');
INSERT IGNORE INTO 'auth_permission' VALUES (30,8,'change_permission','Can change permission');
INSERT IGNORE INTO 'auth_permission' VALUES (31,8,'delete_permission','Can delete permission');
INSERT IGNORE INTO 'auth_permission' VALUES (32,8,'view_permission','Can view permission');
INSERT IGNORE INTO 'auth_permission' VALUES (33,9,'add_group','Can add group');
INSERT IGNORE INTO 'auth_permission' VALUES (34,9,'change_group','Can change group');
INSERT IGNORE INTO 'auth_permission' VALUES (35,9,'delete_group','Can delete group');
INSERT IGNORE INTO 'auth_permission' VALUES (36,9,'view_group','Can view group');
INSERT IGNORE INTO 'auth_permission' VALUES (37,10,'add_user','Can add user');
INSERT IGNORE INTO 'auth_permission' VALUES (38,10,'change_user','Can change user');
INSERT IGNORE INTO 'auth_permission' VALUES (39,10,'delete_user','Can delete user');
INSERT IGNORE INTO 'auth_permission' VALUES (40,10,'view_user','Can view user');
INSERT IGNORE INTO 'auth_permission' VALUES (41,11,'add_contenttype','Can add content type');
INSERT IGNORE INTO 'auth_permission' VALUES (42,11,'change_contenttype','Can change content type');
INSERT IGNORE INTO 'auth_permission' VALUES (43,11,'delete_contenttype','Can delete content type');
INSERT IGNORE INTO 'auth_permission' VALUES (44,11,'view_contenttype','Can view content type');
INSERT IGNORE INTO 'auth_permission' VALUES (45,12,'add_session','Can add session');
INSERT IGNORE INTO 'auth_permission' VALUES (46,12,'change_session','Can change session');
INSERT IGNORE INTO 'auth_permission' VALUES (47,12,'delete_session','Can delete session');
INSERT IGNORE INTO 'auth_permission' VALUES (48,12,'view_session','Can view session');
INSERT IGNORE INTO 'auth_user' VALUES (1,'pbkdf2_sha256$216000$OKMaNZGlYMfc$gOw9azKSy74B00qVaJXJUVLvzxIamsSaB+XLMmrEC70=','2020-12-01 22:50:40.760990',1,'shreyasiyengar','','iyengars@purdue.edu',1,1,'2020-12-01 03:58:11.834021','');
INSERT IGNORE INTO 'auth_user' VALUES (2,'pbkdf2_sha256$216000$icPnu0Xj26QR$SWV5h/9HMksZIWUrALpU/ANgj5wZiceF1tQF0kjJ/Wg=','2020-12-01 22:52:31.897607',1,'biyer','','biyer@gmail.com',1,1,'2020-12-01 22:52:01.966677','');
INSERT IGNORE INTO 'cars_manufacturers' VALUES (1,'Toyota','Japan',1937,29900000000.0);
INSERT IGNORE INTO 'cars_manufacturers' VALUES (2,'BMW','Germany',1916,104000000000.0);
INSERT IGNORE INTO 'cars_manufacturers' VALUES (3,'Suzuki','Japan',1920,9.43809285949084e+18);
INSERT IGNORE INTO 'django_session' VALUES ('41e0u72zdy3p5upfz6c9fjvqmzkgbbxc','OTVmZDZiNGI3OTg0ODc5ZGMwY2QwZDIzYzliY2YyNmEwNmIzZjdkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOWI0NDUzN2Q5ZTQ1ZTYwMDg2NDhjZTBhMTcwNzNmNTRiMTI0OWE0In0=','2020-12-15 04:00:27.046546');
INSERT IGNORE INTO 'django_session' VALUES ('yz7e8hfp4zizc6t1kde0xmbhpzoz72qq','.eJxVjEEOwiAQRe_C2hCYKgWX7j0DmWEYqRpISrsy3l2bdKHb_977LxVxXUpce57jxOqsrDr8boTpkesG-I711nRqdZkn0puid9r1tXF-Xnb376BgL9-aIAlgMibQANZl7-FohYUMg0gSyRQGRhfEAcCYLAYGD3Yk5-1pYPX-AANuOFk:1kkB0H:ooKiE2Zn_-7QLudH40YE2ZJJZaeYfxjDLfFsBHOZjkQ','2020-12-15 19:07:57.188848');
INSERT IGNORE INTO 'django_session' VALUES ('xhihgtu1wsso6mibq7wjro9lcu2whyii','.eJxVjEEOwiAQRe_C2hCYKgWX7j0DmWEYqRpISrsy3l2bdKHb_977LxVxXUpce57jxOqsrDr8boTpkesG-I711nRqdZkn0puid9r1tXF-Xnb376BgL9-aIAlgMibQANZl7-FohYUMg0gSyRQGRhfEAcCYLAYGD3Yk5-1pYPX-AANuOFk:1kkETo:QoEjnIPMLZyEYFh4jwrasRssQYTpm3x5YuqV0m5inb4','2020-12-15 22:50:40.767550');
CREATE UNIQUE INDEX IF NOT EXISTS 'auth_group_permissions_group_id_permission_id_0cd325b0_uniq' ON 'auth_group_permissions' (
	'group_id',
	'permission_id'
);
CREATE INDEX IF NOT EXISTS 'auth_group_permissions_group_id_b120cbf9' ON 'auth_group_permissions' (
	'group_id'
);
CREATE INDEX IF NOT EXISTS 'auth_group_permissions_permission_id_84c5c92e' ON 'auth_group_permissions' (
	'permission_id'
);
CREATE UNIQUE INDEX IF NOT EXISTS 'auth_user_groups_user_id_group_id_94350c0c_uniq' ON 'auth_user_groups' (
	'user_id',
	'group_id'
);
CREATE INDEX IF NOT EXISTS 'auth_user_groups_user_id_6a12ed8b' ON 'auth_user_groups' (
	'user_id'
);
CREATE INDEX IF NOT EXISTS 'auth_user_groups_group_id_97559544' ON 'auth_user_groups' (
	'group_id'
);
CREATE UNIQUE INDEX IF NOT EXISTS 'auth_user_user_permissions_user_id_permission_id_14a6b632_uniq' ON 'auth_user_user_permissions' (
	'user_id',
	'permission_id'
);
CREATE INDEX IF NOT EXISTS 'auth_user_user_permissions_user_id_a95ead1b' ON 'auth_user_user_permissions' (
	'user_id'
);
CREATE INDEX IF NOT EXISTS 'auth_user_user_permissions_permission_id_1fbb5f2c' ON 'auth_user_user_permissions' (
	'permission_id'
);
CREATE INDEX IF NOT EXISTS 'django_admin_log_content_type_id_c4bce8eb' ON 'django_admin_log' (
	'content_type_id'
);
CREATE INDEX IF NOT EXISTS 'django_admin_log_user_id_c564eba6' ON 'django_admin_log' (
	'user_id'
);
CREATE UNIQUE INDEX IF NOT EXISTS 'django_content_type_app_label_model_76bd3d3b_uniq' ON 'django_content_type' (
	'app_label',
	'model'
);
CREATE UNIQUE INDEX IF NOT EXISTS 'auth_permission_content_type_id_codename_01ab375a_uniq' ON 'auth_permission' (
	'content_type_id',
	'codename'
);
CREATE INDEX IF NOT EXISTS 'auth_permission_content_type_id_2f476e4b' ON 'auth_permission' (
	'content_type_id'
);
CREATE INDEX IF NOT EXISTS 'cars_vehicle_manufacturer_id_f94595ef' ON 'cars_vehicle' (
	'manufacturer_id'
);
CREATE INDEX IF NOT EXISTS 'cars_cars_manufacturer_id_cedd3753' ON 'cars_cars' (
	'manufacturer_id'
);
CREATE INDEX IF NOT EXISTS 'cars_cars_owner_id_5c9f34e6' ON 'cars_cars' (
	'owner_id'
);
CREATE INDEX IF NOT EXISTS 'cars_auction_person_auct_id_8bbb4a89' ON 'cars_auction_person' (
	'auct_id'
);
CREATE INDEX IF NOT EXISTS 'cars_auction_person_pers_id_3204ba14' ON 'cars_auction_person' (
	'pers_id'
);
CREATE INDEX IF NOT EXISTS 'django_session_expire_date_a5c62663' ON 'django_session' (
	'expire_date'
);
;;
