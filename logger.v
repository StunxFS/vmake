// (C) 2020-2021 StunxFS. All rights reserved. Use of this source code is
// governed by an MIT license that can be found in the LICENSE file.

module vmake

import term

fn (b Builder) error(msg string) {
	eprintln(term.red('vmake error: ') + msg)
}

fn (b Builder) warn(msg string) {
	eprintln(term.yellow('vmake warning: ') + msg)
}

fn (b Builder) note(msg string) {
	eprintln(term.cyan('vmake note: ') + msg)
}
