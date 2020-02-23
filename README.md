godaddy ddns update shell script

把下面脚本放到，路径自己决定  
/data/services/godaddy/ddns.sh  
然后 crontab -e 添加，频率自己修改  
*/5 * * * * /data/services/godaddy/ddns.sh >> /data/services/godaddy/ddns.log  

顺便找了几个获取公网IP的接口  
http://ip-api.com/json/?lang=zh-CN  
有频率限制，不能短时间内重复调用，应该是因为可以查任意IP归属地，所以限制了  
http://ip.taobao.com/service/getIpInfo.php?ip=myip  
这个也可以任意查任意IP归属地  
http://ip-api.com/json/113.97.18.125?lang=zh-CN  
http://www.taobao.com/help/getip.php  
http://pv.sohu.com/cityjson
