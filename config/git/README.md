# Git #

[Git](https://git-scm.com/) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

#### Configuration ####

* [`.gitignore`](.gitignore) - basic config without user name and email.

If you copied the configuration by hands, don't forget to set the user name and email like this:

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

Read more in [Git Book](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup).

#### Tools ####

Run `_init.[sh/bat]` script to update your git with the current configuration. Those scripts accept two arguments:

```
_init.sh [user.name] [user.email]
```

If one or both arguments are missing, you will be asked enter them.

The resulted configuration will be placed under the HOME directory.

#### Attribution ####

* `git lola` by [Conrad Parker](http://blog.kfish.org/2010/04/git-lola.html)
* @robmiller with [.gitconfig](https://gist.github.com/robmiller/6018582)
* [Pro Git](https://git-scm.com/book/en/v2) book by Scott Chacon and Ben Straub 
