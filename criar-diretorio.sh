# Imprimindo data e hora 
# Ex.: Sex 9 Dez 2022 18:39:35 -03
# data=$(date)

# Imprimindo só a data
# Ex.: 2022-12-09
data=$(date +%F)
echo $data

if [ ! -d "$data" ]
then
	mkdir $data
fi