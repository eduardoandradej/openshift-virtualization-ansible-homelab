# ADR-001: OpenShift Cluster Topology

## Status

Accepted

## Date

2026-09-22

## Context

The physical HomeLab host currently provides:

- AMD FX-8300 processor
- 8 logical CPUs
- 30 GiB RAM
- AMD-V enabled
- Nested virtualization enabled
- Rocky Linux 9.4
- KVM/libvirt
- SSD storage for the OpenShift system disk
- HDD storage for laboratory VM workloads

The objective is to build a reproducible Proof of Concept using:

- OpenShift Container Platform 4.22
- OpenShift Virtualization
- Ansible
- KVM/libvirt
- Red Hat CoreOS

## Decision

The initial OpenShift 4.22 deployment will use Single Node OpenShift (SNO).

The node will provide both:

- Control Plane
- Compute

Initial target sizing:

- 6 vCPU
- 20-22 GiB RAM
- 120-130 GiB system disk on SSD
- Additional storage for virtual machine workloads on HDD

## Rationale

A traditional three-control-plane cluster exceeds the physical memory
available on the current HomeLab server.

Single Node OpenShift allows the full OpenShift control plane and compute
functionality to be studied using the available hardware.

OpenShift Virtualization will subsequently be installed on the SNO cluster.

## Limitations

This environment is a laboratory and Proof of Concept.

The OpenShift cluster itself runs as a virtual machine on KVM and
OpenShift Virtualization therefore uses nested virtualization.

The environment is not intended to represent a supported production
OpenShift Virtualization deployment.

Single Node OpenShift does not provide:

- Control plane high availability
- OpenShift Virtualization high availability
- Live migration between OpenShift nodes

## Future Architecture

A future environment with additional physical servers can evolve to:

- 3 control plane nodes
- 3 or more worker nodes
- Shared RWX storage
- OpenShift Virtualization high availability
- Live migration
