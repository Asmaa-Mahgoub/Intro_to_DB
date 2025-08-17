import mysql.connector

mydb= mysql.connector.connect(
    host="localhost",
    user= "asmaa_mahgoub",
    password= "Asmaa1239",
    database= "alx_book_store"
)

mycursor= mydb.cursor()
mydb.commit()

def list_book():
    sql= "SELECT * FROM Books"
    mycursor.execute(sql)

mycursor.close()
mydb.close()
