#!/usr/bin/python2.7

import mysql.connector
import cgi
import cgitb
import os
import urlparse
import re
import math

from config import Config


def displayListing(dbCursor, req):
    noOfResults	= 6
    resultPageOffset = int(req['params'][1]) 

    sqlQuery = "SELECT id, photo, name, address,phone_no, description, rating FROM restaurants"

    sqlWhere = []

    if('filter' in req['queryDict']):
        sqlWhere.append( " rating = "+ req['queryDict']['filter'])

    if('search' in req['queryDict']):
        fields = ['name', 'address', 'phone_no', 'description']
        sqlSearch = ( ' OR '.join([col+' LIKE \"%'+ req['queryDict']['search']+'%\" ' for col in fields]))
	sqlSearch = " ( "+sqlSearch+" )"
        sqlWhere.append(sqlSearch)

    if(len(sqlWhere)>0):
        sqlQuery +=" WHERE "+ " AND ".join( sqlWhere)

    if('sort' in req['queryDict'] and req['queryDict']['sort'] in ['id','name','rating']):
        sqlQuery += " ORDER BY "+ req['queryDict']['sort']+ " "


    sqlQuery +=" LIMIT {0} OFFSET {1};".format(noOfResults, resultPageOffset*noOfResults)
    dbCursor.execute(sqlQuery)

    results = dbCursor.fetchall()
    print("""
        <div class="wrapper container">

        <div class="options">
            <a>
            <label>filter by rating:</label>
            <select id="filter" onChange="updatePage()" >
                <option value=""></option>
                <option value="5">5</option>
                        <option value="4">4</option>
                        <option value="3">3</option>
                        <option value="2">2</option>
                        <option value="1">1</option>
                </select>
            </a> 
            <a>
            <label>sort by:</label>
            <select id="sorter" onChange="updatePage()" >
                <option value=""></option>
                <option value="name">Name Asc</option>
                        <option value="name DESC">Name Desc</option>
                        <option value="rating">Ratings Asc</option>
                        <option value="rating DESC">Ratings Desc</option>
                </select>
            </a>
            <a>
                <input type="text" id="search" placeholder="Search">
                <button onClick="updatePage()">Search</button>
            </a>
            <br>
        </div>
            <div style="width:100%; max-width: 1000px; ">""")

    for each in results:
        print("""
		<a href="{6} ">
	            <div class="card" >
	                <img src="{0}" >
	                <h2> {1} </h2>
	            	<p>Ratings:{5}</p>
	                <a>address:{2}</a><br>
	            	<a>phone no:{3}</a>
	            	<!-- <p>Description:{4}</p> -->
	            </div>
		</a>
        """.format(req['baseUrl']+each[1],each[2],each[3],each[4],each[5],each[6], req['baseUrl']+page+"/restaurant/"+str(each[0])))
    print("""  

            </div>
        <!-- Pagination -->
        <div class="pagination">
        """)
    sqlQuery= "SELECT COUNT(*) FROM restaurants " 

    if(len(sqlWhere)>0):
        sqlQuery+=" WHERE "+ " AND ".join(sqlWhere)

    sqlQuery +=" ;"
        
    dbCursor.execute(sqlQuery)
    rowCount = dbCursor.fetchone()[0]


    if(resultPageOffset>0):
        print("""
            <a href={0} ><<</a> """.format( req['baseUrl']+req['page']+"/"+str(resultPageOffset - 1)+ req['queryString'] ))
    maxPages = int( math.ceil(float(rowCount)/noOfResults))

    for i in range(0,maxPages):
        print("""
            <a href={0} >{1}</a>""".format(req['baseUrl']+req['page']+"/"+str(i)+ req['queryString'] ,i+1))

    if(resultPageOffset < (maxPages-1)):
        print("""
            <a href={0} >>></a>""".format(req['baseUrl']+req['page']+"/"+ str(resultPageOffset + 1) + req['queryString'] ))

    print("""
        </div>
        <div class="push"></div>

        <script type="text/javascript">
        function initPage(){
            console.log("initPage");
                    document.getElementById('filter').value= """ + (req['queryDict']['filter'] if ('filter' in req['queryDict']) else "''") + """;
                    document.getElementById('sorter').value= """ + (("'"+ req['queryDict']['sort']+"'") if ('sort' in req['queryDict']) else "''")     + """;
                    document.getElementById('search').value= """ + (("'"+ req['queryDict']['search']+"'") if ('search' in req['queryDict']) else "''") + """;
        };
        function updatePage(){
            var url ='""" + str(req['baseUrl'])+ req['page']  + """';
            var filter = document.getElementById('filter').value;
            var sorter = document.getElementById('sorter').value;
                    var search = document.getElementById('search').value;
            
            var options = []
            if(filter!="")  options.push("filter="+filter);
            if(sorter!="")	options.push("sort="+sorter);
            if(search!="")  options.push("search="+search);
        
        
            if(options.length>0) var newUrl = url+"?"+options.join("&");
            else var newUrl = url;
            console.log(newUrl);
            window.location = newUrl;
            
        };
        window.onload = initPage;
        </script>
        
        </div>
        """)

def displayRestaurantInfo(dbCursor, req):
    if(req['params'][2].isdigit()):
	pass

    sqlQuery = "SELECT id, photo, name, address,phone_no, description, rating FROM restaurants WHERE id = "+req['params'][2]+";"

    dbCursor.execute(sqlQuery)
    result = dbCursor.fetchone()
    print("""
	<div class="wrapper container restaurant-cover">
	    <h1>{1}</h1>
            <img src="{0}" >
	    <div>
            	<p>Ratings:{5}</p>
            	<a>address:{2}</a><br>
            	<a>phone no:{3}</a>
            	<p>Description:{4}</p>
	    </div>
	</div>
    """.format(req['baseUrl']+result[1], result[2],result[3], result[4],result[5],result[6]))

def displayNotFound(dbCursor, req):
    print("<h2>Page not found</h2>")


if __name__ == '__main__':

    print("Content-Type: text/html")
    print("\n\n")

    cgitb.enable()


    conf = Config()

    page = __file__.split('/')[-1]
    #page = "page.py"

    # Getting base url
    if('REQUEST_URI' in os.environ):
        uri = os.environ['REQUEST_URI']
        parsedUri = urlparse.urlparse(uri)
        startIndex = re.search(page, parsedUri.path).start()

        baseUrl = parsedUri.path[:startIndex]
        params = parsedUri.path[startIndex:]
        params = params.split("/")
	
        queryString = parsedUri.query
	if(len(queryString)>0): queryString = '?' + queryString
        queryDict = dict(urlparse.parse_qsl(parsedUri.query))
    else:
        baseUrl = conf.pageBaseUrl
        params=[]
	params.append(page)
        queryString =""
        queryDict ={}
    
    req = {}
    req['baseUrl'] = baseUrl
    req['page'] = page
    req['params']=params
    req['queryString'] = queryString
    req['queryDict'] =	queryDict

    if(len(req['params'])>1):
	if(req['params'][1]=="restaurant"):
	    if(req['params'][2].isdigit()):
	    	expandPage = displayRestaurantInfo
	    else:
		expandPage = displayNotFound
        elif(req['params'][1].isdigit()):
            expandPage = displayListing
	else:
	    expandPage = displayNotFound
    else:
	req['params'].append('0')
	expandPage = displayListing


    db = mysql.connector.connect(
        host	= conf.host, 
        user	= conf.user, 
        passwd	= conf.password,
        database= conf.database)

    dbCursor = db.cursor()

    print(""" 
    <!DOCTYPE html>
    
    <html lang="en"> 
    <head>
        <meta charset="utf-8" />
        <!--link rel="stylesheet" href="css/style.css"-->
        <style type="text/css">
            *{margin:0}
            html,body{height:100%}
            .header{
                padding: 10% 10%;
            }
            .wrapper{
                min-height:100%;
                height: auto !important;
                height 100%;
                height 1500px;
                margin: 0 auto -142px;
		padding:15px;
            }
            .footer, .push{
                height:142px;
            }
            .card{
                float:left;
                max-width:300px;
                height:550px;
                margin:10px;
            }
            .card img{
                width:100%;
                height:400px;
                object-fit:cover;
            }
	    .card a {
		text-decoration: none;
		color:black;
	    }
            .pagination{
                clear:both;
                padding: 0 40%;
		text-align: center;
            }
	    .pagination a{
		padding: 10px;
		background-color: #000;
		color: white;
		text-decoration: none;
	    }
            .footer{
                margin-top:142px;
                clear:both;
                /*padding: 0px 40% ;*/
            }
            .footer pre{
                padding: 60px 0px;
		text-align: center;
            }
            .options{
                padding:0  15px;
            }
	    .restaurant-cover img{
		max-width: 1200px;
		height: 500px;
		object-fit: cover;
		width: 100%;
	     }
	     .restaurant-cover div{
		padding: 20px 0;
		font-size: larger;
		max-width: 1200px;
	     }
	     body a{
               text-decoration: none;
               color:black;
	     }
        </style>
        <title>Restaurant Listing</title>
    </head>
    <body>
        <a href='"""+ req['baseUrl']+req['page']+ """' >
	    <div  class="header">
        	<h1>Restaurant Listing Page</h1>
            	<h2>Search for your favourite restaurant</h2>
       	     </div>
	</a>""" )

    expandPage(dbCursor,req)
    
    print("""
        <div class="footer">
            <pre>Made by Shivam Kurtarkar</pre>
        </div>
    </body>
    </html>
        """)

