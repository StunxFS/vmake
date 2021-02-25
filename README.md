# vmake

> WIP, because I'm busy for now :).

A building system for projects made with the V language (WIP).

## Installation

```bash
v install stunxfs.vmake
```

## Example

```v
// build.vsh | run with: v run build.vsh
import stunxfs.vmake

mut b := vmake.new_builder()
b.require_v('latest')
b.require_vmake('latest')

mod := 'stunxfs.fakemod'
if !b.user_has_mod(mod) {
    b.user_install_mod(mod)
}

b.run_v(b.get_build_mode(), '-o', b.exe_name('vmake_test'), 'testapp/')
```
