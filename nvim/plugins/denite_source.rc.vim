let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
            \ 'split': 'floating',
            \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
            \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
            \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
            \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
            \ 'highlight_matched_char': 'None',
            \ 'highlight_matched_range': 'Search',
            \ 'match_highlight': v:true,
            \ 'prompt': '>'
            \ })

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--nogroup', '--nocolor'])

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy', 'matcher/ignore_globs'])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
            \ ['.git', '.svn', 'node_modules'])
