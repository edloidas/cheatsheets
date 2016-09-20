# Git #

[Git](https://git-scm.com/) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

#### Configuration ####

* [`.gitignore`](.gitignore) - basic config without user name and email.

If you just want to copy configuration without scripts, don't forget to set the user name and email like this:

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
