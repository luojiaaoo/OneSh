### 解析参数
while getopts ":ld:" option; do
  case $option in
    l)
      human=true;;
    d)
      qh="$OPTARG";;
    \?)
      echo "错误: 无效选项 -$OPTARG" >&2; exit 1;;
    :)
      echo "选项 -$OPTARG 需要参数" >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

dcb_uri="https://cn.apihz.cn/api/caipiao/shuangseqiu.php?id=88888888&key=88888888"
if [ -z "$qh" ];then
    api_json=`curl --silent --location "https://cn.apihz.cn/api/caipiao/shuangseqiu.php?id=88888888&key=88888888"`
else
    api_json=`curl --silent --location "https://cn.apihz.cn/api/caipiao/shuangseqiu.php?id=88888888&key=88888888&qh=${qh}"`
fi

if [ -z "$human" ];then
    echo $api_json
else
    # {"qihao":"2023101","time":"2023-10-03 21:30:00","number":"01|02|03|04|05|06","number1":"07","no1num":0,"no1money":0,"no2num":0,"no2money":0,"no3num":0,"no3money":0,"xiaoshou":0,"jiangchi":0,"no1msg":"无"}
    echo $api_json| jq -r '
  "期号: \(.qihao)",
  "开奖日期: \(.time)",
  "开奖结果: \(.number | split("|") | join(", "))",
  "蓝球号码: \(.number1)",
  "一等奖中奖注数: \(.no1num) 注，每注奖金: \(.no1money) 元",
  "二等奖中奖注数: \(.no2num) 注，每注奖金: \(.no2money) 元",
  "三等奖中奖注数: \(.no3num) 注，每注奖金: \(.no3money) 元",
  "总销售额: \(.xiaoshou | tonumber / 10000 | floor) 万元",
  "奖池金额: \(.jiangchi | tonumber / 10000 | floor) 万元",
  "一等奖中奖地区: \(.no1msg)"
'
fi