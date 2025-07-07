# OhMyZsh Strug Theme but with nix-shell and shell level support

export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagacad

function in_nix_shell() {
    if [ -n "${IN_NIX_SHELL+x}" ]; then
        if [ -f ./.envrc ]; then
            local first_line=$(head -n 1 ./.envrc)

            if [ $first_line = "use flake" ]; then
                echo -n " dev";
            else
                echo -n " shell";
            fi
        else
            echo -n " shell";
        fi
    fi
}

function in_venv() {
    if [ -n "${VIRTUAL_ENV+x}" ]; then
        echo -n " venv";
    fi
}

function get_status() {
    local nix_shell=$(in_nix_shell)
    local venv=$(in_venv)

    if [ -n "$nix_shell" ]; then
        echo -n " %{$fg[blue]%}$nix_shell%{$reset_color%}"
    fi
    if [ -n "${venv}" ]; then
        echo -n " %{$fg[magenta]%}$venv%{$reset_color%}"
    fi
}

function get_shell_level() {
    local level=$(echo -n $SHLVL)
    if [ $level -gt 1 ]; then
        echo -n "%{$fg[orange]%}$level%{$reset_color%}"
    fi
}

local user_at_pc="%n@%m%{$reset_color%}"
local shell_status="$(get_status)"
local in_path="%{$fg[yellow]%}in %~ %{$reset_color%}"
local git_branch='$(git_prompt_info)%{$reset_color%}$(git_remote_status)'
local shell_level="$(get_shell_level)"
VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT="%{$fg[green]%}╭─$user_at_pc$shell_status $in_path$git_branch$shell_level
%{$fg[green]%}╰\$ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{$fg[green]%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{$fg[red]%}
