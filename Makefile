bindir=/usr/bin
sbindir=/usr/sbin
datadir=/usr/share
libexecdir=/usr/libexec
libdir=/usr/lib
sysconfdir=/etc

install:
	mkdir -p ${DESTDIR}/${bindir}
	install -pm 755 fast-vm ${DESTDIR}/${bindir}/
	install -pm 755 fast-vm-image ${DESTDIR}/${bindir}/
	install -pm 755 fast-vm-net-cleanup ${DESTDIR}/${bindir}/
	mkdir -p ${DESTDIR}/${sbindir}
	install -pm 755 configure-fast-vm ${DESTDIR}/${sbindir}/
	mkdir -p ${DESTDIR}/${libexecdir}
	install -pm 744 fast-vm-helper.sh ${DESTDIR}/${libexecdir}/
	mkdir -p ${DESTDIR}/${datadir}/fast-vm
	install -pm 644 fast-vm-network.xml ${DESTDIR}/${datadir}/fast-vm/
	install -pm 644 fast-vm.conf.defaults ${DESTDIR}/${datadir}/fast-vm/
	mkdir -p ${DESTDIR}/${sysconfdir}/sudoers.d/
	install -pm 440 fast-vm-sudoers ${DESTDIR}/${sysconfdir}/sudoers.d/
	mkdir -p ${DESTDIR}/${datadir}/bash-completion/completions
	install -pm 644 fast-vm.bash_completion ${DESTDIR}/${datadir}/bash-completion/completions/fast-vm
	install -pm 644 fast-vm-image.bash_completion ${DESTDIR}/${datadir}/bash-completion/completions/fast-vm-image
	mkdir -p ${DESTDIR}/${datadir}/man/man8
	install -pm 644 man/fast-vm.8 ${DESTDIR}/${datadir}/man/man8/
	install -pm 644 man/fast-vm-image.8 ${DESTDIR}/${datadir}/man/man8/
	install -pm 644 man/fast-vm-list.8 ${DESTDIR}/${datadir}/man/man8/
	install -pm 644 man/configure-fast-vm.8 ${DESTDIR}/${datadir}/man/man8/
	install -pm 644 man/fast-vm-net-cleanup.8 ${DESTDIR}/${datadir}/man/man8/
	mkdir -p ${DESTDIR}/${datadir}/man/man5
	install -pm 644 man/fast-vm.conf.5 ${DESTDIR}/${datadir}/man/man5/
	mkdir -p ${DESTDIR}/${libdir}/systemd/system
	install -pm 644 fast-vm-loop-device.service ${DESTDIR}/${libdir}/systemd/system/
