# openwrt-udpgame

测试环境依赖:
- https://github.com/coolsnowwolf/lede

编译方法:

    cd lede
    echo 'src-git-full xepher https://github.com/xepher/openwrt-udpgame.git'>>feeds.conf.default
    rm -rf tmp/
    
    ./scripts/feeds update -a
    ./scripts/feeds install -a -p xepher

    make menuconfig

参考Repos:
- https://github.com/cutepan/openwrt-udp2raw-speeder
- https://github.com/muziling/tinyfecVPN-openwrt