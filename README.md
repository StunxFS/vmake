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
import stunxfs.vmake {
	require_v, require_vmake, user_has_mod, user_install_mod, run_v,
	get_build_mode, exe_name
}

require_v('latest')
require_vmake('latest')

mod := 'stunxfs.fakemod'
if !user_has_mod(mod) {
    user_install_mod(mod)
}

run_v(get_build_mode(), '-o', exe_name('vmake'))
```
