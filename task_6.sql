# filename: task_6.py
import mysql.connector
import sys

try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="asmaa_mahgoub",  
        password="Asmaa1239",
        database= "alx_book_store"   
    )

    mycursor = mydb.cursor()

    # Select the database
    mycursor.execute(f"USE {"alx_book_store"};")

    # Multiple rows to insert
    sql_insert = """
    INSERT INTO Customers(customer_id, customer_name, email, address)
    VALUES (%s, %s, %s, %s)
    """
    values = [
        (2, "Blessing Malik", "bmalik@sandtech.com", "124 Happiness Ave."),
        (3, "Obed Ehoneah", "eobed@sandtech.com", "125 Happiness Ave."),
        (4, "Nehemial Kamolu", "nkamolu@sandtech.com", "126 Happiness Ave.")
    ]

   
    mycursor.executemany(sql_insert, values)
    mydb.commit()
    print(f"{mycursor.rowcount} rows inserted successfully into 'customer' table.")

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
        mycursor.close()
        mydb.close()
