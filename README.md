# bash_logging

This File provides you with basic functionalities for logging any command, be it build or simple 'ls'. This project intended to work along will all the unix/linux based terminals. The functions are built for bash/zsh shells. But these can be tweaked to work with other shells as well. (You are welcome to clone and contribute to this repository). This file gives you idea about the installation usage and function of commands.

- These functions use `.logs` directory in the home folder to store the logs.
- Its context is linked to the current directory in which you work. So if you have two directories with same name it might consider it as same context.
- It saves logs in seperate folders which are used for context which is linked to the present directory name.
- These functions use date and basename commands to function

## How to Install/Build

   Assuming the usage in linux/unix based systems for which it is built. you have to add this line to your `.bashrc` or `.zshrc` or any profile you would wish to

```bash
source <Path to this directory>/functions.sh
```

example:

```zsh
source ~/bash_logging/functions.sh
```

## Usage

### ```bash mlog <cmd>```

- The function is used to capture the logs.
- mlog stands for 'make log'.
usage:

```bash
mlog <command with arguments>
# To capture the logs of the command
```

example:

```bash
mlog mvn clean install # To capture the logs of the installation
```

### ```bash glog <number: optional>```

- The function is used to see the logs.
- It shows the logs in less format.
- Press q to exit the log mode.
- glog stands for 'get log'.
usage:

```bash
glog <number: optional> # The number is to see the older log => 1 - latest, 2 - 2nd oldler,.., n - n-th log from latest one
```

example:

```bash
glog # To get latest logs
glog n # To get n-th previous log from latest
```

### ```bash llog <number: optional>```

- The function is used to see the logs live.
- Press ctrl+c to exit the live log mode.
- llog stands for 'live log'.
usage:

```bash
llog <number: optional> # The number is to see the older live log => 1 - latest, 2 - 2nd oldler,.., n - n-th log from latest one
```

example:

```bash
llog # To get latest live logs
llog n # To get n-th previous live log from latest
```
