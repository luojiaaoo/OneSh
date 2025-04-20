#!/bin/bash
### 全局常量
SCRIPT_DIRPATH=`dirname $0`
### 解析参数
while getopts ":ld:" option; do
  case $option in
    l)
      human=true;; # 是否需要输出自然语言
    d)
      loc="$OPTARG";;  # 是否需要定位
    \?)
      echo "错误: 无效选项 -$OPTARG" >&2; exit 1;;
    :)
      echo "选项 -$OPTARG 需要参数" >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

function encode_url()
{
    echo '{"val":"'$1'"}' | jq -r '.val | @uri'
}
function decode_url()
{
    echo "$1" | xxd -p -r
}

if [ -n "$loc" ];then
    sheng=`echo $loc|awk -F ',' '{print $1}'`
    sheng=`encode_url $sheng`
    place=`echo $loc|awk -F ',' '{print $2}'`
    place=`encode_url $place`
else
    ip=`curl --silent --location "https://cn.apihz.cn/api/ip/getapi.php?id=88888888&key=88888888"|jq -r ".ip"`
    loc_json=`curl --silent --location "https://cn.apihz.cn/api/ip/chaapi.php?id=88888888&key=88888888&ip=${ip}"`
    sheng=`echo "$loc_json"|jq -r ".sheng"`
    sheng=`encode_url $sheng`
    place=`echo "$loc_json"|jq -r ".shi"`
    place=`encode_url $place`
fi
rt_json=`curl --silent --location "https://cn.apihz.cn/api/tianqi/tqyb.php?id=88888888&key=88888888&sheng=${sheng}&place=${place}"`
if [ -z "$human" ];then
    echo $rt_json
else
# {"precipitation":0,"temperature":26,"pressure":945,"humidity":42,"windDirection":"东南风","windDirectionDegree":134,"windSpeed":2.9,"windScale":"微风","code":200,"place":"中国, 四川, 绵阳","weather1":"小雨","weather2":"小雨"}
    echo $rt_json| jq -r '"当前\(.place);天气情况：\(.weather1);气温\(.temperature)℃;湿度\(.humidity)%;气压\(.pressure)hPa;\(.windDirection)\(.windScale);风速\(.windSpeed)m/s。"'
fi
