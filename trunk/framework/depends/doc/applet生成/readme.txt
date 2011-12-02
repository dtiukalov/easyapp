applet 打包并签名认证。

将 jasperreport 目录下的 jasperreports-3.0.1-applet.jar 解压。在任一磁盘根目录下新建一文件夹 temp，将 jasperreports-3.0.1-applet.jar 解压后的 META-INF、net、default.jasperreports.properties（这个一定要复制，不然会报 NullPointer 异常）全部复制到 temp下，将 test2 项目下的 WEB-INF 下 classes 中的文件 com 也复制到 temp 下。

CMD 命令， E:/temp>

下键入 jar -cvf reportprint.jar *

temp 目录下会生成 reportprint.jar 包。

用keytool生成证书：keytool -genkey -alias printkey -keystore printstore -storepass saturn -dname "CN=LeslieGu, OU=CCUT, O=CCUT, L=ChangChun, ST=JiLin, C=CN" -validity 3650

还是用keytool导出证书：keytool -export -keystore printstore -alias printkey -file print.cer -storepass saturn

用jarsigner给reportprint.jar加上数字签名：jarsigner -keystore printstore reportprint.jar printkey -keypass saturn -storepass saturn
输入密码:saturn

通过以下命令查看有效期 ： keytool -list -v -keystore printstore -storepass saturn

以上都是在命令提示符下运行，printkey和printstore都可以以自己的命名方式来命名。现在在temp下已经有了一个reportprint.jar和一个print.cer，把这两个文件拷贝回项目中，记得还是放在同一个目录下（最好是根目录，即 Test2 项目的 WebRoot 下）。
