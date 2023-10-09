# Load the dotfiles

for file in ~/.{aliases,bash_prompt,completions,exports,extra,functions,git-completion,helpers,kubefuncs,path}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

. "$HOME/.cargo/env"
