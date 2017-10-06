# Vagrant aliases
alias vg="vagrant global-status"
alias vh="vagrant halt $1"
alias vr="vagrant ssh $1 -c 'sudo su -'"
alias vs="vagrant status"
alias vssh="vagrant ssh $1"
alias vu="vagrant up $1"

# Vagrant functions
vd() {
    for VAGRANT_HOST in $@; do
        cert_name=$(vagrant ssh puppet -c "sudo puppet cert list -all" 2> /dev/null|grep "${VAGRANT_HOST}-${USER}\.dev.*"|awk '{gsub("\"", "", $2);print $2}')

        echo -n "Press ENTER to delete ${cert_name}..."
        read

        vagrant ssh puppet -c "sudo puppet cert clean ${cert_name}"
        vagrant destroy -f ${VAGRANT_HOST}
    done
}
