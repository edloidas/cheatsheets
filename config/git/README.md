# Git #

[Git](https://git-scm.com/) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

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
* @robmiller with [.gitconfig](https://gist.github.com/robmiller/6018582)
* [Pro Git](https://git-scm.com/book/en/v2) book by Scott Chacon and Ben Straub
