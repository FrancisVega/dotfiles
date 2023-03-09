#!/usr/bin/env zsh

# Nav
alias griddo='cd ~/Developer/Work/griddo; code .;'
alias grido='cd ~/Developer/Work/griddo; code .;'

# Pruning local branches no longer needed
alias clb='git clb'

# PRs
alias pr='gh pr create -f -t $(git current-branch) -a \"@me\" -B'
alias prm='push && pr $(git mb)'
alias prdev='pr develop'
alias prstg='pr staging'
alias prapidev='prdev -r AlvaroSecuoyas'
alias prapistg='prstg -r AlvaroSecuoyas'
alias prcxdev='prdev -r FrancisVega'
alias prcxstg='prstg -r FrancisVega'
alias praxdev='prdev -r serroal'
alias praxstg='prstg -r serroal'
alias prdevapi='prdev -r AlvaroSecuoyas'
alias prdevcx='prdev -r FrancisVega'
alias prdevax='prdev -r serroal'
alias prstgapi='prstg -r AlvaroSecuoyas'
alias prstgcx='prstg -r FrancisVega'
alias prstgax='prstg -r serroal'

alias prapi='prstgapi'
alias prcx='prstgcx'
alias prax='prstgax'

# Sync main branches to publish in channels
function releaseBranch {
	if [[ -z "$1" ]]; then
		echo "Please, suppy a branch to release"
		return
	fi

	builtin cd $(git root)

	git switch -q $1

	# Marge with main branch
	qm $(git mb)

	git switch -q $(g mb)

	yarn release:patch
	local GRIDDO_VERSION=$(__getGriddoVersion)

	echo "\nReleasing \033[1;33m$GRIDDO_VERSION\033[0m\n"

	# Push main branch
	git push

	for branch in $(git branch -l staging develop); do
		git switch -q $branch
		git pull
		git merge $(git mb) -m "Publish $GRIDDO_VERSION" && git push
		[[ $? != 0 ]] || return $?
	done

	git switch $1
}

alias relb='gitup . && releaseBranch $(git current-branch)'

function finishBranch {
	for branch in $(git branch -l main master staging develop); do
		qm $branch
		[[ $? != 0 ]] && return $?
	done
}

function __getGriddoVersion {
	builtin cd $(git root)
	node -p "require(\"./lerna.json\").version"
}
