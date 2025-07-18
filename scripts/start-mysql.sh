#!/bin/bash

# Script para iniciar MySQL conforme especificação da disciplina

echo "🐳 Iniciando servidor MySQL..."

# Verificar se já existe um container com o nome
if docker ps -a | grep -q "meumysql"; then
    echo "⚠️  Container 'meumysql' já existe. Removendo..."
    docker stop meumysql 2>/dev/null
    docker rm meumysql 2>/dev/null
fi

# Verificar se a porta 3306 está em uso
if lsof -i :3306 >/dev/null 2>&1; then
    echo "⚠️  Porta 3306 está em uso. Verifique se há outro MySQL rodando."
    echo "   Para parar MySQL local: sudo systemctl stop mysql"
    exit 1
fi

# Criar diretório para dados persistentes se não existir
mkdir -p db_data

echo "🚀 Executando comando Docker..."

# Comando conforme especificação da disciplina com persistência
docker run -d --rm -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=senhaRoot \
    -e MYSQL_DATABASE=bcd \
    -e MYSQL_USER=aluno \
    -e MYSQL_PASSWORD=aluno \
    -e MYSQL_ROOT_HOST='%' \
    -v $(pwd)/db_data:/var/lib/mysql \
    --name meumysql \
    mysql/mysql-server:latest

if [ $? -eq 0 ]; then
    echo "✅ MySQL iniciado com sucesso!"
    echo "📊 Aguardando MySQL ficar pronto..."
    
    # Aguardar MySQL ficar pronto
    for i in {1..30}; do
        if docker exec meumysql mysqladmin ping -h localhost --silent; then
            echo "🎉 MySQL está pronto para conexões!"
            echo ""
            echo "📋 Informações de conexão:"
            echo "   Host: localhost"
            echo "   Porta: 3306"
            echo "   Database: bcd"
            echo "   Usuário: aluno"
            echo "   Senha: aluno"
            echo ""
            echo "🔧 Para conectar via linha de comando:"
            echo "   docker exec -it meumysql mysql -u aluno -p bcd"
            echo ""
            echo "▶️  Agora você pode executar: ./gradlew bootRun"
            break
        fi
        echo "⏳ Aguardando... ($i/30)"
        sleep 2
    done
else
    echo "❌ Erro ao iniciar MySQL"
    exit 1
fi