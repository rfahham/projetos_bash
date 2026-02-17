# O que é Shell Script?

**Shell Script** é um arquivo de texto contendo uma sequência de comandos que são executados por um interpretador de comandos (shell) do sistema operacional.

No Linux e macOS, o shell mais comum é o **Bash (Bourne Again Shell)**. No Windows moderno, temos alternativas como o **PowerShell**.

Ele é usado para:

* Automatizar tarefas repetitivas
* Criar rotinas de backup
* Instalar e configurar sistemas
* Processar arquivos em lote
* Orquestrar execução de programas

---

# 🧠 O que é “Shell”?

O **Shell** é a interface que permite interagir com o sistema operacional via linha de comando.

Exemplos de shells populares:

* Bash
* Zsh
* PowerShell

---

# 📄 Estrutura de um Shell Script

Um script normalmente começa com:

```bash
#!/bin/bash
```

Isso é chamado de **shebang** — indica qual interpretador deve executar o script.

Exemplo simples:

```bash
#!/bin/bash

echo "Olá, mundo!"
```

---

# ▶️ Como criar e executar

## 1️⃣ Criar o arquivo

```bash
nano script.sh
```

## 2️⃣ Dar permissão de execução

```bash
chmod +x script.sh
```

## 3️⃣ Executar

```bash
./script.sh
```

---

# 📌 Conceitos Básicos

## 🔹 Variáveis

```bash
nome="João"
echo "Olá, $nome"
```

Observação: não usar espaço ao redor do `=`.

---

## 🔹 Entrada do usuário

```bash
echo "Digite seu nome:"
read nome
echo "Olá, $nome"
```

---

## 🔹 Condições (if)

```bash
if [ "$idade" -ge 18 ]; then
  echo "Maior de idade"
else
  echo "Menor de idade"
fi
```

Operadores comuns:

* `-eq` igual
* `-ne` diferente
* `-gt` maior que
* `-lt` menor que
* `-ge` maior ou igual
* `-le` menor ou igual

---

## 🔹 Laços (loops)

### For

```bash
for i in 1 2 3
do
  echo "Número: $i"
done
```

### While

```bash
contador=1
while [ $contador -le 5 ]
do
  echo $contador
  contador=$((contador+1))
done
```

---

## 🔹 Funções

```bash
saudacao() {
  echo "Olá, $1"
}

saudacao "Maria"
```

---

# 🛠️ Exemplo Prático: Backup Automático

```bash
#!/bin/bash

data=$(date +%Y-%m-%d)
tar -czf backup-$data.tar.gz /home/usuario/documentos

echo "Backup realizado com sucesso!"
```

Esse script:

* Gera data automática
* Compacta arquivos
* Cria backup nomeado com data

---

# 📂 Onde Shell Script é muito usado?

* Administração de servidores Linux
* DevOps
* CI/CD
* Automação de deploy
* Configuração de ambientes

Ferramentas modernas como Docker, Git e Kubernetes utilizam scripts shell em muitos processos internos.

---

# ⚠️ Boas Práticas

✔️ Sempre usar `#!/bin/bash`
✔️ Usar aspas em variáveis: `"$variavel"`
✔️ Validar entradas do usuário
✔️ Comentar o código
✔️ Tratar erros (`set -e`)

---

# 📌 Vantagens

* Simples e direto
* Nativo em sistemas Unix/Linux
* Ideal para automação

# 📌 Limitações

* Difícil manutenção em scripts muito grandes
* Não é ideal para aplicações complexas
* Debug pode ser mais complicado

---

Próximos passos:

* Diferença entre Bash e PowerShell
* Como fazer menu interativo
* Como tratar erros corretamente
* Como usar parâmetros (`$1`, `$2`, etc.)
* Como integrar com cron (agendamento automático)
