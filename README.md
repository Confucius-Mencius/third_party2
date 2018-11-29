# third_party
third party libraries used in Linux server programming

verified in CentOS7/LinuxMint18/Ubuntu16.04 and above

Linux c++服务器开发用到的一些第三方库，包括：boost、openssl、libevent、gflags、gtest等，集中管理这些库的版本更新、编译安装、依赖关系等。目的是提供一套统一的第三方库，开发者不用关心具体是怎么编译的，库之间有什么依赖等。

在一台机器上编译安装好后，开发机操作系统环境相同时，只需要mount即可，不需要每个开发人员都再编译一遍。

## archives目录

第三方库源码压缩包。

## build目录

编译、安装脚本。

脚本执行顺序：
1. sys_prepare.sh
2. unzip_all.sh # 可重复执行
3. build_base_tools.sh # 编译、安装系统工具，一般执行一次即可
4. build_third_parties.sh　# 编译、安装第三方库，可重复执行，也可以单独执行一个脚本，如；build_gflags.sh
6. pack_all.sh [可选]

## cmake目录

common_define.cmake是根据conf自动生成的cmake文件，third_party.cmake是公共的cmake文件。

## conf目录

third_party.csv: 第三方库版本配置文件。将第三方库写在csv文件中，脚本处理这个文件生成cmake、shell、makefile公共文件。


当第三方库有版本更新时，修改csv文件中的条目，然后运行"main.sh /opt/third_party"。注意：如果install prefix不是/opt/third_party，还需要运行replace_install_prefix.sh脚本。

添加第三方库时，也需要运行"main.sh /opt/third_party"。然后在build目录下增加一个build_xxx.sh脚本，在build_third_parties.sh文件中增加一个条目。

除紧急bug外，每年的4月和10月例行更新第三方库的版本。

## doc目录

## patch目录

对第三方库的一些修改。

当需要修改一些库的代码时，将修改好的代码放在这个目录中，编译之前脚本会从这个目录拷贝到源码目录。
