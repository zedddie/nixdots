set fish_greeting ""
# if not set -q SSH_AGENT_PID
# 	ssh-agent -c | source 
# 	ssh-add ~/.ssh/id_ed25519
# end
fish_vi_key_bindings insert
if status is-login
	keychain --quiet --eval $HOME/.ssh/id_ed25519 | source
end
abbr -a gst git status
abbr -a g git 
abbr -a gp git push
abbr -a gf git fetch
abbr -a gc git commit -m
abbr -a ga git add

abbr -a c cargo
if status is-interactive
    # Commands to run in interactive sessions can go here
end

