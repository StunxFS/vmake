// (C) 2020-2021 StunxFS. All rights reserved. Use of this source code is
// governed by an MIT license that can be found in the LICENSE file.

module vmake

import net.http
import semver

fn version2str(ver semver.Version) string {
	return '${ver.major}.${ver.minor}.$ver.patch'
}

const v_mod = 'https://raw.githubusercontent.com/vlang/v/master/v.mod'

fn get_latest() string {
	resp := http.get(v_mod) or {
		panic(err)
		exit(1)
	}
	t := resp.text.split_into_lines().filter(it.trim_space().starts_with('version'))[0].trim_space()
	v := t.all_after("version: '").all_before("'")
	return v
}
