#!/bin/bash

# Executa tudo e captura o código de saída
main() {
  echo "🔨 Realizando build do projeto..."
  dotnet build

  echo "▶️ Executando testes com coleta de cobertura..."
  dotnet test --collect:"Xplat Code Coverage" \
    -- DataCollectionRunSettings.DataCollectors.DataCollector.Configuration.Format=cobertura

  echo "✅ Testes concluídos."

  if ! dotnet tool list --global | grep -q dotnet-reportgenerator-globaltool; then
    echo "📦 Instalando reportgenerator..."
    dotnet tool install --global dotnet-reportgenerator-globaltool
  else
    echo "📦 Reportgenerator já instalado."
  fi

  echo "🔧 Configurando PATH..."
  export PATH="$PATH:$HOME/.dotnet/tools"

  REPORT_DIR="coverage_report"
  if [ -d "$REPORT_DIR" ]; then
    echo "🧹 Removendo diretório antigo de relatório: $REPORT_DIR"
    rm -rf "$REPORT_DIR"
  fi

  echo "📊 Gerando novo relatório de cobertura em HTML..."
  reportgenerator \
    -reports:"**/coverage.cobertura.xml" \
    -targetdir:"$REPORT_DIR" \
    -reporttypes:Html \
    -filefilters:"-**/Program.cs"

  echo "✅ Relatório gerado em ./$REPORT_DIR/index.html"

  INDEX_HTML="$REPORT_DIR/index.html"
  if [ -f "$INDEX_HTML" ]; then
    echo "🌐 Abrindo relatório no navegador..."
    if command -v xdg-open &> /dev/null; then
      xdg-open "$INDEX_HTML"
    elif command -v open &> /dev/null; then
      open "$INDEX_HTML"
    elif command -v start &> /dev/null; then
      start "$INDEX_HTML"
    else
      echo "⚠️ Não foi possível detectar um comando para abrir o navegador automaticamente."
      echo "Abra manualmente: $INDEX_HTML"
    fi
  else
    echo "❌ Arquivo $INDEX_HTML não encontrado."
  fi
}

# Executa e captura erros
main
EXIT_CODE=$?

echo ""
if [ $EXIT_CODE -ne 0 ]; then
  echo "❌ O script terminou com erro (código $EXIT_CODE)."
else
  echo "✅ Script concluído com sucesso."
fi

read -p "Pressione Enter para fechar..."
exit $EXIT_CODE
