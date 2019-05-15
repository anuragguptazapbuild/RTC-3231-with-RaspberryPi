# Equipment required
# Raspberry Pi And RTC 
#connect the RTC to to RaspiberryPi


#Configuring the Raspberry Pi for I2C

sudo raspi-config

#Enable the I2C inerfacing
# reboot the system
sudo reboot

#install python-smbus and i2c-tools

sudo apt-get install python-smbus i2c-tools
#chech for Status
sudo i2cdetect -y 1

#Setting up the Raspberry Pi RTC Time

#edit the following file
sudo nano  /boot/config.txt 

#enter this  at end of the file 

dtoverlay=i2c-rtc,ds3231


#again reboot
sudo reboot

#Check for rtc Configuration

sudo i2cdetect -y 1

#Remove  fake hwclock

sudo apt-get -y remove fake-hwclock

#set the new hwclock by editing the following file

sudo nano /lib/udev/hwclock-set


#if [ -e /run/systemd/system ] ; then
#    exit 0
#fi

#Syncing time from the Pi to the RTC module

# now read direct time from RtC

sudo hwclock -D -r

#CHECK FOR SYSTEM DATE

date

#write system time into RTC

sudo hwclock -w

#read time from RTC

sudo hwclock -r

# now shutdown the system and wait for some time disconnect the net

#again set or write time from RTC to system

sudo hwclock -s

#now read the time

date;sudo hwclock -r


















