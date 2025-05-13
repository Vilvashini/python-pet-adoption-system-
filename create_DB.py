import mysql.connector



# establish connection



conn = mysql.connector.connect(host = 'localhost',
                               user = 'root',
                               port = 3307,
                               password = '1983',
                               auth_plugin = 'mysql_native_password'
                               )




cur_obj = conn.cursor()

cur_obj.execute("CREATE DATABASE PetAdoptionDB;")


cur_obj.execute("SHOW DATABASES;")
for row in cur_obj:
    print(row)


print(conn)
conn.close()


