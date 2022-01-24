let s:floating_win_width_ratio = 0.88
let s:floating_win_height_ratio = 0.85

" Change denite default options
call denite#custom#option('default', {
            \ 'split': 'floating',
            \ 'winwidth': float2nr(&columns * s:floating_win_width_ratio / 2),
            \ 'wincol': float2nr((&columns - (&columns * s:floating_win_width_ratio)) / 2),
            \ 'winheight': float2nr(&lines * s:floating_win_height_ratio),
            \ 'winrow': float2nr((&lines - (&lines * s:floating_win_height_ratio)) / 2),
            \ 'floating_preview': v:true,
            \ 'vertical_preview': v:true,
            \ 'preview_height': float2nr(&lines * s:floating_win_height_ratio),
            \ 'preview_width': float2nr(&columns * s:floating_win_width_ratio / 2),
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
