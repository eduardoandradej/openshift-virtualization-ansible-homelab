# OpenShift Container Platform 4.22 + OpenShift Virtualization + Ansible Automation Platform (AAP)

Proof of Concept and hands-on laboratory for studying, deploying,
automating and operating Red Hat OpenShift technologies.

## Technology baseline

- OpenShift Container Platform 4.22
- OpenShift Virtualization
- Red Hat CoreOS
- Ansible
- KVM / libvirt
- Linux
- HAProxy
- DNS
- Git

## Architecture

The physical HomeLab KVM server provides the virtualization layer used
to host the OpenShift cluster nodes.

OpenShift Virtualization will subsequently provide virtual machines
inside the OpenShift cluster.

## Methodology

Install → Validate → Automate → Document → Reproduce

## Current Phase

### Phase 0 - KVM Host Assessment

Status: In progress

Objectives:

- Inventory physical resources
- Validate CPU virtualization extensions
- Validate nested virtualization
- Inventory RAM and storage
- Inventory networking
- Validate KVM/libvirt
- Define OpenShift cluster sizing

## Repository Structure

- `01-kvm-host`: KVM host configuration and validation
- `02-ansible`: Infrastructure automation
- `03-infrastructure`: DNS and load balancing
- `04-openshift-install`: OpenShift installation
- `05-openshift-platform`: Cluster configuration
- `06-openshift-virtualization`: OpenShift Virtualization
- `07-labs`: Hands-on scenarios
- `08-troubleshooting`: Problems, diagnostics and solutions
