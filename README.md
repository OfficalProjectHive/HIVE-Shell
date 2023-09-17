<h1 align="center">HIVE-Shell</h1>

# What Does this do
  This is a project we made to not only learn more bash<br>
  but to also a project to hold all of our shell scripts in in<br>
**Very Unstable** State At the moment

# Usage

```bash
  git clone https://github.com/ProjectChrome/HIVE-Shell
  cd HIVE-Shell
  sudo bash Shell.sh
```

build Version BETA 0.0.1

# Current Commands
```bash
    case $commandInput in
            help | Help)  help;;
            clear) clear ;;
            exit | quit | close) echo "Exiting HIVE..."; sleep 2; echo "Thanks for using HIVE"; echo "Made By Wave Demure"; exit ;;
            changename | namechange) newName ;;
            whoami | username) printName ;;
            buildshim | createshim) buildShim ;;
            about) aboutCommand ;;
            list | ls) ls ;;
            cd) changeDir ;;
            exec) execute;;
            *) echo "$commandInput Is an Unknown Command";;
        esac
```
