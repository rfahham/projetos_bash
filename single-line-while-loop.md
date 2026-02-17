# Bash — Loop `while` infinito em uma única linha

Um loop `while` infinito em Bash é muito usado para **monitoramento contínuo**, **testes repetitivos** ou **execução periódica de comandos**.

A sintaxe básica em uma única linha é:

```bash
while true; do COMANDO; sleep INTERVALO; done
```

### Estrutura explicada

* `while true` → condição sempre verdadeira (loop infinito)
* `do` → início do bloco
* `COMANDO` → ação a ser executada
* `sleep` → pausa entre execuções
* `done` → fim do bloco
* `;` → separador obrigatório em comandos de linha única

---

# 📌 Exemplos práticos

## 🔎 Listar arquivos a cada 5 segundos

```bash
while true; do ls -la; sleep 5; done
```

---

## 🌐 Monitorar conexões TCP a cada 5 segundos

```bash
while true; do ss -s; sleep 5; done
```

---

## 💭 Executar enquanto o `sleep` retornar sucesso

Forma alternativa e elegante:

```bash
while sleep 2; do echo "thinking"; done
```

Explicação:

* `sleep 2` executa
* Se retornar sucesso (`exit code 0`), o loop continua
* Evita precisar escrever `true`

---

## 📸 Criar arquivos com timestamp a cada 5 segundos

⚠️ Versão correta (com `;` obrigatórios):

```bash
while true; do touch "pic-$(date +%s).jpg"; sleep 5; done
```

Melhor prática:

* Usar `$(...)` em vez de crase `` ` ``
* Colocar aspas quando possível

---

## 🌍 Monitorar status HTTP de um site

```bash
while true; do curl -LI https://www.globo.com -o /dev/null -w 'Status code %{http_code}\n' -s; sleep 5; done
```

---

## 🔬 Debug detalhado com curl

```bash
while true; do curl -v https://www.globo.com; sleep 10; done
```

---

# 🛑 Como parar o loop

Pressione:

```
CTRL + C
```

---

# 🧠 Boas práticas

✔️ Sempre usar `sleep` para evitar sobrecarga da CPU
✔️ Preferir `$(comando)` ao invés de crases
✔️ Usar aspas em variáveis
✔️ Considerar logs ao invés de apenas saída na tela

Exemplo com log:

```bash
while true; do date >> monitor.log; sleep 60; done
```

---

# 🎯 Dica profissional

Para monitoramento contínuo de comandos como `ls`, muitas vezes é melhor usar:

```bash
watch -n 5 ls -la
```

O comando `watch` já executa repetidamente com intervalo definido e formatação adequada.

---

Próximos passos:

* Tratamento de erro dentro do loop
* Captura de código de saída (`$?`)
* Timeout automático
* Execução em background
* Transformar em script reutilizável
