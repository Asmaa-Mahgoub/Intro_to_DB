import mysql.connector
mydb= mysql.connector.connect(
    host="localhost",
    user= "asmaa_mahgoub",
    password= "Asmaa1239",
    database= "alx_book_store"
)

mycursor= mydb.cursor()
mycursor.execute(""" CREATE TABLE Books(
book_id INT PRIMARY KEY,
title VARCHAR(130),
author_id INT,
price DOUBLE,
publication_date DATE,
 FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)

""")
mydb.commit()

mycursor.execute(""" CREATE TABLE Authors(
author_id INT PRIMARY KEY,
author_name VARCHAR(215)
)
""")
mydb.commit()

mycursor.execute(""" CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(215),
email VARCHAR(215),
address TEXT)
""")
mydb.commit()

mycursor.execute(""" CREATE TABLE Orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
""")
mydb.commit()

mycursor.execute(""" CREATE TABLE Order_Details(
orderdetailid PRIMARY KEY,
order_id INT, 
book_id INT,
quantity DOUBLE
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
""")


