# iperf

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Limitations - OS compatibility, etc.](#limitations)
4. [Development - Guide for contributing to the module](#development)

## Overview

This module installs [Iperf](https://iperf.fr/) and configures it to run as a daemon.

It installs Iperf 3 from distro repos but sets it to listen on TCP port 5001, which is
the default for Iperf 2. This is because many Iperf clients distributed are version 2.
If anyone raises an issue, I'll add support for customising the listen port.

## Usage

This module is simple to use. The only parameter is to enable to disable automatic
firewall rules.

```puppet
class { 'iperf':
  firewall => true,
}
```

### `firewall`
Open the firewall port automatically. Default: `false`

### `restart`
Periodically restart iperf2 via cron, since it has a bug where it consumes 100% CPU.
Default: `false`

### `version`
Specify an array of versions you wish to install. Multiple versions are OK. Available
options: `2`, `3`.


## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.
