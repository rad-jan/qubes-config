{#
SPDX-FileCopyrightText: 2023 - 2025 wassp <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - dev.install-common

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking # adds internet connectivity
      - qubes-core-agent-passwordless-root # adds internet connectivity
      - kubernetes1.34-client
      - k9s
      - helm
      - git
      - valkey # drop-in replacement for redis-cli

{% endif -%}
