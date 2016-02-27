#!/bin/bash

if [ "$(whoami)" != "root" ]; then
	echo "this must be run as root"
	exit 1
fi
echo "##==>> fast-vm setup script"

if [ -f "/usr/local/sbin/fast-vm" ]; then
	echo "[??] File /usr/local/sbin/fast-vm already present, do you want to just update fast-vm without running configuration? [yes] "
	read just_upgrade

	if [ -z "$just_upgrade" ] || [ "$just_updagrade" == "yes" ]; then
		echo "[info] setup will only update fast-vm scripts and then exit without reconfiguration"
	fi
fi
echo "copying fast-vm into /usr/local/sbin/fast-vm"
cp fast-vm /usr/local/sbin

bash_completion_dir=$(pkg-config --variable=completionsdir bash-completion 2>/dev/null|head -1)
if [ -d "$bash_completion_dir" ]; then
	cp fast-vm.bash_completion $bash_completion_dir/fast-vm
fi

echo "## checking for requirements"
cmds="lvcreate lvconvert gunzip virsh virt-edit"

for i in $cmds
do
	which "$i" >/dev/null 2>&1
	if [ ! "$?" -eq "0" ];
	then
		echo "command $i not found, please install it before continuing"
		exit 1
	fi
done

if [ -z "$just_upgrade" ] || [ "$just_updagrade" == "yes" ]; then
	echo "[info] Update complete"
	exit 0
fi

echo "## running configuration scripts for initial setup"
. setup-general.sh
. setup-thin-lvm.sh
. setup-libvirt-net.sh
