#先运行merge脚本
"D:\Program Files\Git\bin\sh.exe" --login -i -c "pwd"
pause
"D:\Program Files\Git\bin\sh.exe" --login -i -c ".merge.sh"
echo 合并完成，开始编译
pause

::编译
mvn clean package -U Dmaven.test.skip=true -Ptest

:SELECT
  echo 选择需要编译的项目
  echo [1].batch1
  echo [2].batch2
  echo [3].batch3
  echo [4].batch4
  echo [5].退出
  :SELECT_AGAIN
  set /P option="输入要编译的项目[1|2|3|4|5]:"
  if "%option%"=="1" goto batch1
  if "%option%"=="1" goto batch2
  if "%option%"=="1" goto batch3
  if "%option%"=="1" goto batch4
  if "%option%"=="1" goto end
  goto SELECT_AGAIN

::连接远程，创建文件夹
ssh cczs@10.200.161.123 'bash -s' < scripts.sh

::传输版本包,这里只举一个例子。
::传输文件不需要输入密码的方法，是将源主机的公钥复制到目标主机，改名为authorized_keys。并在源主机上执行命令scp ~/.ssh/id_rsa.pub 目标主机IP:/home/zzcc/authorized_keys
::
:batch1
scp -p 22 本地文件夹目录 用户名
sshpass -p 密码 scp -P 端口 源文件 目的文件
.
.
.
