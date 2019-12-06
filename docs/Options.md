## Options

You have ability to customize or disable specific elements of Gyarados. All options must be overridden in your `config.fish`.

Colors for sections can be [basic colors](https://fishshell.com/docs/current/commands.html#set_color) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

**Note:** the symbol `·` in this document represents a regular space character ` `, it is used to clearly indicate when an option default value starts or ends with a space.

### Order

You can specify the order of prompt section using `GYARADOS_PROMPT_ORDER` option. Use Zsh array syntax to define your own prompt order.

The order also defines which sections that Gyarados loads. If you're struggling with slow prompt, you can just omit the sections that you don't use, and they won't be loaded.

The default order is:

```fish
    set GYARADOS_PROMPT_ORDER time user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char
```
You can also add items to the right prompt by specifying them in the `GYARADOS_RPROMPT_ORDER` option. By default `GYARADOS_RPROMPT_ORDER` is empty.

### Prompt

This group of options defines a behavior of prompt and standard parameters for sections displaying.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `GYARADOS_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `GYARADOS_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt |
| `GYARADOS_PROMPT_PREFIXES_SHOW` | `true` | Show prefixes before prompt sections |
| `GYARADOS_PROMPT_SUFFIXES_SHOW` | `true` | Show suffixes before prompt sections |
| `GYARADOS_PROMPT_DEFAULT_PREFIX` | `via` | Default prefix for prompt sections |
| `GYARADOS_PROMPT_DEFAULT_SUFFIX` | ` ` | Default suffix for prompt section |

### Time \(`time`\)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_TIME_SHOW` | `false` | Show current time |
| `GYARADOS_DATE_SHOW` | `false·` | Show today's date |
| `GYARADOS_TIME_PREFIX` | `at·` | Prefix before time section |
| `GYARADOS_TIME_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after time section |
| `GYARADOS_TIME_FORMAT` | `false` | Custom time/date formatting, set as a string to enable (`man date` for help)  |
| `GYARADOS_TIME_12HR` | `false` | Use 12 hour clock AM/PM |
| `GYARADOS_TIME_COLOR` | `yellow` | Color of time section |

### Username \(`user`\)

By default, a username is shown only when it's not the same as `$LOGNAME`, when you're connected via SSH or when you're root. Root user is highlighted in `GYARADOS_USER_COLOR_ROOT` color (red as default).

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_USER_SHOW` | `true` | Show user section (`true`, `false`, `always` or `needed`) |
| `GYARADOS_USER_PREFIX` | `with·` | Prefix before user section |
| `GYARADOS_USER_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after user section |
| `GYARADOS_USER_COLOR` | `yellow` | Color of user section |
| `GYARADOS_USER_COLOR_ROOT` | `red` | Color of user section when it's root |

`GYARADOS_USER_SHOW` defines when to show username section. Here are possible values:

| `GYARADOS_USER_SHOW` | Show on local  | Show on remote  |
| :-------------------: | :------------- | :-------------- |
| `false`               | Never          | Never           |
| `always`              | Always         | Always          |
| `true`                | If needed      | Always          |
| `needed`              | If needed      | If needed       |


### Directory \(`dir`\)

Directory is always shown and truncated to the value of `GYARADOS_DIR_TRUNC`. While you are in a Git repository, this section shows only the project title and relevant status icons. If current directory is write-protected or if current user doesn't have write permissions, a padlock (by default) will be displayed as a suffix.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_DIR_SHOW` | `true` | Show directory section |
| `GYARADOS_DIR_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after current directory |
| `GYARADOS_DIR_TRUNC` | `3` | Number of folders of cwd to show in prompt, 0 to show all |
| `GYARADOS_DIR_TRUNC_REPO` | `true` | While in `git` repo, show only root directory and folders inside it |
| `GYARADOS_DIR_COLOR` | `cyan` | Color of directory section |
| `GYARADOS_DIR_PREFIX` | `in·` | Prefix before current directory |
| `GYARADOS_DIR_LOCK_SHOW` | `true` | Show directory write-protected symbol |
| `GYARADOS_DIR_LOCK_SYMBOL` | ![·🔒](https://user-images.githubusercontent.com/11844760/47611530-7bf99c00-da8d-11e8-95da-f4ec1f23203a.png) | The symbol displayed if directory is write-protected (requires powerline patched font) |
| `GYARADOS_DIR_LOCK_COLOR` | `red` | Color for the lock symbol |

### Hostname \(`host`\)

Hostname should only be shown while you are connected to another machine using SSH, unless you change it using GYARADOS_HOST_SHOW.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_HOST_SHOW` | `true` | Show host section (`true`, `false`, `always`) |
| `GYARADOS_HOST_SHOW_FULL` | `false` | Show full hostname section (`true`, `false`) |
| `GYARADOS_HOST_PREFIX` | `at·` | Prefix before the hostname |
| `GYARADOS_HOST_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the hostname |
| `GYARADOS_HOST_COLOR` | `blue` | Color of the hostname |
| `GYARADOS_HOST_COLOR_SSH` | `green` | Color of the hostname during SSH |

### Git \(`git`\)

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_GIT_SHOW` | `true` | Show Git section |
| `GYARADOS_GIT_PREFIX` | `on·` | Prefix before Git section |
| `GYARADOS_GIT_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Git section |
| `GYARADOS_GIT_SYMBOL` | ![·](https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png) | Character to be shown before Git section \(requires [powerline patched font](https://github.com/powerline/fonts) |

#### Git branch \(`git_branch`\)

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_GIT_BRANCH_SHOW` | `true` | Show Git branch subsection |
| `GYARADOS_GIT_BRANCH_PREFIX` | `$GYARADOS_GIT_SYMBOL` | Prefix before Git branch subsection |
| `GYARADOS_GIT_BRANCH_SUFFIX` | ` ` | Suffix after Git branch subsection |
| `GYARADOS_GIT_BRANCH_COLOR` | `(set_color magenta)` | Color of Git branch subsection |

#### Git status \(`git_status`\)

Git status indicators is shown only when you have dirty repository.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_GIT_STATUS_SHOW` | `true` | Show Git status subsection |
| `GYARADOS_GIT_STATUS_PREFIX` | `·[` | Prefix before Git status subsection |
| `GYARADOS_GIT_STATUS_SUFFIX` | `]` | Suffix after Git status subsection |
| `GYARADOS_GIT_STATUS_COLOR` | `red` | Color of Git status subsection |
| `GYARADOS_GIT_STATUS_UNTRACKED` | `?` | Indicator for untracked changes |
| `GYARADOS_GIT_STATUS_ADDED` | `+` | Indicator for added changes |
| `GYARADOS_GIT_STATUS_MODIFIED` | `!` | Indicator for unstaged files |
| `GYARADOS_GIT_STATUS_RENAMED` | `»` | Indicator for renamed files |
| `GYARADOS_GIT_STATUS_DELETED` | `✘` | Indicator for deleted files |
| `GYARADOS_GIT_STATUS_STASHED` | `$` | Indicator for stashed changes |
| `GYARADOS_GIT_STATUS_UNMERGED` | `=` | Indicator for unmerged changes |
| `GYARADOS_GIT_STATUS_AHEAD` | `⇡` | Indicator for unpushed changes \(ahead of remote branch\) |
| `GYARADOS_GIT_STATUS_BEHIND` | `⇣` | Indicator for unpulled changes \(behind of remote branch\) |
| `GYARADOS_GIT_STATUS_DIVERGED` | `⇕` | Indicator for diverged chages \(diverged with remote branch\) |

### Package version \(`package`\)

> Works only for [npm](https://www.npmjs.com/) and [cargo](https://crates.io/) at the moment. Please, help [spaceship](https://github.com/denysdovhan/spaceship-prompt) improve this section!

Package version is shown when repository is a package (e.g. contains a `package.json` or `Cargo.toml` file). If no version information is found in `package.json` or there is an error parsing `Cargo.toml`, the `⚠` symbol will be shown.

* **npm** — `npm` package contains a `package.json` file. We use `jq`, `python` to parse package version for improving performance and `node` as a fallback. Install [jq](https://stedolan.github.io/jq/) for **improved performance** of this section ([Why?](./Troubleshooting.md#why-is-my-prompt-slow))
* **cargo** — `cargo` package contains a `Cargo.toml` file. Currently, we use `cargo pkgid`, it depends on `Cargo.lock`. So if package version isn't shown, you may need to run some command like `cargo build` which can generate `Cargo.lock` file.

> **Note:** This is the version of the package you are working on, not the version of package manager itself.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_PACKAGE_SHOW` | `true` | Show package version |
| `GYARADOS_PACKAGE_PREFIX` | `is·` | Prefix before package version section |
| `GYARADOS_PACKAGE_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after package version section |
| `GYARADOS_PACKAGE_SYMBOL` | `📦·` | Character to be shown before package version |
| `GYARADOS_PACKAGE_COLOR` | `red` | Color of package version section |

### Node.js \(`node`\)

Node.js section is shown only in directories that contain `package.json` file, or `node_modules` folder, or any other file with `.js` extension.

If you set `GYARADOS_NODE_DEFAULT_VERSION` to the default Node.js version and your current version is the same as `GYARADOS_NODE_DEFAULT_VERSION`, then Node.js section will be hidden.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_NODE_SHOW` | `true` | Current Node.js section |
| `GYARADOS_NODE_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before Node.js section |
| `GYARADOS_NODE_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Node.js section |
| `GYARADOS_NODE_SYMBOL` | `⬢·` | Character to be shown before Node.js version |
| `GYARADOS_NODE_DEFAULT_VERSION` | ` ` | Node.js version to be treated as default |
| `GYARADOS_NODE_COLOR` | `green` | Color of Node.js section |

### Julia \(`julia`\)

Julia section is shown only in directories that contain any file with `.jl` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_JULIA_SHOW` | `true` | Show Julia section |
| `GYARADOS_JULIA_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before Julia section |
| `GYARADOS_JULIA_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Julia section |
| `GYARADOS_JULIA_SYMBOL` | `ஃ·` | Character to be shown before Julia version |
| `GYARADOS_JULIA_COLOR` | `green` | Color of Julia section |

### Docker (`docker`)

Docker section is shown only in directories that contain `Dockerfile` or `docker-compose.yml` and also if the `$COMPOSE_FILE` is set.
The section will also appear when `.dockerenv` is in the root directory, signifying that you're in a container.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_DOCKER_SHOW` | `true` | Show current Docker version |
| `GYARADOS_DOCKER_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the Docker section |
| `GYARADOS_DOCKER_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the Docker section |
| `GYARADOS_DOCKER_SYMBOL` | `🐳·` | Character to be shown before Docker version |
| `GYARADOS_DOCKER_COLOR` | `cyan` | Color of Docker section |
| `GYARADOS_DOCKER_VERBOSE_VERSION` | `false` | Show full version name. (Beta, Nightly) |

### Ruby \(`ruby`\)

Ruby section is shown only in directories that contain `Gemfile`, or `Rakefile`, or any other file with `.rb` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_RUBY_SHOW` | `true` | Show Ruby section |
| `GYARADOS_RUBY_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before Ruby section |
| `GYARADOS_RUBY_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Ruby section |
| `GYARADOS_RUBY_SYMBOL` | `💎·` | Character to be shown before Ruby version |
| `GYARADOS_RUBY_COLOR` | `red` | Color of Ruby section |

### Haskell \(`haskell`\)

Haskell section is shown only in directories that contain `stack.yaml`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_HASKELL_SHOW` | `true` | Show Haskell section |
| `GYARADOS_HASKELL_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before Haskell section |
| `GYARADOS_HASKELL_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Haskell section |
| `GYARADOS_HASKELL_SYMBOL` | `λ·` | Character to be shown before Haskell version |
| `GYARADOS_HASKELL_COLOR` | `red` | Color of Haskell section |

### Amazon Web Services (AWS) (`aws`)

Shows selected Amazon Web Services profile configured using [`AWS_VAULT`](https://github.com/99designs/aws-vault) or [`AWS_PROFILE`](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html) variable.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_AWS_SHOW` | `true` | Show current selected AWS-cli profile or not |
| `GYARADOS_AWS_PREFIX` | `using·` | Prefix before the AWS section |
| `GYARADOS_AWS_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the AWS section |
| `GYARADOS_AWS_SYMBOL` | `☁️·` | Character to be shown before AWS profile |
| `GYARADOS_AWS_COLOR` | `ff8700` | Color of AWS section |

### Virtualenv (`venv`)

Python virtual environment when $VIRTUAL_ENV is set.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_VENV_SHOW` | `true` | Show current Python virtualenv or not |
| `GYARADOS_VENV_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the virtualenv section |
| `GYARADOS_VENV_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the virtualenv section |
| `GYARADOS_VENV_SYMBOL` | `·` | Character to be shown before virtualenv |
| `GYARADOS_VENV_GENERIC_NAMES` | `virtualenv venv .venv` | If the virtualenv folder is in this *array*, than use its parent directory as its name instead |
| `GYARADOS_VENV_COLOR` | `blue` | Color of virtualenv environment section |


### Conda \(`conda`\)

Conda section is shown when ```conda``` is installed and $CONDA_DEFAULT_ENV is set.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_CONDA_SHOW` | `true` | Show current Conda version |
| `GYARADOS_CONDA_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the conda section |
| `GYARADOS_CONDA_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the conda section |
| `GYARADOS_CONDA_SYMBOL` | `🅒·` | Character to be shown before Conda version |
| `GYARADOS_CONDA_COLOR` | `blue` | Color of Conda section |


### Elixir \(`elixir`\)

Elixir section is shown when ```mix.exs``` is found or elixir files are found and either kiex, exenv, elixir is avaiable on your path.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_ELIXIR_SHOW` | `true` | Show current Elixir version |
| `GYARADOS_ELIXIR_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the elixir section |
| `GYARADOS_ELIXIR_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the elixir section |
| `GYARADOS_ELIXIR_SYMBOL` | `💧·` | Character to be shown before Elixir version |
| `GYARADOS_ELIXIR_COLOR` | `magenta` | Color of Elixir section |

### Pyenv \(`pyenv`\)

Pyenv section is shown only in directories that contain `.python-version`, `requirements.txt`, `pyproject.toml`, or any other file with `.py` extension.
The section will also be shown if the `$PYENV_VERSION` environment variable is set.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_PYENV_SHOW` | `true` | Show current Pyenv version |
| `GYARADOS_PYENV_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the pyenv section |
| `GYARADOS_PYENV_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the pyenv section |
| `GYARADOS_PYENV_SYMBOL` | `🐍·` | Character to be shown before Pyenv version |
| `GYARADOS_PYENV_COLOR` | `yellow` | Color of Pyenv section |

### Go \(`golang`\)

Go section is shown only in directories that contain `Godeps`, `glide.yaml`, `go.mod`, any other file with `.go` extension, or when current directory is in the Go workspace defined in `$GOPATH`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_GOLANG_SHOW` | `true` | Show current Go version |
| `GYARADOS_GOLANG_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the Go section |
| `GYARADOS_GOLANG_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the Go section |
| `GYARADOS_GOLANG_SYMBOL` | `🐹·` | Character to be shown before Go version |
| `GYARADOS_GOLANG_COLOR` | `cyan` | Color of Go section |

### PHP (`php`)

PHP section is shown only in directories that contain `composer.json` file, or any other file with `.php` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_PHP_SHOW` | true | Show PHP section |
| `GYARADOS_PHP_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the PHP section |
| `GYARADOS_PHP_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the PHP section |
| `GYARADOS_PHP_SYMBOL` | `🐘·` | Character to be shown before PHP version |
| `GYARADOS_PHP_COLOR` | `blue` | Color of PHP section |

### Rust (`rust`)

Rust section is shown only in directories that contain `Cargo.toml` or any other file with `.rs` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_RUST_SHOW` | `true` | Show current Rust version |
| `GYARADOS_RUST_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before the Rust section |
| `GYARADOS_RUST_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the Rust section |
| `GYARADOS_RUST_SYMBOL` | `𝗥·` | Character to be shown before Rust version |
| `GYARADOS_RUST_COLOR` | `red` | Color of Rust section |
| `GYARADOS_RUST_VERBOSE_VERSION` | `false` | Show what branch is being used, if any. (Beta, Nightly) |

### .NET (`dotnet`)

.NET section is shown only in directories that contains a `project.json`, `global.json` or `paket.dependencies` file, or a file with one of these extensions: `.csproj`, `.xproj`, `.fproj` or `.sln`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_DOTNET_SHOW` | `true` | Current .NET section |
| `GYARADOS_DOTNET_PREFIX` | `$GYARADOS_PROMPT_DEFAULT_PREFIX` | Prefix before .NET section |
| `GYARADOS_DOTNET_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after .NET section |
| `GYARADOS_DOTNET_SYMBOL` | `.NET·` | Character to be shown before .NET version |
| `GYARADOS_DOTNET_COLOR` | `128` | Color of .NET section |

### Kubectl context \(`kubecontext`\)

Kubernetes context is shown everywhere if `kubectl` binary is found.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_KUBECONTEXT_SHOW` | `true` | Show current kubectl context |
| `GYARADOS_KUBECONTEXT_NAMESPACE_SHOW` | `true` | Show current kubectl context namespace|
| `GYARADOS_KUBECONTEXT_PREFIX` | `at ` | Prefix before the kubectl section |
| `GYARADOS_KUBECONTEXT_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after the kubectl section |
| `GYARADOS_KUBECONTEXT_SYMBOL` | `☸️ ` | Character to be shown before kubectl context |
| `GYARADOS_KUBECONTEXT_COLOR` | `cyan` | Color of kubectl section |

### Exec Time \(`exec_time`\)

Execution time of the last command. Will be displayed if it exceeds the set threshold of time.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_EXEC_TIME_SHOW` | `true` | Show execution time |
| `GYARADOS_EXEC_TIME_PREFIX` | `took·` |  Prefix before exec time section |
| `GYARADOS_EXEC_TIME_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after exec time section |
| `GYARADOS_EXEC_TIME_COLOR` | `yellow` | Color of exec time section |
| `GYARADOS_EXEC_TIME_ELAPSED` | `5` | The threshold in seconds for showing exec time section |

### Line Separator \(`line_sep`\)

This is where the prompt will split into two lines, if enabled.

### Battery \(`battery`\)

By default, Battery section is shown only if battery level is below `GYARADOS_BATTERY_THRESHOLD` \(default: 10%\).

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_BATTERY_SHOW` | `true` | Show battery section \(`true`, `false`, `always` or `charged`\) |
| `GYARADOS_BATTERY_PREFIX` | ` ` | Prefix before battery section |
| `GYARADOS_BATTERY_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after battery section |
| `GYARADOS_BATTERY_SYMBOL_CHARGING` | `⇡` | Character to be shown if battery is charging |
| `GYARADOS_BATTERY_SYMBOL_DISCHARGING` | `⇣` | Character to be shown if battery is discharging |
| `GYARADOS_BATTERY_SYMBOL_FULL` | `•` | Character to be shown if battery is full |
| `GYARADOS_BATTERY_THRESHOLD` | 10 | Battery level below which battery section will be shown |

`GYARADOS_BATTERY_SHOW` defines when to show battery section. Here are possible values:

| `GYARADOS_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
| :---: | :--- | :--- | :--- |
| `false` | Hidden | Hidden | Hidden |
| `always` | Shown | Shown | Shown |
| `true` | Shown | Hidden | Hidden |
| `charged` | Shown | Hidden | Shown |

### Vi-mode \( vi_mode \)

This section shows mode indicator only when Vi-mode is enabled.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_VI_MODE_SHOW` | `true` | Shown current Vi-mode or not |
| `GYARADOS_VI_MODE_PREFIX` | ` ` | Prefix before Vi-mode section |
| `GYARADOS_VI_MODE_SUFFIX` | `$GYARADOS_PROMPT_DEFAULT_SUFFIX` | Suffix after Vi-mode section |
| `GYARADOS_VI_MODE_INSERT` | `[I]` | Text to be shown when in insert mode |
| `GYARADOS_VI_MODE_NORMAL` | `[N]` | Text to be shown when in normal mode |
| `GYARADOS_VI_MODE_VISUAL` | `[V]` | Text to be shown when in visual mode |
| `GYARADOS_VI_MODE_REPLACE_ONE` | `[R]` | Text to be shown when in replace_one mode |
| `GYARADOS_VI_MODE_COLOR` | `white` | Color of Vi-mode section |

### Jobs \(`jobs`\)

This section only shows when there are backgrounded jobs.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `GYARADOS_JOBS_SHOW` | `true` | Show background jobs indicator  |
| `GYARADOS_JOBS_PREFIX` | ` ` | Prefix before the jobs indicator |
| `GYARADOS_JOBS_SUFFIX` | ` ` | Suffix after the jobs indicator |
| `GYARADOS_JOBS_SYMBOL` | `✦` | Character to be shown when jobs are hiding |
| `GYARADOS_JOBS_COLOR` | `blue` | Color of background jobs section |
| `GYARADOS_JOBS_AMOUNT_PREFIX` | ` ` | Prefix before the number of jobs |
| `GYARADOS_JOBS_AMOUNT_SUFFIX` | ` ` | Suffix after the number of jobs |
| `GYARADOS_JOBS_AMOUNT_THRESHOLD` | `1` | Number of jobs after which job count will be shown |

### Exit Code \(`exit_code`\)
Disabled by default. Set `GYARADOS_EXIT_CODE_SHOW` to `true` to enable.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_EXIT_CODE_SHOW` | `false` | Show the exit code of the previous command |
| `GYARADOS_EXIT_CODE_PREFIX` | ` ` | Prefix of exit code |
| `GYARADOS_EXIT_CODE_SUFFIX` | ` ` | Suffix of exit code |
| `GYARADOS_EXIT_CODE_SYMBOL` | `✘` | Symbol before the exit code, upon failure |
| `GYARADOS_EXIT_CODE_COLOR` | `red` | Color of exit code section |

### Char  \(`char`\)

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `GYARADOS_CHAR_PREFIX` | ` ` | Prefix before prompt character |
| `GYARADOS_CHAR_SUFFIX` | ` ` | Suffix after prompt character |
| `GYARADOS_CHAR_SYMBOL` | `➜` | Prompt character to be shown before any command |
| `GYARADOS_CHAR_COLOR_SUCCESS` | `green` | Color of prompt character if last command completes successfully |
| `GYARADOS_CHAR_COLOR_FAILURE` | `red` | Color of prompt character if last command returns non-zero exit-code |
