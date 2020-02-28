# openwrt-udpgame

测试环境依赖:
- https://github.com/coolsnowwolf/lede

编译方法:

    cd lede
    echo 'src-git-full lienol https://github.com/xepher/openwrt-udpgame'>>feeds.conf.default
    rm -rf tmp/
    
    ./scripts/feeds update -a
    ./scripts/feeds install -a -p lienol

    make menuconfig

参考Repos:
- https://github.com/cutepan/openwrt-udp2raw-speeder
- https://github.com/muziling/tinyfecVPN-openwrt