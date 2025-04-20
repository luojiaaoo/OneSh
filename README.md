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

- 获取天气

  ```bash
  # 默认获取IP属地天气
  sh weather/onesh_getLocalWeather.sh
  # > {"precipitation":0,"temperature":26,"pressure":945,"humidity":42,"windDirection":"东南风","windDirectionDegree":134,"windSpeed":2.9,"windScale":"微风","code":200,"place":"中国, 四川, 绵阳","weather1":"小雨","weather2":"小雨"}
  
  # 获取自然语言版本的天气输出(默认为json)
  sh weather/onesh_getLocalWeather.sh -l
  # > 当前中国, 四川, 绵阳;天气情况：小雨;气温26℃;湿度42%;气压945hPa;东南风微风;风速2.9m/s。
  
  # 获取绵阳天气
  sh weather/onesh_getLocalWeather.sh -d 四川,绵阳
  ```
