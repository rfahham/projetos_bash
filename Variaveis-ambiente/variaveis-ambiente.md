# O que são variáveis de ambiente?

Variáveis de ambiente são **valores dinâmicos** armazenados pelo sistema operacional que podem ser acessados por programas em execução. Elas servem para configurar comportamentos sem precisar alterar o código da aplicação.

São muito usadas para:

* Guardar **credenciais** (ex: tokens, senhas)
* Definir **configurações de ambiente** (desenvolvimento, teste, produção)
* Configurar caminhos do sistema (como a variável `PATH`)
* Controlar flags de execução (`DEBUG=true`)

---

# 📌 Exemplos de Uso

## 1️⃣ Definindo uma variável

### 🐧 Linux / macOS (Bash ou Zsh)

**Temporária (só na sessão atual):**

```bash
export API_KEY="123456"
```

**Permanente (adicionando no ~/.bashrc ou ~/.zshrc):**

```bash
export API_KEY="123456"
```

Depois:

```bash
source ~/.bashrc
```

---

### 🪟 Windows (PowerShell)

**Temporária (sessão atual):**

```powershell
$env:API_KEY="123456"
```

**Permanente (usuário atual):**

```powershell
setx API_KEY "123456"
```

---

## 2️⃣ Usando a variável

### 🐧 Linux / macOS

```bash
echo $API_KEY
```

### 🪟 Windows (PowerShell)

```powershell
echo $env:API_KEY
```

---

## 3️⃣ Usando no código

### 🐍 Python

```python
import os

api_key = os.getenv("API_KEY")
print(api_key)
```

---

### 🟢 Node.js

```javascript
console.log(process.env.API_KEY);
```

---

# 🗑️ Como remover variáveis de ambiente

## 🐧 Linux / macOS

**Remover da sessão atual:**

```bash
unset API_KEY
```

**Remover permanente:**

* Apagar a linha do `~/.bashrc`, `~/.zshrc` ou `/etc/environment`
* Rodar:

```bash
source ~/.bashrc
```

---

## 🪟 Windows (PowerShell)

**Remover da sessão atual:**

```powershell
Remove-Item Env:API_KEY
```

**Remover permanente:**

```powershell
setx API_KEY ""
```

Ou remover pelas **Configurações do Sistema → Variáveis de Ambiente**.

---

# ⚙️ Exemplo Prático Real

Imagine uma aplicação que se conecta a um banco:

```python
import os

db_host = os.getenv("DB_HOST", "localhost")
db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")
```

Você poderia configurar:

```bash
export DB_HOST="192.168.1.10"
export DB_USER="admin"
export DB_PASSWORD="senha_super_secreta"
```

Assim:

* O código não expõe senha
* Cada ambiente pode ter configurações diferentes
* Facilita deploy em servidores ou containers (ex: Docker)

---

# 🔐 Boas Práticas

✔️ Nunca versionar `.env` com senhas
✔️ Usar arquivos `.env` em desenvolvimento
✔️ Usar serviços de secret manager em produção
✔️ Definir valores padrão quando possível

---

Se quiser, posso explicar também:

* Como usar arquivo `.env`
* Como funciona no Docker
* Como funciona em aplicações web (ex: React, Next.js)
* Diferença entre variável de sessão e variável global do sistema
