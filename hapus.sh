#!/bin/bash
green="\e[38;5;82m"
red="\e[38;5;196m"
NC="\033[0m"
orange="\e[38;5;130m"
blue="\e[38;5;39m"
yellow="\033[1;93m"
purple="\e[38;5;141m"
bold_white="\e[1;37m"
reset="\e[0m"
white="\033[1;97m"
pink="\e[38;5;205m"

hapus_bot_lama() {
    echo -e "${orange}Menghapus bot lama...${NC}"
    systemctl stop cvpn.service 2>/dev/null
    systemctl disable cvpn.service 2>/dev/null
    rm -f /etc/systemd/system/cvpn.service
    rm -f /usr/bin/cvpn /usr/bin/server_cvpn /etc/cron.d/server_cvpn
    rm -rf /root/yiwei
    rm -rf /root/yiwei

    # Hapus dari pm2 jika ada
    if command -v pm2 &> /dev/null; then
        pm2 delete cvpn &> /dev/null
        pm2 save &> /dev/null
    fi

    systemctl daemon-reload
    echo -e "${green}Bot lama berhasil dihapus.${NC}"
}

hapus_bot_lama
