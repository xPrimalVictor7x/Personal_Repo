if [ $1 ];then
	# space
	echo -e "${CYAN}[*] Starting Recon on $2 at $1...${NC}"
	IP=$1
	Name=$2
    dir_name=$Name
	mkdir $dir_name
	cd $dir_name/
	touch $IP
fi