import mysql.connector
from mysql.connector import Error

try:
    # Establish connection to MySQL server
    connection = mysql.connector.connect(
    host="localhost",
    user= "asmaa_mahgoub",
    password= "Asmaa1239"
)
    if connection.is_connected():
        cursor = connection.cursor()
        # Explicitly select the alx_book_store database
        cursor.execute("USE alx_book_store;")
        # Query to list all tables
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()
        
        # Print each table name
        for table in tables:
            print(table[0])

except Error as e:
    print(f"Error connecting to MySQL: {e}")

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed.")