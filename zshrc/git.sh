# disable lowercase transform for commitizen
export DISABLE_SCOPE_LOWERCASE=1

# prune merged branches
alias ggprune='git checkout -q $(git rev-parse --abbrev-ref HEAD) && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $(git rev-parse --abbrev-ref HEAD) $branch) && [[ $(git cherry ${1:-master} $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

# get parent branch
alias ggparent='git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'

# get git commit messages for pasting in PR
function gglogs() {
  while getopts ":w:" o; do
      case "${o}" in
          w)
              w=${OPTARG}
              ;;
          *)
              echo "Must specify -w as what or why"
              ;;
      esac
  done
  shift $((OPTIND-1))

  case "$w" in
    what)
      format="- %s"
      ;;
    why)
      format="- %b"
      ;;
  esac

  git log --pretty=format:"${format}" $(ggparent).. --reverse | pbcopy
}
