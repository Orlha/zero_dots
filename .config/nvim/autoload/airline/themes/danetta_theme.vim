let g:airline#themes#danetta_theme#palette = airline#themes#bubblegum#palette

let s:middle = ['#ffffff', '#222222', 0, 0]

let s:old_normal_fg = g:airline#themes#bubblegum#palette.normal.airline_c[0]
let s:old_insert_fg = g:airline#themes#bubblegum#palette.insert.airline_c[0]
let s:old_visual_fg = g:airline#themes#bubblegum#palette.visual.airline_c[0]
let s:old_replace_fg = g:airline#themes#bubblegum#palette.replace.airline_c[0]
let s:old_inactive_fg = g:airline#themes#bubblegum#palette.inactive.airline_c[0]

let s:new_normal = [ s:old_normal_fg, '#222222', 0, 0]
let s:new_insert = [ s:old_insert_fg, '#222222', 0, 0]
let s:new_visual = [ s:old_visual_fg, '#222222', 0, 0]
let s:new_replace = [ s:old_replace_fg, '#222222', 0, 0]
let s:new_inactive = [ s:old_inactive_fg, '#222222', 0, 0]

" Overwrite Section C for all modes
let g:airline#themes#danetta_theme#palette.normal.airline_c = s:new_normal
let g:airline#themes#danetta_theme#palette.insert.airline_c = s:new_insert
let g:airline#themes#danetta_theme#palette.visual.airline_c = s:new_visual
let g:airline#themes#danetta_theme#palette.replace.airline_c = s:new_replace
let g:airline#themes#danetta_theme#palette.inactive.airline_c = s:new_inactive

"let g:airline#themes#danetta_theme#palette.normal_modified = { 'airline_c': s:new_normal }
"let g:airline#themes#danetta_theme#palette.insert_modified = { 'airline_c': s:new_insert }
"let g:airline#themes#danetta_theme#palette.visual_modified = { 'airline_c': s:new_visual }
"let g:airline#themes#danetta_theme#palette.replace_modified = { 'airline_c': s:new_replace }
"let g:airline#themes#danetta_theme#palette.inactive_modified = { 'airline_c': s:new_inactive }
let g:airline#themes#danetta_theme#palette.normal_modified.airline_c = s:new_normal
let g:airline#themes#danetta_theme#palette.insert_modified.airline_c = s:new_insert
let g:airline#themes#danetta_theme#palette.visual_modified.airline_c = s:new_visual
let g:airline#themes#danetta_theme#palette.replace_modified.airline_c = s:new_replace
let g:airline#themes#danetta_theme#palette.inactive_modified.airline_c = s:new_inactive


let g:airline#themes#danetta_theme#palette.replace.airline_z = g:airline#themes#danetta_theme#palette.replace.airline_a
let g:airline#themes#danetta_theme#palette.replace_modified.airline_z = g:airline#themes#danetta_theme#palette.replace.airline_a
