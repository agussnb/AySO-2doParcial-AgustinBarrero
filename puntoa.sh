#Creo particiones, volumenes logicos, grupos, formateo y monto.
fdisk /dev/sdb
exit
fdisk /dev/sdb
swapon
free -h
cat /proc/swaps
swapon -s
wipefs -a /dev/sdb2
pvcreate /dev/sdb2 /dev/sdb3 /dev/sdb5 /dev/sdb6
pvs 
vgcreate vgAdmin /dev/sdb2 /dev/sdb3
vgcreate vgDevelopers /dev/sdb5 /dev/sdb6
vgs
lvcreate -L 1G vgDevelopers -n lvDevelopers
lvcreate -L 1G vgDevelopers -n lvTesters
lvcreate -L 1G vgDevelopers -n lvDevops
lvcreate -L 2G vgAdmin -n lvAdmin
lvs
lsblk
mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
mkdir mnt
cd /mnt
mkdir lvDevelopers
mkdir lvDevops
mkdir lvAdmin
mount /dev/mapper/vgDevelopers-lvDevelopers /home/2doParcial/mnt/lvDevelopers
mount /dev/mapper/vgDevelopers-lvTesters /home/2doParcial/mnt/lvTesters
mount /dev/mapper/vgDevelopers-lvDevops /home/2doParcial/mnt/lvDevops
mount /dev/mapper/vgAdmin-lvAdmin /home/2doParcial/mnt/lvAdmin

