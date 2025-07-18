#!/bin/bash

# Script para parar MySQL

echo "🛑 Parando servidor MySQL..."

if docker ps | grep -q "meumysql"; then
    docker stop meumysql
    echo "✅ MySQL parado com sucesso!"
else
    echo "⚠️  Container 'meumysql' não está rodando"
fi

echo ""
echo "💡 Dica: Os dados foram preservados em ./db_data/"
echo "   Para remover todos os dados: rm -rf db_data/"