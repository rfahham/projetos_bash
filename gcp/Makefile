COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

## Lista os scripts de teste
lista:
	clear
	@echo "${COLOR_YELLOW}----------------------------------------${COLOR_RESET}"
	@echo "make list - Lista as instâncias no GCP"
	@echo "make start - Inicializa as instâncias no GCP"
	@echo "make stop - Stopa as instâncias no GCP"
	@echo "${COLOR_YELLOW}----------------------------------------${COLOR_RESET}"

## Lista as instâncias no GCP
list:
	clear
	@echo "${COLOR_YELLOW}--------------------------${COLOR_RESET}"
	@echo "Lista as instâncias no GCP"
	@echo "${COLOR_YELLOW}--------------------------${COLOR_RESET}"
	@echo ""
	gcloud compute instances list
	@echo "" 

## Inicializa as instâncias no GCP
start:
	clear
	@echo "${COLOR_YELLOW}-------------------------------${COLOR_RESET}"
	@echo "Inicializa as instâncias no GCP"
	@echo "${COLOR_YELLOW}-------------------------------${COLOR_RESET}"
	@echo ""
	 "${COLOR_GREEN}Instâncias Iniciadas !!!${COLOR_RESET}"
	@echo "" 

## Stopa as instâncias no GCP
stop:
	clear
	@echo "${COLOR_YELLOW}--------------------------${COLOR_RESET}"
	@echo "Parar as instâncias no GCP"
	@echo "${COLOR_YELLOW}--------------------------${COLOR_RESET}"
	@echo ""
	 "${COLOR_RED}Instâncias Paradas !!!${COLOR_RESET}"
	@echo "" 

