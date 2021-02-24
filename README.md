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
// build.vmake | run with: vmake
import stunxfs.vmake

fn build(mut b vmake.Builder) {
	b.require_v('latest')
	b.require_vmake('latest')

	mod := 'stunxfs.fakemod'
	if !b.user_has_mod(mod) {
	    b.user_install_mod(mod)
	}

	b.run_v(b.get_build_mode(), '-o', b.exe_name('vmake'))
}
```
