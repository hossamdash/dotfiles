# This zsh config depends heavely on packages installed by brew

## xdg-ninja section start --->

### Setting XDG directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_RUNTIME_DIR="$HOME"/Library/Caches

### applications xdg
#### AWS CLI
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
#### AZURE SDK
export AZURE_DEVOPS_CACHE_DIR="$XDG_CACHE_HOME"/azure-devops
#### Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
#### terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
#### less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
####
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

## xdg-ninja section end <---

### PATH, Completions and aliases
# Add Homebrew binaries to the PATH (brew command not in path yet)
export PATH="/opt/homebrew/bin:$PATH"
# Add Homebrew's zsh site functions to the FPATH for completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# Load gcloud plugins completions
source $(brew --prefix)/share/google-cloud-sdk/path.zsh.inc
source $(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc
# Add libpq binaries to the PATH (psql command line)
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"
# Add Krew binaries to the PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# Add local k3s cluster to kubeconfig
export KUBECONFIG=~/.kube/config:~/.lima/k3s/copied-from-guest/kubeconfig.yaml
# Load custom aliases
source ~/.config/zsh/.aliases

### ZSH features
# Load zsh fast syntax highlighting
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Load zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load and initialize zsh completion
autoload -Uz compinit
compinit

### terraform autocompletion (has to be after compinit)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

### Initialize mcfly for zsh
eval "$(mcfly init zsh)"

### powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
