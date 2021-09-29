#vdir is a dir manager for vagrant projects
#define the vagrant virtuals boxes directory
set VAGRANT_DIR '/home/user/vagrant_boxes_directory/'
function vdir --description 'manage the vagrant boxes in a specific directory'
    clear
    # Move to the directory and list all the folders
    cd $VAGRANT_DIR
    set v_list (ls -1)
    echo "Vagrant's Boxes"

    # List all the folders
    set j (math 0+1)
    for i in $v_list
        echo $j ")" $i
        set j (math $j+1)
    end
    echo '0 ) Exit'


    read num
    if test $num -eq 0
        return 0
    end
    #move the vbox directory
    set vm_dir $VAGRANT_DIR$v_list[$num]
    set vm_name $v_list[$num]
    cd $vm_dir
    clear
    while test $num -gt 0
        echo ""
        set_color  red
        echo '--------------------------------------'
        echo '|' $vm_name
        echo '--------------------------------------'
        set_color normal
        echo "1) Check Status"
        echo "2) Start VM"
        echo "3) Poweoff VM"
        echo "4) SSH"

        read num

        if test $num -eq 1 #Show VBox Status
            clear
            set_color blue
            echo (vagrant status)
            set_color normal
        else if test $num -eq 2 #Start VBox
            clear
            vagrant up
        else if test $num -eq 3 #Halt VBox
            clear
            vagrant halt
        else if test $num -eq 4 #SSH VBOX
            clear
            vagrant ssh
            # Exit
        else if test $num -eq 0
            clear
            return 0
        end
    end
end
