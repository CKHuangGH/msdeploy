###update mck8s_lsv and ready key, known host, and write ip to config
uniq $OAR_NODEFILE > node_list
manage=$(awk NR==1 node_list)
git clone https://github.com/CKHuangGH/mck8s_lsv.git
git clone https://github.com/CKHuangGH/rntsm.git
chmod 777 /home/chuang/msdeploy/script/rmsr.sh

for i in $(cat node_list)
do
	sh /home/chuang/msdeploy/script/rmsr.sh $i $manage &
done
echo "management node is $manage"