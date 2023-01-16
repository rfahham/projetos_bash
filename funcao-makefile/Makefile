COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

PROJECT := == Operações Matemáticas ==

layout:
	@echo "\n${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"
	@echo "\n${COLOR_YELLOW}[${PROJECT}] ${MESSAGE} ${COLOR_RESET}"
	@echo "${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"

## Soma entre dois números.
soma:
	@${MAKE} layout MESSAGE="Soma dois números"
	@/bin/bash funcao.sh -a Soma

## Subtração entre dois números.
subtracao:
	@${MAKE} layout MESSAGE="Subtração entre dois números"
	@/bin/bash funcao.sh -a Subtracao

## Multiplicação entre dois números.
multiplicacao:
	@${MAKE} layout MESSAGE="Multiplicação entre dois números"
	@/bin/bash funcao.sh -a Multiplicacao

## Divisão entre dois números.
divisao:
	@${MAKE} layout MESSAGE="Divisão entre dois números"
	@/bin/bash funcao.sh -a Divisao

## Exibe as operações disponíveis.
help:
	@echo "\n${COLOR_YELLOW}\n---------------------------\n${PROJECT}\n---------------------------\n${COLOR_RESET}"
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
