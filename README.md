# vmake

> WIP, because I'm busy for now :).

A building system for projects made with the V language (WIP).

**Example of a build script:**

```python
# VMake build script language

require_v(latest);
require_vmake(latest);

var mod = "stunxfs.fakemod";
if !user.has_mod(mod) {
  user.install_mod(mod);
}

run_v_build(BUILD_MODE, "-o", exe_name(join_path("bin", "vmake_test")), ".");
```
