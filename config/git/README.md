# Git #

[Git](https://git-scm.com/) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

[Pro tips →](PROTIPS.md)

#### Configuration ####

* [`.gitconfig`](.gitconfig) - basic config without user name and email.

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

The resulted configuration will be placed under the `HOME` directory.

If one or both arguments are missing and there are no `.credentials` file, you will be asked enter name and/or email.

Entered data will be stored in the `.credentials` file in this directory so you can skip entering the credentials in future when running the script. The file has the following structure:

```
SAVED_NAME=username
SAVED_EMAIL=useremail@example.com
```

#### Attribution ####

* `git lola` by [Conrad Parker](http://blog.kfish.org/2010/04/git-lola.html)
* @robmiller with [.gitconfig](https://gist.github.com/robmiller/6018582) (_modified_)
* `git recap` and `git today` by [Harry Roberts & Mike Street](https://twitter.com/csswizardry/status/784399286050156544) (_modified_)
* `git diffmin` by [Harry Roberts](https://twitter.com/csswizardry/status/867676530780065792)
* `git please`, `git commend`, `git it`, `git shorty`, `git stash*` by [Tim Pettersen](https://hackernoon.com/lesser-known-git-commands-151a1918a60) (_modified_)
* `git lolr` [post by Phil Nash](https://philna.sh/blog/2017/01/04/git-back-to-the-future/) and [tweet by Jake Archibald](https://twitter.com/jaffathecake/status/816595263733305344)  (_modified_)
* `git checkout -` by [Zack Hall](https://twitter.com/ZTHall/status/785653842792714240) (_modified_)
* [Oh shit, Git!](http://ohshitgit.com/) by Katie Sylor-Miller
* [Changing a commit message](https://help.github.com/articles/changing-a-commit-message/) by GitHub
* [Pro Git](https://git-scm.com/book/en/v2) book by Scott Chacon and Ben Straub
