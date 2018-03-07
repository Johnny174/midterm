#!/bin/bash
# My script

echo "Hello World!"
read -p "Hi, how are you? " x
read -p "How is the midterm? " x
read -p "Are you looking forward to the weekend? " x
echo "Thank you for the response."
END
echo "Now we're gonna check the devices in /dv"
cd /dev
ls -l

echo "/dev/null is a device that you can place where you send it"
echo "Hello World" > /dev/null
echo "Use the blkid -k command to list the filesystem files"
blkid -k

echo "The lsblk -a command will list all devices"
lsblk -a

echo "Search /sys for sd and pipe into the less command"
find /sys | grep sd | less

echo "Search in /dev and /dev/mapper"
ls -l /dev /dev/mapper | grep '^b'

echo "List the partitions"
cat /proc/partitions

echo "Now test dd by to a new file from /dev/zero"
cd /tmp
pwd
dd if=/dev/zero of=./empty.file bs=1M count=1
hexdump empty.file

dmesg | grep sd

*Press space bar to go down to look at more descriptions
*Press q to quit or end

echo "Look at partiton table"
man udevadm
echo "Look at indivdual partitions"
fdisk -1 /dev/sda

*Press space bar to go down to look at more descriptions
*Press q to quit or end

echo "Creating a 32MB with the dd command"
dd if=/dev/zero of=./32MB.img bs=1M count=32
if=/dev/zero read /dev/zero as an input file
of=./32/MB.img writes to 32MB.img in current directory(./)
bs=1M means to write with a 1 MegaByte block size
count=32 means to write 32 blocks

echo "Look at what was created and now  put a filesystem onto it"
hexdump ./32/MB.img | less

echo "Now writing ext4 filesystem using the mkfs command"
mkfs -t ext ./32MB.img
-t ext4 is the flag to specify the ext4 type of filesystem
./32MB.img is a reference to your file that you just created with dd

echo "Other filessystems and command shortcuts"
ls -l /sbin/mkfs.*

echo "Now has a filesystem in a image. Make a mount point and mount it"
mkdir /mnt/tmp
sudo mount ./32MB.img /mnt/tmp
mount; df -h
lsblk

echo "Put a Hello World file in there"
cd /tmp/tmp; ls
echo "Hello World" > ./hello.txt

echo "Unmounting the image"
sudo umount /mnt/tmp

echo "Look at file with hexdump with canonical option to show us hex and ASCH"
hexdump --canonical ./32MB.img | less

echo "pipe it to less so you can page through the outpost"
/dev (devfs)
/proc (proc filesystem)
/sys (sysfs)
/run (tmpfs)

echo "Swap space for memory"
free
dd if=/dev/zero of=./16MB.swap bs=1M count=16
mkswap ./16MB.swap
sudo chmod 0600 16MB.swap; sudo chown root 16MB.swap
swapon ./16MB.swap
swapon -s

echo "Make directories and  files within those direstories ans make a like"
mkdir dir_1 dir_2
echo "a" > dir_1/file_1
echo "b" > dir_1/file_2
echo "c" > dir_1/file_3
echo "d" > dir_2/file_4
ln dir_1/file_3 dir_2/file_5

echo "Now looking at inode IDs"
ls -iR dir_*

echo "Analyze the Kernal Boot Parameters"
cat /proc/cmdline

echo "Reboot into your USB or VM"
cd /boo; ls; cd grub
les grub.cfg

echo "Open the manual page for grub-mkconfig"
man grub-mkconfig
grub-mkconfig -o /boot/grub/grub.cfg

echo "Open the manual page for grub-install"
man grub-mkconfig
grub-install /dev/sda

echo "Have terminal open and run who -r"

echo "Find init system"
ls /user/lib/sysrmed /etc/systemd
ls /ect/init
ls /ect/inittab

echo "List of systemctl list-units, run sudo systemctl list-units"
echo "Sysremd configuration location"
sudo system -p UnitPath show

echo "Have terminal open and run sudo systemctl list-dependencies"

echo "Identifying boot slowners, failed processes and warnings"
sudo systemd-analyze critical-chain

echo "Dynamic device managemant"
man systemd-udevd.service
man udev

echo "Unit files sre equivalent to .ini files in Microsoftese"
cd /user/lib/systemd/; ls
cd system; ls | less

systemctl status sshd.service

echo "Enable sshd.service"
systemctl enable sshd.service

echo "Check journal/log entries for sshd.service"
journalctl _SYSTEMD_UNIT=sshd.service
echo "Look at the rest of the log"
journalctl -xfe

echo "Shutting down a system is an invocations of init follwed by a halt (-h)"
shutdown -h now
init 0

echo "Reboot"
reboot rund shutdown -r now

echo "In boot process, each system loads an initrd file"
$ mkdir /tmp/initrd
$ cd /tmp/initrd
$ zcat /boot/initrd.img[tab] | cpio -i --no-absolute-filenames

END
