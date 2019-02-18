#!/usr/bin/python2.7

class Config:
    database	= "restaurant_db"
    user	= "root"
    password	= ""
    host	= "localhost"
    pageBaseUrl	= "http://localhost/restaurantApp/"

if __name__ == '__main__':
    con = Config()
    print(con.database)




