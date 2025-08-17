import mysql.connector
import sys

try:
    mydb= mysql.connector.connect(
    host="localhost",
    user= "asmaa_mahgoub",
    password= "Asmaa1239",
    database= "alx_book_store"
)

    mycursor= mydb.cursor()
    mycursor.execute("""
        SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'alx_book_store'
        AND TABLE_NAME = 'Books'
    """)
    for row in mycursor.fetchall():
        print(f"{row[0]} | {row[1]} | {row[2]} | {row[3]}")

except mysql.connector.Error as e:
    print(f"Error: {e}")

finally:
        mycursor.close()
        mydb.close()