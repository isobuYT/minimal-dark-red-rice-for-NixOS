PS1='\[\e[38;2;204;26;42m\]\u\[\e[38;2;42;42;53m\]@\[\e[38;2;138;138;154m\]\h\[\e[0m\]:\[\e[38;2;42;42;53m\]\w\[\e[0m\]\$ '
fastfetch
#command update
alias update='sudo nixos-rebuild switch --upgrade && flatpak update'
