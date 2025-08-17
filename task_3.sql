import mysql.connector
import sys

# Get database name from command-line argument
if len(sys.argv) < 2:
    print("Usage: python task_3.py <database_name>")
    sys.exit()

database_name = sys.argv[1]

try:
    # Connect to MySQL server and specify the database name
    mydb = mysql.connector.connect(
        host="localhost",
        user="asmaa_mahgoub",
        password="Asmaa1239",
        database=database_name  # The database argument is passed here
    )

    # Create a cursor to execute SQL commands
    mycursor = mydb.cursor()

    # Execute SHOW TABLES to list all tables
    mycursor.execute("SHOW TABLES;")
    tables = mycursor.fetchall()

    # Print the table names
    print(f"Tables in '{database_name}':")
    for table in tables:
        print(table[0])

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Close cursor and connection
    if 'mycursor' in locals() and mycursor is not None:
        mycursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()