    cur=$(pwd)
    crosDir=$cur/CrosItems
    user=
    helpShown=

    echo "[]====================================================[]"
    echo "[]               Welcome to HIVE Shell                []"
    echo "[]                                                    []"
    echo "[]       A Sub-Shell Developed By Wave Demure         []"
    echo "[]                                                    []"
    echo "[]              Creating Directorys...                []"
    echo "[]                                                    []"
    echo "[]                Build. Pre 0.0.1                    []"
    echo "[]====================================================[]"
   
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



    # Stuffs
        # Check for user Info

            # Reprint
            clear
            echo "[]====================================================[]"
            echo "[]                    HIVE Shell                      []"
            echo "[]                                                    []"
            echo "[]       A Sub-Shell Developed By Wave Demure         []"
            echo "[]                                                    []"
            echo "[]               Getting User Info...                 []"
            echo "[]                                                    []"
            echo "[]                Build. Pre 0.0.1                    []"
            echo "[]====================================================[]"
        # True Check
            read -p "Enter Your Username> " userCheck
            user=$userCheck
        # Drop Shell

            #Reprint
            clear
            echo "[]====================================================[]"
            echo "[]                   HIVE Shell                       []"
            echo "[]                                                    []"
            echo "[]       A Sub-Shell Developed By Wave Demure         []"
            echo "[]                                                    []"
            echo "[]                Entering Shell...                   []"
            echo "[]                                                    []"
            echo "[]                Build. Pre 0.0.1                    []"
            echo "[]====================================================[]"
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
            echo "Welcome to the HIVE Shell $user"
            echo
            echo "Type Help for Command List"
            echo
            echo "Or type exit to close"
        }
        newName() {
            echo -n "Enter Your new username> "
            read NewUserName
            user=$NewUserName
        }
        resetShell() {
           echo "Getting File location"
           sleep 1
           echo
           pathtroll=$(find . -iname FakeShell.sh)
           sleep 1
           exec $pathtroll
        }
        printName() {
            echo $user
            echo
            echo "You can change the name by running the command changename"
        }
        buildShim() {
            cd CrosItems
            clear
            echo "[]====================================================[]"
            echo "[]                 HIVE Shim Builder                  []"
            echo "[]                                                    []"
            echo "[]          An all in one sh1mmer builder             []"
            echo "[]                                                    []"
            echo "[]              Enter your board below                []"
            echo "[]                 To get started                     []"
            echo "[]====================================================[]"
            read -p "[Input Board]> " board

            echo "Grabbing Packages"

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
                read -p "Press Enter to Continue"
                return
            fi

            if test -d $board; then
                echo "Found $board Dir"
            else
                echo "Creating"
                mkdir $board
            fi

            cd $board
            if test -e index.html?path=%2F$board.zip; then
                echo "Found $board Zip"
            else
                echo "Did not Find $board Zip"
                echo "Downloading..."
                wget -q https://dl.osu.bio/api/raw/?path=/$board.zip

                if [ $? -ne 0 ]; then
                    echo "No Board Found"
                    sleep 3
                    return
                fi
            fi

            unzip index.html?path=%2F$board.zip

            rm -f index.html?path=%2F$board.zip

            if [[ $board == "hana" || $board == "coral" ]]; then
                echo "legacy detected"
                echo "legacy not supported yet"
                sleep 5
                return
            else
                git clone https://github.com/ProjectChrome/sh1mmer
                cd sh1mmer/wax
                wget https://dl.sh1mmer.me/build-tools/chromebrew/chromebrew-dev.tar.gz
                sudo bash wax.sh $board.bin --dev
            fi

            ShimLocation=$(find . -iname $board.bin)
            echo "Your Shim is located at $ShimLocation"
        }
        aboutCommand() {
            echo "HIVE Sub-Shell"
            echo ""
            echo "Current Build Pre 0.0.1"
            echo "Made By Wave Demure"
            echo ""
        }
        if [[ $helpShown == "" ]]; then
            helpText
            helpShown="sil"
        fi
        echo -n -e "\033[0;31m$user\033[0m@\033[0;31mHIVE\033[0m>\033[0m "
        read commandInput

        # Send Command Trough Check

        case $commandInput in
            help | Help)  help;;
            clear) clear ;;
            exit | quit | close) echo "Exiting HIVE..."; sleep 2; echo "Thanks for using HIVE"; echo "Made By Wave Demure"; exit ;;
            changename | namechange) newName ;;
            resetshell | reset | reload) resetShell ;;
            whoami | username) printName ;;
            buildshim | createshim) buildShim ;;
            *) echo "$commandInput Is an Unknown Command";;
        esac

        shell
    }
    shell
