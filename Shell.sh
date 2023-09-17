    cur=$(pwd)
    directorymaybe=$cur
    crosDir=$cur/CrosItems
    user=
    helpShown=

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
    cur=$(pwd)
    cd NewShell

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
            read -p "Enter Your Username> " userCheck
            user=$userCheck
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
        checkpack() {
            isGit=$(which git)
            isWget=$(which wget)
            isCgpt=$(which cgpt)

            if [[ $isGit != "" ]]; then
                echo "Git is installed"
            fi

            if [[ $isWget != "" ]]; then
                echo "wget is installed"
            fi

            if [[ $isCgpt != "" ]]; then
                echo "cgpt is installed"
            fi


            if [[ $isCgpt != "" && $isGit != "" && $isWget != "" ]]; then
                echo "All Packages Installed"
            else
                echo "You need to install"
                if [[ $isGit == "" ]]; then
                    echo "Git"
                fi

                if [[ $isWget == "" ]]; then
                    echo "wget"
                fi

                if [[ $isCgpt == "" ]]; then
                    echo "cgpt"
                fi
            fi
        }
        creatingshim() {
            exec shelltools/builder.sh
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
        if [[ $helpShown == "" ]]; then
            helpText
            helpShown="sil"
        fi
        echo -n -e "\033[0;31m$user\033[0m@\033[0;31mHIVE\033[0m ~ \033[0;32m$directorymaybe\033[0m >\033[0m "
        read commandInput

        # Send Command Trough Check

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
            echo*) echonew ;;
            *) echo "$commandInput Is an Unknown Command";;
        esac

        shell
    }
    shell   
