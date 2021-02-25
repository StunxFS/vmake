# vmake

> WIP, because I'm busy for now :).

VMake is a simple library that can be used in both a V code file and a V script file.
The most common would be to use it in a V script, as shown below in the example.

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
