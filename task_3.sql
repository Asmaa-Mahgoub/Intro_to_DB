# task_3.py
import mysql.connector
import sys

# Get database name from command-line argument
if len(sys.argv) < 2:
    print("Usage: python task_3.py <database_name>")
    sys.exit()

database_name = sys.argv[1]

try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="asmaa_mahgoub",   # your MySQL username
        password="Asmaa1239"    # your MySQL password
    )

    # Create a cursor to execute SQL commands
    mycursor = mydb.cursor()

    # Select the database
    mycursor.execute(f"USE {database_name}")

    # Execute SHOW TABLES to list all tables
    mycursor.execute("SHOW TABLES")
    tables = mycursor.fetchall()

    # Print the table names
    print(f"Tables in '{database_name}':")
    for table in tables:
        print(table[0])

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Close cursor and connection
    if 'mycursor' in locals():
        mycursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()
