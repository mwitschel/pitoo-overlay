#!/bin/bash

date=$(date +%Y%m%d)

dirs="package.use package.mask package.keywords package.unmask package.license sets"

cp -v /etc/portage/make.conf /usr/pitoo/overlay/sys-apps/pitoo-base/files/make.conf.$date
cp -v /etc/portage/make.conf.buildsys /usr/pitoo/overlay/sys-apps/pitoo-base/files/make.conf.buildsys.$date
cp -v /etc/portage/make.conf.binsys /usr/pitoo/overlay/sys-apps/pitoo-base/files/make.conf.binsys.$date

for dir in $dirs
do
	cp -rav /etc/portage/$dir /usr/pitoo/overlay/sys-apps/pitoo-base/files/$dir.$date
done

cp -rav /usr/pitoo/overlay/sys-apps/pitoo-base/files/pitoo-base.ebuild /usr/pitoo/overlay/sys-apps/pitoo-base/pitoo-base-$date.ebuild

ebuild /usr/pitoo/overlay/sys-apps/pitoo-base/pitoo-base-$date.ebuild digest
