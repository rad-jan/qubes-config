{#
SPDX-FileCopyrightText: 2023 - 2025 wassp <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - dev.install-common
  - dev.install-python-tools

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking # adds internet connectivity
      - kubectx # Installs kubens as well
      - helm
      - mise

{% endif -%}
