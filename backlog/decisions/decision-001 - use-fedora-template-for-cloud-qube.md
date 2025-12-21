---
id: decision-001
title: use fedora template for cloud qube
date: '2025-12-20 20:32'
status: proposed
---
## Context

Overall design principle behind my qubes os system is to use as many
distro-native packages as possible to limit maintenance hell. Therefore, a
distribution that supports my required toolset better needs to be the one of
choice.

Options:
*   fedora 42
*   debian 13

Native Package Coverage
Debian 13 provides strong native support for core tools but requires more manual installs or snaps for others.

| Tool                 | Debian 13 Native?                  | Fedora 42 Native?                         |
| -------------------- | ---------------------------------- | ----------------------------------------- |
| kubectl              | Yes (pkgs.k8s.io repo) idroot+1​   | Yes (kubernetes-client) idroot+1​         |
| aws-cli              | Yes packages.debian​               | Yes                                       |
| kubectx (+kubens)    | Yes debian-kubernetes+1​           | COPR repo copr.fedorainfracloud+1​        |
| kubecolor            | Yes packages.debian​               | Likely COPR/manual                        |
| helm                 | Yes (apt)                          | Yes (dnf)                                 |
| argocd cli           | Manual (GitHub release) solo​      | Manual (GitHub release)                   |
| cilium cli           | Manual (tar.gz) github+1​          | Manual (tar.gz) discussion.fedoraproject​ |
| hubble cli           | Manual (tar.gz) notes.kodekloud+1​ | Manual (tar.gz)                           |
| cloud-nuke           | Manual (Go install)                | Manual (Go install)                       |
| k9s                  | Manual (GitHub release) k9scli​    | COPR copr.fedorainfracloud​               |
| sys-ssh-agent-client | Manual (custom)                    | Manual (custom)                           |

Qubes workflow favors Fedora templates for native dnf/COPR over Debian's apt/snap mix.

## Decision

Fedora 42 better fulfills the requirements for native Linux package installations of your listed tools on a Qubes OS cloud qube, as it offers broader Kubernetes ecosystem support through official repos and COPR, minimizing manual downloads.



## Consequences
