
import mysql.connector

try:
    # Establish a connection to the MySQL server
    # Do NOT specify a database name here, as we are creating one
    mydb = mysql.connector.connect(
        host="localhost",
        user="asmaa_mahgoub",
        password="Asmaa1239"
    )

    # Create a cursor object to execute SQL queries
    mycursor = mydb.cursor()

    # SQL query to create the database if it doesn't already exist
    sql_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
    mycursor.execute(sql_query)

    # Print success message. The IF NOT EXISTS part of the query prevents an error
    # even if the database already exists, so we can always print this.
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    # Handle connection errors
    print(f"Error: {err}")

finally:
    # Close the cursor and connection, regardless of success or failure
    if 'mycursor' in locals() and mycursor is not None:
        mycursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()