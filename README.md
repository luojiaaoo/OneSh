# OneSh
🔥 OneSh: 一个功能强大的一行命令工具，只用最纯粹的Bash实现最丰富的功能

### 环境准备

- **Linux**

  无需准备，本工具只用最纯粹的命令行实现工具

- Windows

  1. 需要安装Windows Bash环境，比如msys2、git bash环境添加进系统PATH环境变量
  2. 下载[jq](https://jqlang.org/download/)，一个命令行JSON格式解析工具，添加进系统PATH环境变量

### 功能

#### 天气

- 获取天气 - weather/onesh_getLocalWeather.sh

  ```bash
  ## 默认获取IP属地天气
  sh weather/onesh_getLocalWeather.sh
  ## > {"precipitation":0,"temperature":26,"pressure":945,"humidity":42,"windDirection":"东南风","windDirectionDegree":134,"windSpeed":2.9,"windScale":"微风","code":200,"place":"中国, 四川, 绵阳","weather1":"小雨","weather2":"小雨"}
  
  ## 获取自然语言版本的输出(默认为json)
  sh weather/onesh_getLocalWeather.sh -l
  # > 当前中国, 四川, 绵阳;天气情况：小雨;气温26℃;湿度42%;气压945hPa;东南风微风;风速2.9m/s。
  
  ## 获取绵阳天气
  sh weather/onesh_getLocalWeather.sh -d 四川,绵阳
  ```

#### 彩票

- 双色球中奖信息 - lottery/onesh_getDoubleColorBall.sh

  ```bash
  ## 获取最新中奖数据
  sh lottery/onesh_getDoubleColorBall.sh
  # > {"number":"06|10|17|19|25|31|06","number1":"6","qihao":"2025041","time":"2025-04-15(二)","no1num":"8","no2num":"114","no3num":"1876","no4num":"89096","no5num":"1543077","no6num":"13401137","no1money":"6972893","no2money":"173060","no3money":"3000","no4money":"200","no5money":"10","no6money":"5","name":"双色球","xiaoshou":"377141604","jiangchi":"2002373802","no1msg":"辽宁1注，浙江1注，安徽1注，河南1注，广东1注，四川2注，新疆1注，共8注。","code":200}
  
  ## 获取自然语言版本的输出(默认为json)
  sh lottery/onesh_getDoubleColorBall.sh -l
  # > 期号: 2025041
  # > 开奖日期: 2025-04-15(二)
  # > 开奖结果: 06, 10, 17, 19, 25, 31, 06
  # > 蓝球号码: 6
  # > 一等奖中奖注数: 8 注，每注奖金: 6972893 元
  # > 二等奖中奖注数: 114 注，每注奖金: 173060 元
  # > 三等奖中奖注数: 1876 注，每注奖金: 3000 元
  # > 总销售额: 37714 万元
  # > 奖池金额: 200237 万元
  # > 一等奖中奖地区: 辽宁1注，浙江1注，安徽1注，河南1注，广东1注，四川2注，新疆1注，共8注。
  
  ## 获取对应期号
  sh lottery/onesh_getDoubleColorBall.sh -d 2025041
  ```