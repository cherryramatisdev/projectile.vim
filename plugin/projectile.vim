if exists('g:loaded_projectile')
  finish
endif

let g:loaded_projectile = 1

command! ProjectileSwitch call projectile#SwitchProjects()
