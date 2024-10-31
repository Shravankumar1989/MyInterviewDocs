import mysql.connector
from mysql.connector import Error

try:
    # Try connecting to the MySQL database
    db_connection = mysql.connector.connect(
        host="localhost",  # Your MySQL host
        user="root",  # Your MySQL username
        password="",  # Your MySQL password
        database="roi_update_new"  # Name of the database you want to connect to
    )

    if db_connection.is_connected():
        print("Connected to the database")

        # Create a cursor object
        cursor = db_connection.cursor()

        # Example query: Fetching data from a table
        query = "SELECT * FROM country"
        cursor.execute(query)

        # Fetch all results
        data = cursor.fetchall()

        # Fetch and print all rows from the executed query
        if data:
            for country in data:
                country_id                  = country[0]
                country_name                = country[1]
                country_code                = country[2]
                country_dial_code           = country[3]
                country_currency_name       = country[4]
                country_currency_symbol     = country[5]
                country_currency_code       = country[6]
                print(f"{country_id} {country_name} {country_code} {country_dial_code} {country_currency_name} {country_currency_symbol} {country_currency_code} \n")
        else:
            print("No data found in the 'country' table.")

except Error as e:
    if e.errno == 1049:
        print(f"Error: Database does not exist - {e}")
    else:
        print(f"Error: {e}")

finally:
    try:
        # Check if the connection is established before closing it
        if db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print("MySQL connection is closed")
    except NameError:
        print("Database connection was not established, nothing to close.")