# bash/zsh completion support for core Git.
#
# Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>
# Conceptually based on gitcompletion (http://gitweb.hawaga.org.uk/).
# Distributed under the GNU General Public License, version 2.0.
#
# The contained completion routines provide support for completing:
#
#    *) local and remote branch names
#    *) local and remote tag names
#    *) .git/remotes file names
#    *) git 'subcommands'
#    *) git email aliases for git-send-email
#    *) tree paths within 'ref:path/to/file' expressions
#    *) file paths within current working directory and index
#    *) common --long-options
#
# To use these routines:
#
#    1) Copy this file to somewhere (e.g. ~/.git-completion.bash).
#    2) Add the following line to your .bashrc/.zshrc:
#        source ~/.git-completion.bash
#    3) Consider changing your PS1 to also show the current branch,
#       see git-prompt.sh for details.
#
# If you use complex aliases of form '!f() { ... }; f', you can use the null
# command ':' as the first command in the function body to declare the desired
# completion style.  For example '!f() { : git commit ; ... }; f' will
# tell the completion to use commit completion.  This also works with aliases
# of form "!sh -c '...'".  For example, "!sh -c ': git commit ; ... '".
#
# Compatible with bash 3.2.57.
#
# You can set the following environment variables to influence the behavior of
# the completion routines:
#
#   GIT_COMPLETION_CHECKOUT_NO_GUESS
#
#     When set to "1", do not include "DWIM" suggestions in git-checkout
#     completion (e.g., completing "foo" when "origin/foo" exists).

case "$COMP_WORDBREAKS" in
*:*) : great ;;
*)   COMP_WORDBREAKS="$COMP_WORDBREAKS:"
esac

# Discovers the path to the git repository taking any '--git-dir=<path>' and
# '-C <path>' options into account and stores it in the $__git_repo_path
# variable.
__git_find_repo_path ()
{
        if [ -n "$__git_repo_path" ]; then
                # we already know where it is
                return
        fi

        if [ -n "${__git_C_args-}" ]; then
:set nonumber
        }

        _git ()
        {
                local _ret=1 cur cword prev
                cur=${words[CURRENT]}
                prev=${words[CURRENT-1]}
                let cword=CURRENT-1
                emulate ksh -c __${service}_main
                let _ret && _default && _ret=0
                return _ret
        }

        compdef _git git gitk
        return
fi

__git_func_wrap ()
{
        local cur words cword prev
        _get_comp_words_by_ref -n =: cur words cword prev
        $1
}

# Setup completion for certain functions defined above by setting common
# variables and workarounds.
# This is NOT a public function; use at your own risk.
__git_complete ()
{
        local wrapper="__git_wrap${2}"
        eval "$wrapper () { __git_func_wrap $2 ; }"
        complete -o bashdefault -o default -o nospace -F $wrapper $1 2>/dev/null \
                || complete -o default -o nospace -F $wrapper $1
}

# wrapper for backwards compatibility
_git ()
{
        __git_wrap__git_main
}

# wrapper for backwards compatibility
_gitk ()
{
        __git_wrap__gitk_main
}

__git_complete git __git_main
__git_complete gitk __gitk_main

# The following are necessary only for Cygwin, and only are needed
# when the user has tab-completed the executable name and consequently
# included the '.exe' suffix.
#
if [ Cygwin = "$(uname -o 2>/dev/null)" ]; then
__git_complete git.exe __git_main
fi
