## mount/umount drives. Монтирование флешки ventoy 
sudo mount -t exfat /dev/sdd1 ~/ventoy -o uid=vl,gid=vl,fmask=0111,dmask=0
# Список всех дисков / Disk drive list
lsblk
# Узнать/Посмотреть UUID для диска
sudo blkid /dev/sdd1
# Размонтировать диск
sudo umount ~/ventoy



