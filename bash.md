# 📘 Documentação — Bash (Bourne Again Shell)

## 🧠 O que é Bash?

O **Bash** é um **interpretador de comandos** que faz a ponte entre o usuário e o sistema operacional Linux/Unix.

Ele permite executar comandos, automatizar tarefas e criar scripts.

O Bash é uma evolução do shell original Unix chamado **Bourne shell (sh)** e foi desenvolvido como parte do projeto **GNU Project**, sendo criado por **Brian Fox**.

Seu nome significa:

> **Bourne Again Shell**

---

# 🖥️ Interfaces de interação

O sistema pode ser utilizado de duas formas principais:

## 🔹 CLI — Command Line Interface

Interface de Linha de Comando
Interação por texto (terminal).

Exemplo:

```bash
ls -la
```

## 🔹 GUI — Graphical User Interface

Interface Gráfica do Usuário
Interação visual com janelas, ícones e mouse.

Exemplo: ambientes gráficos como GNOME ou KDE.

O Bash é utilizado na **CLI**.

---

# 📂 Localização do interpretador (Shebang)

Em scripts, a primeira linha indica qual interpretador será usado:

### 🔹 Bourne Shell (sh)

```bash
#!/bin/sh
```

### 🔹 Bash

```bash
#!/bin/bash
```

Essa linha é chamada de **shebang**.

Ela informa ao sistema qual programa deve executar o script.

---

# 🔎 Descobrindo qual é o shell padrão

## Ver o shell atual do usuário

```bash
printenv SHELL
```

ou

```bash
echo $SHELL
```

Exemplo de saída:

```
/bin/bash
```

---

## Ver todos os shells disponíveis no sistema

```bash
cat /etc/shells
```

Exemplo:

```
/bin/sh
/bin/bash
/bin/dash
/bin/zsh
```

---

# 🔄 Alterar o shell padrão

Para mudar o shell do usuário atual:

```bash
chsh -s /bin/bash
```

Após isso, é necessário fazer logout/login.

---

# 👥 Ver o shell de todos os usuários do sistema

```bash
cut -d: -f1,7 /etc/passwd
```

Saída exemplo:

```
root:/bin/bash
daemon:/usr/sbin/nologin
usuario:/bin/bash
```

Explicação:

O arquivo `/etc/passwd` contém informações dos usuários, separadas por `:`.

Campos principais:

1. Nome do usuário
2. Senha (placeholder)
3. UID
4. GID
5. Comentário
6. Diretório home
7. Shell padrão

---

# 📌 Resumo

| Conceito    | Explicação                         |
| ----------- | ---------------------------------- |
| Bash        | Interpretador de comandos do Linux |
| CLI         | Interface por linha de comando     |
| GUI         | Interface gráfica                  |
| Shebang     | Define o interpretador do script   |
| /etc/shells | Lista shells disponíveis           |
| chsh        | Altera o shell padrão              |

---

# 🎯 Por que aprender Bash?

✔️ Administração de servidores
✔️ Automação de tarefas
✔️ DevOps
✔️ Manipulação de arquivos
✔️ Execução remota via SSH
✔️ Criação de scripts

---

Se quiser, posso complementar com:

* Diferença entre `sh`, `bash` e `dash`
* Variáveis no Bash
* Redirecionamento (`>`, `>>`, `2>`)
* Pipes (`|`)
* Estrutura de scripts profissionais
* Boas práticas para produção 🚀
