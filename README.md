# vmake

> WIP, because I'm busy for now :).

A building system for projects made with the V language (WIP).

**Example of a build script:**

```v
// build.vsh | run with: vmake .
import stunxfs.vmake

vmake.require_v_latest()
vmake.require_vmake_latest()

mod := 'stunxfs.fakemod'
if !vmake.user_has_mod(mod) {
    vmake.user_install_mod(mod)
}

vmake.run_v(vmake.get_build_mod(), '-o', vmake.exe_name('vmake'))
```
