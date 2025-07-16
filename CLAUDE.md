# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Ansible Collection (`aap.platform_on_ocp`) that helps create, deploy, and manage Kubernetes resources for Red Hat Ansible Automation Platform (AAP) Operator deployments on OpenShift Container Platform (OCP).

## Core Components

### Roles
- **generate_kubemanifests**: Templates Kubernetes manifest files for AAP Operator installation
- **manage_kubemanifests**: Manages (create/apply/delete) the generated Kubernetes manifests

### Directory Structure
- `inventory/`: Example inventory with host_vars for different environments (dev/prod/25)
- `kubemanifests/`: Generated Kubernetes manifests organized by environment
- `playbooks/`: Example playbooks demonstrating role usage
- `roles/`: The two main roles with their templates and tasks
- `plugins/`: Custom Ansible plugins (action, filter, lookup, modules, etc.)

## Common Commands

### Development and Testing
```bash
# Run example playbook to generate manifests
ansible-playbook -i inventory/hosts.ini playbooks/generate_kubemanifests.yml

# Run example playbook to manage manifests
ansible-playbook -i inventory/hosts.ini playbooks/manage_kubemanifests.yml

# Use ansible-navigator (configured for execution environment)
ansible-navigator run playbooks/generate_kubemanifests.yml

# Run tests
pytest tests/
pytest tests/unit/
pytest tests/integration/

# Run molecule tests
molecule test -s integration_hello_world
```

### Collection Management
```bash
# Build collection
ansible-galaxy collection build

# Install locally for testing
ansible-galaxy collection install aap-platform_on_ocp-*.tar.gz --force
```

## Architecture

The collection follows the standard workflow:
1. Define environment-specific variables in `inventory/host_vars/`
2. Use `generate_kubemanifests` role to template Kubernetes resources
3. Use `manage_kubemanifests` role to apply/manage those resources on OpenShift

### Key Configuration Files
- `ansible-navigator.yml`: Execution environment configuration using Red Hat AAP 2.5 EE
- `galaxy.yml`: Collection metadata and dependencies
- `pyproject.toml`: Python tooling configuration (black, pytest)
- `tox-ansible.ini`: Ansible version compatibility matrix

### Environment Structure
Each environment (e.g., `aap-24-dev.example.com`) has:
- Host variables in `inventory/host_vars/`
- Generated manifests in `kubemanifests/{hostname}/generated/`
- Organized into `crs/`, `secrets/`, and `configmaps/` subdirectories

## Development Notes

- Uses execution environment: `registry.redhat.io/ansible-automation-platform-25/ee-supported-rhel8:latest`
- Python formatting with black (line length 100)
- Test configuration supports parallel execution with pytest
- Collection namespace: `aap.platform_on_ocp`