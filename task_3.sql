import mysql.connector
import sys

# Get database name from command-line argument
if len(sys.argv) < 2:
    print("Usage: python task_3.py <alx_book_store>")
    sys.exit()

database_name = sys.argv[1]

try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="asmaa_mahgoub",
        password="Asmaa1239",
        database=alx_book_store  
    )

    # Create a cursor to execute SQL commands
    mycursor = mydb.cursor()

    # Execute SHOW TABLES to list all tables
    mycursor.execute("SHOW TABLES;")
    tables = mycursor.fetchall()

    # Print the table names
    print(f"Tables in '{alx_book_store}':")
    for table in tables:
        print(table[0])

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
        mycursor.close()
        mydb.close()