Bring linting/formatting to your legacy projects
================================================

Remove all discussion about formatting/layout with an auto-formatter

Problem
-------

Blocker to implementing on existing codebase's
People fear enforcing auto-formatters/linters because:
* Noise (If applied to files touched by a feature)
    * A new feature is contaminated by layout modifications that obscure the intended logic
* Damage/loss to valuable code history (If applied to the whole repo)
    * Every line that is changed is obscured. This original history/comments/intent are berried

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

    # Extract subfolder as repo root and format every commit with formatter
    git filter-branch \
        --tag-name-filter cat \
        --prune-empty \
        --subdirectory-filter ./ \
        --tree-filter '\
            black --target-version=py27 ./ || \
            echo "Error formatting, possibly invalid py file" \
        '\
    -- --all
    # TODO: Optimization: format only changed files: $(git show $GIT_COMMIT --name-status | egrep ^[AM] | grep .py | cut -f2)

    # Prune all unrelated/unlinked refs
    git reset --hard
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

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


References
----------

* https://www.mattlayman.com/blog/2018/python-code-black/
* https://stackoverflow.com/a/359759/3356840
* https://medium.com/millennial-falcon-technology/reformatting-your-code-base-using-prettier-or-eslint-without-destroying-git-history-35052f3d853e
* https://medium.com/@elliotchance/reformatting-your-codebase-with-git-filter-branch-21feded7c423
* https://stackoverflow.com/a/21023615/3356840
* https://github.com/ghtdak/gitreformat
