# 你的域名，注意不包括主机名
domain="mydomain.com"
# 主机名，支持泛域名哦也支持 @
name="*" 
# 登录 godaddy 查看
key="xxxxxxxxxxxxxxxx" 
# 登录 godaddy 查看
secret="xxxxxxxxxxx"

headers="Authorization: sso-key $key:$secret"
echo "`date +%Y-%m-%d,%H:%M:%S`";
result=$(curl -s -X GET -H "$headers" \
"https://api.godaddy.com/v1/domains/$domain/records/A/$name")
oldIp=$(echo $result | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
echo "oldIp:" $oldIp

# 获取你的公网IP
ret=$(curl -s GET "http://pv.sohu.com/cityjson")
currentIp=$(echo $ret | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
echo "currentIp:" $currentIp
if [ "$dnsIp" != "$currentIp" ];
then
    echo "Ips are not equal"
    request='[{"data":"'$currentIp'","ttl":3600}]'
    echo $request
    result=$(curl -i -s -X PUT \
 -H "$headers" \
 -H "Content-Type: application/json" \
 -d $request "https://api.godaddy.com/v1/domains/$domain/records/A/$name")
    echo $result
fi  