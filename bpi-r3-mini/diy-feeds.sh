#!/bin/bash

# 添加自定义源
# echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default
# echo 'src-git small https://github.com/kenzok8/small' >> .feeds.conf.default
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# 解决冲突
#rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
#rm -rf feeds/packages/utils/v2dat
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang


# 更新包
./scripts/feeds update -a
# 安装包
./scripts/feeds install -a 

# 添加自定义源，此包为5G模组,强制使用该源的驱动
echo >> feeds.conf.default
echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default

./scripts/feeds update qmodem

./scripts/feeds install -a -f -p qmodem


