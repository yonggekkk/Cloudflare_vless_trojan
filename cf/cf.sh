#!/bin/bash
export LANG=en_US.UTF-8
case "$(uname -m)" in
	x86_64 | x64 | amd64 )
	cpu=amd64
	;;
	i386 | i686 )
        cpu=386
	;;
	armv8 | armv8l | arm64 | aarch64 )
        cpu=arm64
	;;
	armv7l )
        cpu=arm
	;;
        mips64le )
        cpu=mips64le
	;;
        mips64 )
        cpu=mips64
	;;
        mips )
        cpu=mipsle
	;;
        mipsle )
        cpu=mipsle
	;;
	* )
	echo "当前架构为$(uname -m)，暂不支持"
	exit
	;;
esac

result(){
awk -F ',' '$2 ~ /BGI|YCC|YVR|YWG|YHZ|YOW|YYZ|YUL|YXE|STI|SDQ|GUA|KIN|GDL|MEX|QRO|SJU|MGM|ANC|PHX|LAX|SMF|SAN|SFO|SJC|DEN|JAX|MIA|TLH|TPA|ATL|HNL|ORD|IND|BGR|BOS|DTW|MSP|MCI|STL|OMA|LAS|EWR|ABQ|BUF|CLT|RDU|CLE|CMH|OKC|PDX|PHL|PIT|FSD|MEM|BNA|AUS|DFW|IAH|MFE|SAT|SLC|IAD|ORF|RIC|SEA/ {print $0}' $ip.csv | sort -t ',' -k5,5n | head -n 3 > US-$ip.csv
awk -F ',' '$2 ~ /CGP|DAC|JSR|PBH|BWN|PNH|GUM|HKG|AMD|BLR|BBI|IXC|MAA|HYD|CNN|KNU|COK|CCU|BOM|NAG|DEL|PAT|DPS|CGK|JOG|FUK|OKA|KIX|NRT|ALA|NQZ|ICN|VTE|MFM|JHB|KUL|KCH|MLE|ULN|MDL|RGN|KTM|ISB|KHI|LHE|CGY|CEB|MNL|CRK|KJA|SVX|SIN|CMB|KHH|TPE|BKK|CNX|URT|TAS|DAD|HAN|SGN/ {print $0}' $ip.csv | sort -t ',' -k5,5n | head -n 3 > AS-$ip.csv
awk -F ',' '$2 ~ /TIA|VIE|MSQ|BRU|SOF|ZAG|LCA|PRG|CPH|TLL|HEL|BOD|LYS|MRS|CDG|TBS|TXL|DUS|FRA|HAM|MUC|STR|ATH|SKG|BUD|KEF|ORK|DUB|MXP|PMO|FCO|RIX|VNO|LUX|KIV|AMS|SKP|OSL|WAW|LIS|OTP|DME|LED|KLD|BEG|BTS|BCN|MAD|GOT|ARN|GVA|ZRH|IST|ADB|KBP|EDI|LHR|MAN/ {print $0}' $ip.csv | sort -t ',' -k5,5n | head -n 3 > EU-$ip.csv
}

#if timeout 3 ping -c 2 google.com &> /dev/null; then
#echo "当前网络已开代理，为确保准确性，请关闭代理"
#else
#echo "当前网络已关闭代理，继续进行……"
#fi

if timeout 3 ping -c 2 2400:3200::1 &> /dev/null; then
echo "当前网络支持IPV4+IPV6"
else
echo "当前网络仅支持IPV4"
fi
rm -rf 6.csv 4.csv
echo "甬哥Github项目  ：github.com/yonggekkk"
echo "甬哥Blogger博客 ：ygkkk.blogspot.com"
echo "甬哥YouTube频道 ：www.youtube.com/@ygkkk"
echo
echo "如果github被墙，请先通过代理运行一次，后续只用快捷运行：bash cf.sh"
echo
echo "请选择优选类型"
echo "1、仅IPV4优选"
echo "2、仅IPV6优选"
echo "3、IPV4+IPV6优选"
echo "4、重置配置文件"
echo "5、退出"
read -p "请选择【1-5】:" menu
if [ ! -e cf ]; then
curl -L -o cf -# --retry 2 --insecure https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/cf/$cpu
chmod +x cf
fi
if [ ! -e locations.json ]; then
curl -s -o locations.json https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/cf/locations.json
fi
if [ ! -e ips-v4.txt ]; then
curl -s -o ips-v4.txt https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/cf/ips-v4.txt
fi
if [ ! -e ips-v6.txt ]; then
curl -s -o ips-v6.txt https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/cf/ips-v6.txt
fi
if [ "$menu" = "1" ]; then
ip=4
./cf -ips 4 -outfile 4.csv
result
elif [ "$menu" = "2" ]; then
ip=6
./cf -ips 6 -outfile 6.csv
result
elif [ "$menu" = "3" ]; then
ip=4
./cf -ips 4 -outfile 4.csv
result
ip=6
./cf -ips 6 -outfile 6.csv
result
elif [ "$menu" = "4" ]; then
rm -rf 6.csv 4.csv locations.json ips-v4.txt ips-v6.txt cf cf.sh
echo "已重置成功" && exit
else
exit
fi
clear
if [ -e 4.csv ]; then
echo "IPV4最佳可用节点如下（取前三名）："
echo "美国IPV4优选结果："
cat US-4.csv
echo
echo "亚洲IPV4优选结果："
cat AS-4.csv
echo
echo "欧洲IPV4优选结果："
cat EU-4.csv
fi
if [ -e 6.csv ]; then
echo "IPV6最佳可用节点如下（取前三名）："
echo "美国IPV6优选结果："
cat US-6.csv
echo
echo "亚洲IPV6优选结果："
cat AS-6.csv
echo
echo "欧洲IPV6优选结果："
cat EU-6.csv
fi
if [ ! -e 4.csv ] && [ ! -e 6.csv ]; then
echo "运行出错，请检查网络依赖环境"
fi
