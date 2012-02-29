关于部署过程：
1、复制Teamcenter8文件夹到C:\Siemens下。（这里假设TC装载C:\Siemens\Teamcenter8)；
2、执行C:\Siemens\Teamcenter8\web_tier\warPackager.bat -w操作，打tc.ear包；
3、在http://localhost:7001/console中的weblogic里更新tc程序；
4、清空IE缓存；
5、重新登录http://localhost:7001/tc/webclient看部署变化；


关于自定义开发：
1、关于修订菜单:Teamcenter8\web_tier\staging1\webapp_root\teamcenter\dhtml\common\intl\cn\wsomenu_custom.xml
2、修订菜单的js函数:Teamcenter8\web_tier\staging1\webapp_root\teamcenter\dhtml\custom\webitk_report.js
3、修订报表表单项：Teamcenter8\web\htdocs\tc\common\dialogs\formtemplates_custom.xml
4、调用ITK的TcScript：Teamcenter8\web\htdocs\tc\common\actions\webitk_report.xml


关于国际化：
修改C:\Siemens\Teamcenter8\lang\textserver\zh_CN\weblocal_locale.xml
修改C:\Siemens\Teamcenter8\web_tier\staging1\webapp_root\teamcenter\dhtml\common\intl\cn\webstring.xml
删除%temp%\V8000.3.0.20100916.00文件夹，


关于服务器批处理警告：
开始 --> 运行 --> gpedit.msc (组策略) --> 用户配置 --> 管理模板 --> windows组件 --> 附件管理器 --> 右击 "中等危险文件类型的包含列表" --> 属性 --> 选 "已启用" --> 在 "指定中等危险扩展名" 里输入所要关闭警告的扩展名，例：.wsf --> 确定多个之间用分号隔开

