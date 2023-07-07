
CREATE TABLE Employee
( 
	employee_id          int IDENTITY ( 1,1 ) ,
	last_name            varchar(100)  NOT NULL ,
	firrst_name          varchar(100)  NOT NULL ,
	job                  varchar(20)  NOT NULL ,
	email                varchar(100)  NULL ,
	phone                varchar(100)  NULL ,
	CONSTRAINT XPKEmployee PRIMARY KEY (employee_id ASC)
)
go



CREATE TABLE DocType
( 
	doc_type             int  NOT NULL ,
	doc_name             varchar(100)  NOT NULL ,
	doc_name_short       varchar(20)  NOT NULL ,
	CONSTRAINT XPKDocType PRIMARY KEY (doc_type ASC)
)
go



CREATE TABLE Customers
( 
	customer_id          int IDENTITY ( 1,1 ) ,
	business_name        varchar(40)  NULL ,
	doc_type             int  NOT NULL ,
	doc_namber           varchar(20)  NOT NULL ,
	address              varchar(150)  NOT NULL ,
	email                varchar(100)  NULL ,
	phone                varchar(100)  NULL ,
	CONSTRAINT XPKCustomers PRIMARY KEY (customer_id ASC),
	CONSTRAINT FK_Customers_DocType FOREIGN KEY (doc_type) REFERENCES DocType(doc_type)
)
go



CREATE TABLE Status
( 
	status_id            integer  NOT NULL ,
	status_name          varchar(50)  NOT NULL ,
	CONSTRAINT XPKStatus PRIMARY KEY (status_id ASC)
)
go



CREATE TABLE Orders
( 
	order_id             int IDENTITY ( 1,1 ) ,
	employee_id          int  NOT NULL ,
	customer_id          int  NOT NULL ,
	status_id            integer  NOT NULL ,
	date_created         date  NOT NULL ,
	date_inventory       datetime  NOT NULL ,
	date_presupuesto     datetime  NULL ,
	importe              money  NOT NULL 
	CONSTRAINT DF_ZERO_237053707
		 DEFAULT  0,
	impuesto             money  NOT NULL 
	CONSTRAINT DF_ZERO_616357717
		 DEFAULT  0,
	total                money  NULL 
	CONSTRAINT DF_ZERO_1621176587
		 DEFAULT  0,
	observaciones        text  NULL ,
	CONSTRAINT XPKOrders PRIMARY KEY (order_id ASC),
	CONSTRAINT FK_Orders_Employee FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT FK_Orders_Status FOREIGN KEY (status_id) REFERENCES Status(status_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE Inventory
( 
	object_id            int IDENTITY ( 1,1 ) ,
	order_id             int  NOT NULL ,
	category             varchar(10)  NOT NULL ,
	object               varchar(20)  NOT NULL ,
	details              text  NULL ,
	CONSTRAINT XPKInventory PRIMARY KEY (object_id ASC),
	CONSTRAINT Inventory_Orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES Orders(order_id)
)
go



CREATE TABLE Accounts
( 
	employee_id          int  NOT NULL ,
	user_name            varchar(20)  NOT NULL ,
	pass                 varbinary(64)  NOT NULL ,
	CONSTRAINT XPKAccounts PRIMARY KEY (employee_id ASC),
	CONSTRAINT FK_Accounts_Employee FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
)
go



CREATE TABLE Services
( 
	service_id           int  NOT NULL ,
	service_name         varchar(40)  NULL ,
	unit_price           numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKServices PRIMARY KEY (service_id ASC)
)
go



CREATE TABLE OrderDetails
( 
	order_id             int  NOT NULL ,
	service_id           int  NOT NULL ,
	unit_price           numeric(10,2)  NULL ,
	quantity             int  NULL ,
	discount             numeric(5,2)  NOT NULL ,
	subtotal             numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKOrderDetails PRIMARY KEY (order_id ASC,service_id ASC),
	CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
CONSTRAINT FK_OrderDetails_Services FOREIGN KEY (service_id) REFERENCES Services(service_id)
)
go


