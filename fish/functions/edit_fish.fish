function edit_fish --wraps='vim ~/.config/fish/config.fish' --description 'alias edit_fish=vim ~/.config/fish/config.fish'
  vim ~/.config/fish/config.fish $argv; 
end
