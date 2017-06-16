# Git #

[← back to README](README.md)

#### Pro tips ####

* Do not use empty parentheses `()` in branch names and commit messages (when using `git commit -m`).
<br/>[Explained on StackOverflow](http://stackoverflow.com/questions/32355540/complex-git-branch-name-broke-all-git-commands).

* Exclude certain files or paths from diffs by using `':(exclude)<path>'`, e.g.: `git diff . ':(exclude)*.min.css'`.
<br/>Tweet by [Harry Roberts](https://twitter.com/csswizardry/status/875466414714490880).
