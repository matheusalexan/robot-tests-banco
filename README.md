# Robot Framework - Testes Automatizados

Projeto de testes automatizados usando Robot Framework para aplicação bancária.

## 🏗️ Estrutura do Projeto

```
robot-tests/
├── resources/                    # Recursos compartilhados
│   ├── common.robot            # Keywords e configurações comuns
│   ├── config.robot            # Configurações globais (URLs, credenciais)
│   └── page_objects/           # Page Objects para elementos da UI
│       ├── login_page.robot
│       └── transacoes_page.robot
├── tests/                       # Testes organizados por funcionalidade
│   ├── login/
│   │   └── test_login.robot
│   ├── transacoes/
│   │   └── test_transacoes.robot
│   └── api/
├── data/                        # Dados de teste
│   └── test_data.json
├── results/                     # Resultados dos testes
└── venv/                        # Ambiente virtual
```

## 🚀 Como Executar

### 1. Setup Inicial
```bash
# Criar ambiente virtual
python3 -m venv venv

# Ativar ambiente virtual
source venv/bin/activate  # macOS/Linux
# ou
venv\Scripts\activate     # Windows

# Instalar dependências
pip install -r requirements.txt
```

### 2. Pré-requisitos
- Aplicação frontend rodando na porta 4000
- API rodando na porta 3000
- Chrome/ChromeDriver instalado

### 3. Executar Testes

#### Todos os testes:
```bash
robot tests/
```

#### Testes específicos:
```bash
# Apenas testes de login
robot tests/login/

# Apenas testes de transações
robot tests/transacoes/

# Teste específico
robot tests/login/test_login.robot
```

#### Com opções específicas:
```bash
# Gerar relatório HTML
robot --outputdir results tests/

# Executar com tags específicas
robot --include smoke tests/
```

## 📋 Funcionalidades Testadas

### ✅ Login
- Acesso à página de login
- Login com credenciais válidas
- Login com usuário inválido
- Login com senha inválida

### 🔄 Transações Bancárias
- Acesso à página de transações
- Criação de transação de crédito
- Criação de transação de débito
- Cancelamento de transação

## 🛠️ Configurações

As configurações estão centralizadas em `resources/config.robot`:
- URLs das aplicações
- Credenciais de teste
- Timeouts e configurações do navegador

## 📊 Relatórios

Após executar os testes, os relatórios são gerados automaticamente:
- `log.html` - Log detalhado dos testes
- `report.html` - Relatório de resultados
- `output.xml` - Saída em formato XML

## 🔧 Manutenção

### Adicionar Novo Teste
1. Criar arquivo `.robot` na pasta `tests/`
2. Importar recursos necessários
3. Usar keywords existentes quando possível

### Adicionar Nova Funcionalidade
1. Criar page object em `resources/page_objects/`
2. Adicionar configurações em `resources/config.robot`
3. Criar testes correspondentes

## 📝 Notas

- Os testes usam Page Object Model para melhor manutenibilidade
- Keywords comuns estão centralizadas para reutilização
- Screenshots automáticos em caso de falha
- Configurações centralizadas para fácil manutenção
