### get best api uri by https://www.apihz.cn/api/tqtqyb.html, thanks apihz.
api_uri=`curl --silent --location 'https://api.apihz.cn/getapi.php'| jq -r '.api' 2> /dev/null`
is_ok_get_api_url=%?
api_uri_buffer_file=`$script_path\api_uri.tmp`
if [ $is_ok_get_api_url -eq 0 ];then
    echo "$is_ok_get_api_url" > $api_uri_buffer_file
fi
