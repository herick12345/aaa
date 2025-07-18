# Sistema Escoteiro - Ramo Lobinho

Sistema de gerenciamento para o ramo lobinho do movimento escoteiro, desenvolvido em Spring Boot com frontend web.

## 🏕️ Funcionalidades

- **Gestão de Jovens**: Cadastro completo com dados pessoais, contatos e responsáveis
- **Especialidades**: Controle de especialidades por área de conhecimento
- **Progressão**: Acompanhamento individual do progresso dos jovens
- **Distintivos**: Controle de distintivos de progressão (Lobo Pata Tenra até Cruzeiro do Sul)
- **Insígnias**: Gerenciamento de insígnias de interesse especial
- **Relatórios**: Relatórios de progressão e jovens aptos ao Cruzeiro do Sul

## 🛠️ Tecnologias Utilizadas

- **Backend**: Spring Boot 3.5.3, Spring Data JPA, MySQL
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Banco de Dados**: MySQL 8.0 (Docker)
- **Build**: Gradle 8.14.2
- **Containerização**: Docker & Docker Compose

## 🚀 Como Executar

### Pré-requisitos
- Java 17+
- Docker
- VSCode (recomendado)

### 1. Clonar o Repositório
```bash
git clone <url-do-repositorio>
cd sistema-escoteiro
```

### 2. Iniciar o Servidor MySQL
Execute o comando Docker conforme especificado na disciplina:

```bash
# Comando básico (dados temporários)
docker run -d --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senhaRoot \
-e MYSQL_DATABASE=bcd -e MYSQL_USER=aluno -e MYSQL_PASSWORD=aluno \
-e MYSQL_ROOT_HOST='%' --name meumysql mysql/mysql-server:latest

# Comando com persistência de dados (recomendado)
docker run -d --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senhaRoot \
-e MYSQL_DATABASE=bcd -e MYSQL_USER=aluno -e MYSQL_PASSWORD=aluno \
-e MYSQL_ROOT_HOST='%' -v $(pwd)/db_data:/var/lib/mysql \
--name meumysql mysql/mysql-server:latest
```

### 3. Configurar VSCode (Opcional)
Instale as extensões recomendadas:
- Java Extension Pack
- Spring Boot Extension Pack
- SQLTools
- SQLTools MySQL Driver

### 4. Executar a Aplicação
```bash
# Via Gradle
./gradlew bootRun

# Ou via VSCode: Ctrl+Shift+P -> "Java: Run"
```

### 5. Acessar o Sistema
- **Aplicação Web**: http://localhost:8080
- **API REST**: http://localhost:8080/api
- **Documentação API**: http://localhost:8080/swagger-ui.html

## 🗄️ Conexão com Banco de Dados no VSCode

### Configuração Automática
O projeto já inclui configurações do SQLTools no `.vscode/settings.json`:

```json
{
    "sqltools.connections": [
        {
            "name": "Sistema Escoteiro - MySQL",
            "driver": "MySQL",
            "server": "localhost",
            "port": 3306,
            "database": "bcd",
            "username": "aluno",
            "password": "aluno"
        }
    ]
}
```

### Como Conectar
1. Instale a extensão **SQLTools** e **SQLTools MySQL Driver**
2. Pressione `Ctrl+Shift+P` e digite "SQLTools: Connect"
3. Selecione "Sistema Escoteiro - MySQL"
4. A conexão será estabelecida automaticamente

### Credenciais do Banco
- **Host**: localhost
- **Porta**: 3306 (padrão MySQL)
- **Database**: bcd
- **Usuário**: aluno
- **Senha**: aluno
- **Root Password**: senhaRoot

## 📊 Estrutura do Banco de Dados

### Principais Tabelas
- `Jovem` - Dados dos jovens lobinhos
- `Contato` - Informações de contato
- `Responsaveis` - Dados dos responsáveis
- `Especialidade` - Especialidades por área de conhecimento
- `RequisitoEspecialidade` - Requisitos de cada especialidade
- `DistintivosDeProgressao` - Distintivos (Lobo Pata Tenra, etc.)
- `Insignia` - Insígnias de interesse especial

### Lógica de Negócio
- **Níveis de Especialidade**:
  - Nível 1: 1/3 dos requisitos (33%)
  - Nível 2: 2/3 dos requisitos (67%)
  - Nível 3: 100% dos requisitos

- **Cruzeiro do Sul**: Requer Lobo Caçador + 1 insígnia + 5 especialidades em 3 áreas diferentes

## 🔧 Comandos Úteis

### Docker
```bash
# Iniciar MySQL (dados temporários)
docker run -d --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senhaRoot \
-e MYSQL_DATABASE=bcd -e MYSQL_USER=aluno -e MYSQL_PASSWORD=aluno \
-e MYSQL_ROOT_HOST='%' --name meumysql mysql/mysql-server:latest

# Parar MySQL
docker stop meumysql

# Ver logs do MySQL
docker logs -f meumysql

# Conectar via linha de comando
docker exec -it meumysql mysql -u aluno -p bcd
```

### Gradle
```bash
# Build completo
./gradlew clean build

# Executar aplicação
./gradlew bootRun

# Executar testes
./gradlew test

# Executar com logs coloridos
./gradlew bootRun
```

### VSCode Tasks
- `Ctrl+Shift+P` → "Tasks: Run Task"
- **Spring Boot Run**
- **Gradle Build**

## 📱 Interface Web

### Dashboard
- Estatísticas gerais do sistema
- Acesso rápido às funcionalidades principais

### Gestão de Jovens
- Cadastro completo com validações
- Filtros por nome e tipo sanguíneo
- Edição e exclusão de registros

### Acompanhamento de Progressão
- Visualização individual por jovem
- Barras de progresso por especialidade
- Registro de cumprimento de requisitos

### Relatórios
- Jovens aptos ao Cruzeiro do Sul
- Estatísticas de progressão

## 🧪 Dados de Exemplo

O sistema vem com dados pré-carregados:
- 4 jovens cadastrados
- 16 especialidades em 5 áreas
- 5 distintivos de progressão
- 5 insígnias de interesse especial
- Requisitos e progressões de exemplo

## 🐛 Troubleshooting

### Erro de Conexão com MySQL
```bash
# Verificar se o container está rodando
docker ps | grep meumysql

# Reiniciar o MySQL
docker restart meumysql

# Ver logs do MySQL
docker logs meumysql
```

### Erro de Porta 3306 em Uso
```bash
# Verificar processos na porta 3306
lsof -i :3306

# Parar MySQL local se estiver rodando
sudo systemctl stop mysql
```

### Problemas com Java/Gradle
```bash
# Limpar cache do Gradle
./gradlew clean

# Verificar versão do Java
java -version

# Recarregar projeto no VSCode
Ctrl+Shift+P → "Java: Reload Projects"
```

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais como parte do curso de Análise e Desenvolvimento de Sistemas.

## 👥 Contribuição

Para contribuir com o projeto:
1. Faça um fork
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

---

**Desenvolvido com ❤️ para o movimento escoteiro** 🏕️