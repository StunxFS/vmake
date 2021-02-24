module vmake

import term

fn raise(msg string) {
	eprintln(term.red('vmake error: ') + msg)
}
