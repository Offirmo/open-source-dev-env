program your keyboard through https://www.caniusevia.com/  -> https://usevia.app/

Doc https://www.keychron.com/blogs/archived/how-to-use-via-to-program-your-keyboard



## Concepts
keycodes = https://docs.qmk.fm/keycodes_basic
- see also https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md USE "SHORT"

modifiers:
^ = control = Ctrl
⌥ = option = alt
⌘ = command = "gui" / windows / meta
shift


2024/11 Sequoia: Ctrl + Shift = can't be used :-( unknown conflict...

## Current
- maximize window
  - {KC_LCTL,KC_LALT,KC_SPC}
- move window next space
  - M0 {KC_LGUI,KC_LCTL,KC_LEFT}
  - M1 {KC_LGUI,KC_LCTL,KC_RGHT}
- move window next screen + maximize (note the reversed arrows))
  - M2 {KC_LGUI,KC_LALT,KC_RGHT} + {KC_LCTL,KC_LALT,KC_SPC}
  - M3 {KC_LGUI,KC_LALT,KC_LEFT} + {KC_LCTL,KC_LALT,KC_SPC}
- move window to side of the current screen
  - M4 {KC_LCTL,KC_LALT,KC_LEFT}
  - M5 {KC_LCTL,KC_LALT,KC_RGHT}

PREVIOUSLY (before Sequoia)
- move window next screen + maximize
	- M2 {KC_LCTL,KC_LSFT,KC_LEFT} + {KC_LCTL,KC_LALT,KC_SPC}
	- M3 {KC_LCTL,KC_LSFT,KC_RGHT} + {KC_LCTL,KC_LALT,KC_SPC}


## TOSORT

Candidate strings:
`nvm i`
`yarn dev`
`git-cola &`

✅❎❌✔️⚠️
☑ ☐  ✖ ✔ ⚠

⬅ ⬆ ⬇ ⮕

ⵧ ꓽ ‿ ೱ ᐧ

ↆ ꜛꜜ
ϟ



Actions:
- move page screen
- move page side of screen
