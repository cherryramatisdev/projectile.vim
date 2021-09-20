let g:projects_root = expand('~/projects')

function! projectile#GetProjectsName(A, L, P) abort
  let l:projects = systemlist('find ' . g:projects_root . ' -maxdepth 2 -mindepth 2 -type d')

  " TODO: discover how to this
  " let l:projects_names = filter(
  "       \ map(l:projects, {key, val -> split(val, '/')[-1]}),
  "       \ {idx, val -> val != '.git'}
  "       \ )

  if empty(a:A)
    return l:projects
  else
    return l:projects->matchfuzzy(a:A)
  endif
endfunction

function! projectile#SwitchProjects() abort
  let l:choosed = input(
        \ 'Choose a project name: ',
        \ '',
        \ 'customlist,projectile#GetProjectsName'
        \ )
  redraw

  if empty(l:choosed)
    return
  endif

  execute 'tabnew ' . l:choosed
endfunction
