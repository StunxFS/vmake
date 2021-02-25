// (C) 2020-2021 StunxFS. All rights reserved. Use of this source code is
// governed by an MIT license that can be found in the LICENSE file.

module vmake

import os

pub struct Builder {
}

pub fn new_builder() Builder {
	return Builder{}
}

pub fn (b Builder) run_v_with_command(cmd string, args ...string) ? {
	args_j := args.join(' ')
	res := os.exec('v $cmd $args_j') ?
	if res.exit_code != 0 {
		return error(res.output)
	}
}

[inline]
pub fn (b Builder) run_v(args ...string) ? {
	b.run_v_with_command('', ...args) ?
}
