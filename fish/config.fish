set fish_greeting ""
# if not set -q SSH_AGENT_PID
# 	ssh-agent -c | source 
# 	ssh-add ~/.ssh/id_ed25519
# end
fish_vi_key_bindings insert
if status is-login
	keychain --eval $HOME/.ssh/id_ed25519 | source
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
