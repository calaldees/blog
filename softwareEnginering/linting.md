Bring linting/formatting to your legacy projects
================================================

Remove all discussion about formatting/layout with an auto-formatter

This is an example of migrating a codebase to using the python-formatter [black](https://black.readthedocs.io/) - The uncompromising code formatter

> By using Black, you agree to cede control over minutiae of hand-formatting. In return, Black gives you speed, determinism, and freedom from pycodestyle nagging about formatting. You will save time and mental energy for more important matters.

> Black makes code review faster by producing the smallest diffs possible. Blackened code looks the same regardless of the project you’re reading. Formatting becomes transparent after a while and you can focus on the content instead.


Problem
-------

People fear enforcing auto-formatters/linters on existing codebase's because:
* Noise (If applied to incrementally touched files for a feature)
    * A new feature is contaminated by layout modifications that obscure the intended logic
* Damage/loss to valuable code history (If applied to the whole repo)
    * Every line that is changed is obscures the history. This original history/comments/intent are berried

Solution
--------
Replay code formatting to every previous commit to preserve the original author + date + message.
The commit-hash's will have changed by the history will be preserved.

1. Format the repo history
    * Option 1.) Perform this on an existing repo
        * Force push `master` + ask developers to reclone the whole repo
    * Option 2.) Perform this as a migratory step when migrating to another repo
2. Setup local pre-commit hooks
    * Every commit is auto-formatted
        * Reduce developer mental overhead
3. Setup CI layout enforcement
    * `--check` rejection


Rewrite git history
-------------------

```bash
    pip install black
```

```bash
    # Safety first
    git remote rm origin

    cleanup () {
        # Prune all unrelated/unlinked refs
        git reset --hard
        git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
        git reflog expire --expire=now --all
        git gc --aggressive --prune=now
    }

    # Extract subfolder as repo root
    # 10 min
    FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch \
        --tag-name-filter cat \
        --prune-empty \
        --subdirectory-filter xxx/yyy/zzz \
    -- --all
    cleanup

    # Format every commit with formatter
    # 10 hours
    FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch \
        --tag-name-filter cat \
        --prune-empty \
        --tree-filter '\
            black --target-version=py27 ./ || \
            echo "Error formatting, possibly invalid py file" \
        '\
    -- --all
    cleanup

    # Push to the new repo
    git remote add origin git@NEW_REPO
    git push -u
    git push --follow-tags
```


Additional repo config
----------------------

* Create a [pyproject.toml](https://black.readthedocs.io/en/stable/pyproject_toml.html#configuration-format)
* Create a [.pre-commit-config.yaml](https://pre-commit.com/#2-add-a-pre-commit-configuration) (`rev: stable`)


Local pre-commit hooks
----------------------

```bash
    pip install pre-commit
    pre-commit install
```


Continuous integration enforcement
----------------------------------

```bash
    black --check
```


Appendix
--------

### How is `black` different from [pylint](https://www.pylint.org/)?

PyLint is a checker. It provides information/warnings but does not change files.
Black applies changes and modifies the layout of files.
PyLint can be configured to give warnings on more complex flows (much like MsWord provides grammar suggestions). It can also be programmed with custom rules if needed.
Black could be used in conjunction with tools like PyLint

PyLint could enforce things like
    * Enforcing if variable names are well-formed according to your coding standard
    * Enforcing depreciated modules use/import are treated as an error

They are parallel technologies that are implemented in similar ways.
Both would use similar setup methods:
1. Add some kind of config file in the root of the repo
2. Setup some kind of pre-commit hook to check them
3. Setup CI to reject/fail commits that break the rules
You could start by having `.pylintrc` file that has _no-rules_ and begin to setup pre-commit/ci without disrupting current development. Then slowly we can add rules incrementally.


References
----------

* http://books.agiliq.com/projects/essential-python-tools/en/latest/linters.html
* http://www.locallyoptimal.com/blog/2019/08/23/why-you-should-use-black-for-your-python-style-linting/
* https://www.mattlayman.com/blog/2018/python-code-black/
* https://stackoverflow.com/a/359759/3356840
* https://medium.com/millennial-falcon-technology/reformatting-your-code-base-using-prettier-or-eslint-without-destroying-git-history-35052f3d853e
* https://medium.com/@elliotchance/reformatting-your-codebase-with-git-filter-branch-21feded7c423
* https://stackoverflow.com/a/21023615/3356840
* https://github.com/ghtdak/gitreformat
