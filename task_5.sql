import mysql.connector

mydb= mysql.connector.connect(
        host="localhost",
        user= "asmaa_mahgoub",
        password= "Asmaa1239",
        database= "alx_book_store"
)

mycursor= mydb.cursor()
mycursor.execute("""
INSERT INTO Customers (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.')
""")

mydb.commit()
mycursor.close()
mydb.close()