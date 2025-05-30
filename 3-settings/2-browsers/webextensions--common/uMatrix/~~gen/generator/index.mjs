/*
~/work/src/off/open-source-dev-env/3-settings/2-browsers/webextensions--common/uMatrix/~~gen/generator/index.mjs
 */
import * as fs from 'node:fs'

import SETTINGS from './00-settings/index.mjs'
import OFF from './01-matrix-off/index.mjs'
import WILDCARDS from './10-any-sites/index.mjs'
import SITES from './20-specific-sites/index.mjs'

function cleanup(raw_multiline, { sort = false} = {}) {
	const lines = raw_multiline.split('\n')
		.map(l => l.trim())
		.filter(l => !!l)
		.filter(l => !l.startsWith('#')) // remove full line comments
		.map(l => l.split('#')[0].trim()) // remove trailing comments

	if (sort)
		lines.sort()

	return lines.join('\n')
}

const AGGREGATED = `
matrix-off: v1.5--generated-on-${(new Date()).toISOString().split('T')[0]} false
${cleanup(SETTINGS,  {sort: false})}
${cleanup(OFF,       {sort: false})}
${cleanup(WILDCARDS, {sort: false})}
${cleanup(SITES,     {sort: true})}
`

//console.log('AGGREGATED=', AGGREGATED)

const data = cleanup(AGGREGATED, {sort: false})
console.log(data)
fs.writeFileSync('my-umatrix-rules--generated.txt', data);


/*
TODO func
Youtube as 3rd-party
steampowered.com youtube.com *
steampowered.com youtube.com script
steampowered.com youtube.com frame
steampowered.com googlevideo.com *
steampowered.com googlevideo.com xhr
steampowered.com ytimg.com *
steampowered.com ytimg.com script
*/
