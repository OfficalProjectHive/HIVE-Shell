    cur=$(pwd)
    homedir=$cur
    directorymaybe=$cur
    crosDir=$cur/CrosItems
    user=
    helpShown=
    flushhelpshown=

    echo "[*]====================================================[*]"
    echo "[*]               Welcome to HIVE Shell                [*]"
    echo "[*]                                                    [*]"
    echo "[*]       A Sub-Shell Developed By Wave Demure         [*]"
    echo "[*]                                                    [*]"
    echo "[*]              Creating Directorys...                [*]"
    echo "[*]                                                    [*]"
    echo "[*]                Build. BETA 0.0.2                   [*]"
    echo "[*]====================================================[*]"
   
    if test -d NewShell; then
        echo
    else
        mkdir NewShell
    fi
    cd NewShell
    cur=$(pwd)  

    if test -d CrosItems; then
        echo
    else
        mkdir CrosItems
    fi
sleep 1


    # Stuffs
        # Check for user Info

            # Reprint
            clear
            echo "[*]====================================================[*]"
            echo "[*]                    HIVE Shell                      [*]"
            echo "[*]                                                    [*]"
            echo "[*]       A Sub-Shell Developed By Wave Demure         [*]"
            echo "[*]                                                    [*]"
            echo "[*]               Getting User Info...                 [*]"
            echo "[*]                                                    [*]"
            echo "[*]                Build. BETA 0.0.2                   [*]"
            echo "[*]====================================================[*]"
        # True Check
            if test -e username.txt; then
                user=$(cat username.txt)
            else
                read -p "Enter Your Username> " userCheck
                user=$userCheck
                touch username.txt
                echo "$userCheck" > username.txt
            fi
        # Drop Shell

            #Reprint
            clear
            echo "[*]====================================================[*]"
            echo "[*]                    HIVE Shell                      [*]"
            echo "[*]                                                    [*]"
            echo "[*]       A Sub-Shell Developed By Wave Demure         [*]"
            echo "[*]                                                    [*]"
            echo "[*]                Entering Shell...                   [*]"
            echo "[*]                                                    [*]"
            echo "[*]                Build. BETA 0.0.2                   [*]"
            echo "[*]====================================================[*]"
        # Dropping    
        sleep 1
        clear
    # yea
  
    shell() {

        help() {
            echo "These are the commands that you can use"
            echo "help  -  Shows a Help Screen"
            echo "clear - Clears the Sub-Shell"
            echo "exit/quit/close - Closes the Sub-Shell"
            echo "changename/namechange - changes the username"
            echo "resetshell/reset/reload - restart the shell"
            echo "whoami/user - displays the username"
            echo "buildshim - Opens the HIVE Shim Builder"
        }
        helpText() {
            echo "Welcome to the HIVE Shell, $user"
            echo
            echo "Type Help for Command List"
            echo
            echo "Or type exit to close"
            echo
        }
        newName() {
            echo -n "Enter Your new username> "
            read NewUserName
            user=$NewUserName
            echo $NewUserName > $cur/username.txt
        }
        printName() {
            echo $user
            echo
            echo "You can change the name by running the command changename"
        }
        buildShim() {
           echo "womp womp"
        }
        aboutCommand() {
            echo
            echo "HIVE Sub-Shell"
            echo ""
            echo "Made By Wave Demure"
            echo ""
            echo "Current Build BETA 0.0.2"
        }
        changeDir() {
            read -p "Input Directory > " directorymaybe
            if test -d $directorymaybe; then
                cd $directorymaybe
                if [[ $directorymaybe == "" ]]; then
                    fullpath=$(readlink -f /home/$(whoami))
                else
                    fullpath=$(readlink -f $directorymaybe)
                fi
            else
                echo "Thats not a Directory"
            fi
        }
        execute() {
            read -p "Input File Location > " executeCommand
            if test -e $executeCommand; then
                ./$executeCommand
            else
                echo "Not a file lol"
            fi
        }
        creatingshim() {
            exec shelltools/builder.sh
        }
        createfile() {
            read -p "Input File name> " filetp
            touch $filetp
        }
        echonew() {
            removecho=("echo")

            remove_word() (
                set -f
                IFS=' '

                s=$1
                w=$2

                set -- $1
                for arg do
                    shift
                    [ "$arg" = "$w" ] && continue
                    set -- "$@" "$arg"
                done

                printf '%s\n' "$*"
            )

            remove_word "$commandInput" "$removecho"

        }

        entertest() {
            runcmd() {
                eval $testcmd
                if [ $? -eq 0 ]; then
                    test
                else
                    clear
                    echo "Command failed"
                fi
            }
            if [[ $flushhelpshown == "" ]]; then
                echo "welcome to the flush shell"
                echo
                echo "most commands will work here"
                echo
                echo "exit to leave flush"
                echo
                flushhelpshown="funny"
            fi
            read -p "flush> " testcmd
            
            case $testcmd in
                exit) flushhelpshown=""; return;;
                forceexit) echo "Exiting HIVE..."; sleep 2; echo "Thanks for using HIVE"; echo "Made By Wave Demure"; exit;;
                *) runcmd ;;
            esac
            entertest
        }
        flush() {
            echo "flush - a cmd manager for HIVE"
            echo
            echo "flush sh - enter shell with most normal bash commands"
            echo "more will be added soon"
        }
        flux() {
            cd $homedir
            gnome-terminal -- bash -c 'exec ./FakeShell.sh'
        }
        if [[ $helpShown == "" ]]; then
            helpText
            helpShown="sil"
        fi
        echo -n -e "\033[0;31m$user\033[0m@\033[0;31mHIVE\033[0m ~ \033[0;32m$fullpath\033[0m >\033[0m "
        read commandInput

        # Send Command Trough Check

        case $commandInput in
            help | Help)  help;;
            clear) clear ;;
            exit | quit | close) echo "Exiting HIVE..."; sleep 2; echo "Thanks for using HIVE"; echo "Made By Wave Demure"; exit ;;
            changename | namechange) newName ;;
            whoami | username) printName ;;
            buildshim | createshim) creatingshim ;;
            about) aboutCommand ;;
            list | ls) ls ;;
            cd) changeDir ;;
            exec) execute;;
            deleteuser) rm -f $cur/username.txt; echo "Deleted user $user"; ;;
            "flush sh") entertest ;;
            flush) flush;;
            echo*) echonew ;;
            flux) flux;;
            *) echo "$commandInput Is an Unknown Command";;
        esac

        shell
    }
    shell   
