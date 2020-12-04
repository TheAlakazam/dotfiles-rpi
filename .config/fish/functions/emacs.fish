# Defined in - @ line 1
function emacs --wraps='emacsclient -a "" -c' --description 'alias emacs emacsclient -a "" -c'
  emacsclient -a "" -c $argv;
end
