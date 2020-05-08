#!/bin/bash
DOCUMENTPATH=$HOME/Documents/tongue

#UBUNTU DOCUMENTATION
#20.04 (LTS)
wget -c -N -r --no-parent -t 1 https://assets.ubuntu.com/v1/59989c24-ubuntu-server-guide.pdf --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -t 1 https://help.ubuntu.com/lts/installation-guide/amd64/install.en.pdf --directory-prefix $DOCUMENTPATH
#18.04
wget -c -N -r --no-parent -t 1 https://help.ubuntu.com/18.04/serverguide/serverguide.pdf --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -t 1 https://help.ubuntu.com/18.04/installation-guide/amd64/install.en.pdf --directory-prefix $DOCUMENTPATH
#16.04
wget -c -N -r --no-parent -t 1 https://help.ubuntu.com/16.04/serverguide/serverguide.pdf--directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -t 1 https://help.ubuntu.com/16.04/installation-guide/amd64/install.en.pdf --directory-prefix $DOCUMENTPATH
#CLOUD-INIT
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://cloudinit.readthedocs.io/en/latest/ --directory-prefix $DOCUMENTPATH

#KUBERNETES DOCUMENTATION
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://kubernetes.io/docs/setup/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://kubernetes.io/docs/concepts/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://kubernetes.io/docs/tasks/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://kubernetes.io/docs/tutorials/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://kubernetes.io/docs/reference/ --directory-prefix $DOCUMENTPATH

#LINUX KERNEL DOCUMENTATION
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.kernel.org/doc/html/latest/ --directory-prefix $DOCUMENTPATH

#LINUX MODULE DATABASE
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://cateee.net/lkddb/web-lkddb/ --directory-prefix $DOCUMENTPATH

#LINUX MAN PAGES
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 http://man7.org/linux/man-pages/dir_section_1.html --directory-prefix $DOCUMENTPATH

#SYSTEMD DOCUMENTATION
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/software/systemd/man/ --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/TipsAndTricks/ --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/FrequentlyAskedQuestions/ --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/Debugging/ --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/Incompatibilities --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/DaemonSocketActivation --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems --directory-prefix $DOCUMENTPATH
#wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget --directory-prefix $DOCUMENTPATH

#CEPH DOCUMENTATION
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.ceph.com/docs/master/radosgw --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.ceph.com/docs/master/rbd --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.ceph.com/docs/master/cephfs --directory-prefix $DOCUMENTPATH

#SYSTEMD DOCUMENTATION
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://systemd.io --directory-prefix $DOCUMENTPATH

#OPENSTACK
#Rocky
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/rocky/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/rocky/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/rocky/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/rocky/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/rocky/configuration/ --directory-prefix $DOCUMENTPATH
#Queens
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/queens/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/queens/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/queens/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/queens/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/queens/configuration/ --directory-prefix $DOCUMENTPATH
#Stein
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/stein/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/stein/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/stein/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/stein/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/stein/configuration/ --directory-prefix $DOCUMENTPATH
#Train
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/train/install/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/train/admin/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/train/user/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/glance/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/ironic/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/cinder/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/nova/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/horizon/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/keystone/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/neutron/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/swift/train/configuration/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/heat/train/configuration/ --directory-prefix $DOCUMENTPATH
#Generic guides
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/install-guide/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg,svg -t 1 https://docs.openstack.org/arch-design/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/operations-guide/ --directory-prefix $DOCUMENTPATH
wget -c -N -r --no-parent -A html,png,css,jpg,jpeg,svg -t 1 https://docs.openstack.org/security-guide/ --directory-prefix $DOCUMENTPATH
