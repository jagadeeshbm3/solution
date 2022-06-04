Part-1

Container failed to launch due to no input file
Commands:
1. 
#docker run -d infracloudio/csvserver:latest
9bf424118e9544ba4ba5b593d0aa9746741d53f153002d95982fe821c2e155e5

#docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

#docker ps -a

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS     NAMES
9bf424118e95   infracloudio/csvserver:latest   /csvserver/csvserver   7 seconds ago   Exited (1) 6 seconds ago             pedantic_chebyshev

2.checked the logs
#docker logs 9bf424118e95
2022/06/04 13:34:58 error while reading the file /csvserver/inputdata: open /csvserver/inputdata: no such file or directory

3. written shell script and generated inputFile

> vim gencsv.sh
> chmod 777 gencsv.sh
> ./gencsv.sh
> ls
gencsv.sh inputFile

4.> created container with input file 
docker run -d -v /Users/jmokshar/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
d4330d7c2d470aade4853533673dc4381cbd1cc4f240b77543bd5d463c779bd6

 ~/solution> docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS      NAMES
d4330d7c2d47   infracloudio/csvserver:latest   /csvserver/csvserver   19 seconds ago   Up 18 seconds   9300/tcp   youthful_panini


5. checked the listening port
 ~/solution> docker exec -it d4330d7c2d47 netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver
~/solution>
~/solution> docker rm -f d4330d7c2d47
d4330d7c2d47

6. created the final container
 ~/solution> docker run -d -p 9393:9300 -e CSVSERVER_BORDER=Orange -v /Users/jmokshar/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
b6b2abea018178d2f951631f7915e01d707ea43abf7b0e529509fca8e6205263
~/solution> docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS         PORTS                    NAMES
b6b2abea0181   infracloudio/csvserver:latest   /csvserver/csvserver   4 seconds ago   Up 4 seconds   0.0.0.0:9393->9300/tcp   flamboyant_wing
 ~/solution>
