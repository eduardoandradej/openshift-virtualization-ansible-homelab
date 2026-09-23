# ADR-002: HomeLab Operational Decisions

## Status

Accepted

## Date

2026-09-22

## Context

This environment is a personal HomeLab designed for study,
experimentation and Proof of Concept activities.

The primary objectives are:

- OpenShift Container Platform 4.22
- OpenShift Virtualization
- Ansible automation
- KVM/libvirt
- Reproducible technical documentation

The environment is not intended for production workloads.

## Network Decision

The current KVM host network configuration will be preserved.

Current addresses:

- KVM management interface: 192.168.10.25
- br-ex: 192.168.10.40
- Network: 192.168.10.0/24
- Gateway: 192.168.10.1

Although multiple routes and addresses exist on the same network,
the current configuration is functional and will not be redesigned
for this Proof of Concept.

## SELinux Decision

SELinux will remain disabled in this laboratory environment.

This is a deliberate simplification for the HomeLab and must not be
interpreted as a recommendation for production environments.

A production OpenShift/KVM architecture should follow the applicable
Red Hat security and support requirements.

## Storage Decision

The existing libvirt storage pools will be preserved:

- ocp-fast
- ocp-data

The laboratory will use the existing host storage layout without
additional restructuring unless a technical problem requires it.

## Principle

For this Proof of Concept:

Working configuration > unnecessary infrastructure redesign.

Changes to the physical KVM host will only be introduced when required
to deploy or operate the OpenShift laboratory.
