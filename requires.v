// (C) 2020-2021 StunxFS. All rights reserved. Use of this source code is
// governed by an MIT license that can be found in the LICENSE file.

module vmake

import semver
import os

// require_v checks that the user has the required compiler version v installed
pub fn (b Builder) require_v(version string) {
	ver := os.exec('v version') or {
		b.error(err)
		return
	}
	if ver.exit_code != 0 {
		b.error(ver.output)
		return
	}
	ver_arr := ver.output.split(' ')
	if ver_arr.len == 3 {
		sver := semver.from(ver_arr[1]) or {
			b.error(err)
			return
		}
		mut mversion := version
		if mversion == 'latest' {
			mversion = get_latest()
		}
		if !semver.is_valid(mversion) {
			b.error('the version obtained is invalid ("$version")')
			return
		}
		if !sver.satisfies(mversion) {
			b.error('your current version of V ("${version2str(sver)}") does not meet the required version ("$version")')
			return
		}
	}
}
