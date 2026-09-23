#!/usr/bin/env bash

set -u

DATE=$(date +%Y%m%d-%H%M%S)
OUT="docs/evidence/host/host-inventory-${DATE}.txt"

mkdir -p "$(dirname "$OUT")"

exec > >(tee "$OUT") 2>&1

echo "============================================================"
echo " OPENSHIFT HOMELAB - KVM HOST INVENTORY"
echo "============================================================"
echo
echo "Date: $(date)"
echo

echo "===== HOSTNAME ====="
hostnamectl
echo

echo "===== OPERATING SYSTEM ====="
cat /etc/os-release
echo

echo "===== KERNEL ====="
uname -a
echo

echo "===== CPU ====="
lscpu
echo

echo "===== HARDWARE VIRTUALIZATION ====="
echo "vmx/svm flags:"
grep -Eoc '(vmx|svm)' /proc/cpuinfo
echo

echo "===== KVM MODULES ====="
lsmod | grep -E '^kvm' || true
echo

echo "===== NESTED VIRTUALIZATION ====="

if [ -f /sys/module/kvm_intel/parameters/nested ]; then
    echo -n "Intel nested: "
    cat /sys/module/kvm_intel/parameters/nested
fi

if [ -f /sys/module/kvm_amd/parameters/nested ]; then
    echo -n "AMD nested: "
    cat /sys/module/kvm_amd/parameters/nested
fi

echo
echo "===== MEMORY ====="
free -h
echo

echo "===== BLOCK DEVICES ====="
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
echo

echo "===== FILESYSTEMS ====="
df -hT
echo

echo "===== LVM PHYSICAL VOLUMES ====="
sudo pvs || true
echo

echo "===== LVM VOLUME GROUPS ====="
sudo vgs || true
echo

echo "===== LVM LOGICAL VOLUMES ====="
sudo lvs || true
echo

echo "===== NETWORK INTERFACES ====="
ip -br address
echo

echo "===== ROUTING ====="
ip route
echo

echo "===== NETWORKMANAGER CONNECTIONS ====="
nmcli connection show
echo

echo "===== LIBVIRT VERSION ====="
virsh version
echo

echo "===== LIBVIRT DOMAINS ====="
virsh list --all
echo

echo "===== LIBVIRT NETWORKS ====="
virsh net-list --all
echo

echo "===== LIBVIRT STORAGE POOLS ====="
virsh pool-list --all
echo

echo "============================================================"
echo " INVENTORY COMPLETE"
echo "============================================================"
echo
echo "Evidence file:"
echo "$OUT"
