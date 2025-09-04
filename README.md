# aap.platform_on_ocp collection

This repository contains the `aap.platform_on_ocp` Ansible Collection.

This is an Ansible Collection that helps create, deploy, and manage Kubernetes resources for Red Hat Ansible Automation Platform (AAP) Operator deployments on OpenShift Container Platform (OCP).

## Core Components

### Roles
- **generate_kubemanifests**: Templates Kubernetes manifest files for AAP Operator installation
- **manage_kubemanifests**: Manages (create/apply/delete) the generated Kubernetes manifests

### Directory Structure
- `inventory/`: Example inventory with host_vars for different environments (dev/prod/25)
- `kubemanifests/`: Generated Kubernetes manifests organized by environment
- `playbooks/`: Example playbooks demonstrating role usage
- `roles/`: The two main roles with their templates and tasks

## Common Commands

### Development and Testing
```bash
# Run example playbook to generate manifests
ansible-playbook -i inventory/hosts.ini playbooks/generate_kubemanifests.yml

# Run example playbook to manage manifests
ansible-playbook -i inventory/hosts.ini playbooks/manage_kubemanifests.yml

# Use ansible-navigator (configured for execution environment)
ansible-navigator run playbooks/generate_kubemanifests.yml
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

### Environment Structure
Each host (e.g., `canonical.example.com`) has:
- Host variables in `inventory/host_vars/`
- Generated manifests in `kubemanifests/{hostname}/generated/`
- Generated manifests are organized into `operatorgroups`, `subscriptions`, `crs`, `secrets`, `configmaps`, and `pvcs` subdirectories

## Licensing

GNU General Public License v3.0 or later.

See [LICENSE](https://www.gnu.org/licenses/gpl-3.0.txt) to see the full text.
