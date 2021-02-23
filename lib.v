module vmake

import semver
import net.http
import os

fn version2str(ver semver.Version) string {
	return "${ver.major}.${ver.minor}.${ver.patch}"
}

const v_mod = "https://raw.githubusercontent.com/vlang/v/master/v.mod"

fn get_latest() string {
	resp := http.get(v_mod) or {
		raise(err)
		exit(1)
	}
	t := resp.text.split_into_lines().filter(it.trim_space().starts_with('version'))[0].trim_space()
	v := t.all_after("version: '").all_before("'")
	return v
}

// require_v checks that the user has the required compiler version v installed
pub fn require_v(version string) {
	if version != 'latest' && !semver.is_valid(version) {
		raise('the version obtained is invalid ("$version")')
		return
	}
	ver := os.exec('v version') or {
		raise(err)
		return
	}
	if ver.exit_code != 0 {
		raise(ver.output)
		return
	}
	ver_arr := ver.output.split(' ')
	if ver_arr.len == 3 {
		sver := semver.from(ver_arr[1]) or {
			raise(err)
			return
		}
		mut mversion := version
		if mversion == 'latest' {
			mversion = get_latest()
		}
		if !sver.satisfies(mversion) {
			raise('your current version of V ("${version2str(sver)}") does not meet the required version ("$version")')
			return
		}
	}
}

