# Coverage Report For Linux
Gere relatórios de cobertura de testes .NET diretamente no VSCode com um único comando.
Essa extensão foi feita para ambientes Linux e automatiza o processo de build, teste, geração e visualização de relatórios de cobertura.

## ✅ Funcionalidades
- Executa dotnet build e dotnet test com cobertura (Xplat Code Coverage).
- Gera relatório em HTML com reportgenerator.
- Abre automaticamente o relatório no navegador.
- Detecta e instala o reportgenerator se necessário.

## 🚀 Como usar
1. Abra seu projeto .NET no VSCode.
2. Vá até a paleta de comandos (Ctrl+Shift+P).
3. Execute o comando:
```
Generate Coverage Report
```
O terminal irá exibir as etapas do processo. Ao final, o relatório será aberto no navegador padrão.

## 📁 Estrutura
O comando da extensão executa um script localizado em:

run_coverage.sh

Esse script pode ser adaptado para seu fluxo, caso deseje personalizar os parâmetros de build, teste ou relatório.

## 🧪 O que é gerado
Diretório coverage_report/ com um relatório HTML interativo.

Arquivo principal: coverage_report/index.html

## 💻 Comandos disponíveis
| Comando | Ação |
|-|-|
| Generate Coverage Report | Executa testes com cobertura e abre relatório |

## 📝 Licença
© [Lucas Aguiar](https://www.linkedin.com/in/lucas-aguiar-backend-developer/)