# vmake

> WIP, because I'm busy for now :).

A building system for projects made with the V language (WIP).

## Installation

> Very soon the process will be accomplished with a `vmake .`

```bash
git clone https://github.com/StunxFS/vmake
cd vmake
v -prod cmd/ -o vmake
./vmake setup
```

## Example

```v
// build.vsh | run with: vmake .
import stunxfs.vmake

vmake.require_v('latest')
vmake.require_vmake('latest')

mod := 'stunxfs.fakemod'
if !vmake.user_has_mod(mod) {
    vmake.user_install_mod(mod)
}

vmake.run_v(vmake.get_build_mod(), '-o', vmake.exe_name('vmake'))
```
