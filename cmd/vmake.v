module main

import os
import cli
import v.vmod

const build_vsh = 'build.vsh'

fn main() {
	vmod := vmod.decode(@VMOD_FILE) ?
	mut app := cli.Command{
		name: 'vmake'
		description: 'A building system for projects made with the V language.'
		version: vmod.version
		/*
		execute: fn (cmd cli.Command) ? {
            println('hello app')
            return
        }
		*/
	}

	// add commands and flags
	app.add_command(cli.Command{})
	app.add_flag(cli.Flag{})

	// run
	app.setup()
	app.parse(os.args)
}
