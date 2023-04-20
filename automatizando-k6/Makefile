COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

TEMP_FILES_REMOVE= 10.* authn-performance-tests

PROJECT := TAAS - K6

setup-%:
	cd infra/terraform && ${MAKE} terraform-plan TF_VAR_env=$*

layout:
	@echo "\n${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"
	@echo "\n${COLOR_YELLOW}[${PROJECT}] ${MESSAGE} ${COLOR_RESET}"
	@echo "${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"

## Configura o ambiente do TAAS.
prepare:
	@${MAKE} layout MESSAGE="Configura o ambiente para execução Local"
	@/bin/bash scripts/k6tt.sh -p

## Cria os ambientes para execução.
create:
	@${MAKE} layout MESSAGE="Cria os ambientes "
	@/bin/bash scripts/k6tt.sh -a create

## Configura os ambientes para execução.
setup:
	@${MAKE} layout MESSAGE="Configura os ambientes "
	@/bin/bash scripts/k6tt.sh -a setup

## Executa um script de teste.
run:
	@${MAKE} layout MESSAGE="Configura e Executa os testes "
	@/bin/bash scripts/k6tt.sh -a run

## Executa um comando ad hoc.
cmd:
	@${MAKE} layout MESSAGE="Roda Comando fornecido pelo usuario "
	@/bin/bash scripts/k6tt.sh -a cmd

## Atualiza as informações modificadas para preparação do ambiente.
update:
	@${MAKE} layout MESSAGE="Atualiza os testes "
	@/bin/bash scripts/k6tt.sh -a update

## Realiza o upload dos resultados para o report.
upload:
	@${MAKE} layout MESSAGE="Realiza o upload dos resultados para o report"
	@/bin/bash scripts/k6tt.sh -a upload

## Verifica o custo do teste.
infracost:
	@${MAKE} layout MESSAGE="Verifica o custo do teste "
	@/bin/bash scripts/k6tt.sh -a infracost

## Realiza a limpeza do ambiente local.
clean:
	@${MAKE} layout MESSAGE="Realiza a limpeza no ambiente Local"
	@/bin/bash scripts/k6tt.sh -c

## Remove ambiente do TAAS.
destroy:
	@${MAKE} layout MESSAGE="Remove ambiente"
	@/bin/bash scripts/k6tt.sh -a destroy

## Exibe os comandos disponíveis.
help:
	@echo "\n${COLOR_YELLOW}\n------------\n${PROJECT}\n------------\n${COLOR_RESET}"
	@awk '/^[a-zA-Z\-\_0-9\.%]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "${COLOR_COMMAND}$$ make %s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort
	@printf "\n\n"
