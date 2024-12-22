/*
~/work/src/off/open-source-dev-env/3-settings/2-browsers/webextensions--common/uMatrix/~~gen/generator/index.mjs
 */

import SETTINGS from './0-settings/index.mjs'
import OFF from './1-matrix-off/index.mjs'
import WILDCARDS from './2-any/index.mjs'
import SITES from './3-known/index.mjs'

function cleanup(raw_multiline, { sort = false} = {}) {
	const lines = raw_multiline.split('\n')
		.map(l => l.trim())
		.filter(l => !!l)
		.filter(l => !l.startsWith('#'))

	if (sort)
		lines.sort()

	return lines.join('\n')
}

const AGGREGATED = `
${cleanup(SETTINGS,  {sort: false})}
${cleanup(OFF,       {sort: false})}
${cleanup(WILDCARDS, {sort: false})}
${cleanup(SITES,     {sort: true})}
`

//console.log('AGGREGATED=', AGGREGATED)

console.log(cleanup(AGGREGATED, {sort: false}))
