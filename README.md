# Sistema de Gestão de Chamados (Help Desk Simplificado)

##  Descrição do Projeto
Este é um sistema de gestão de chamados web simplificado, desenvolvido em Ruby on Rails, com foco na regra de negócio e usabilidade básica. Inspirado em soluções de help desk como o GLPI, ele permite que usuários abram chamados (incidentes ou requisições), visualizem seu status, e interajam com respostas e soluções.

##  Funcionalidades
* **Autenticação de Usuário:** Tela de login inicial com acesso restrito ao dashboard.
* **Dashboard:** Painel principal com opções para "Criar Chamado" e "Meus Chamados".
* **Criação de Chamados:**
    * Formulário intuitivo para abertura de novos chamados.
    * Seleção de "Tipo" (Incidente ou Requisição).
    * Seleção dinâmica de "Categoria" baseada no tipo escolhido.
    * Campos para Título e Descrição detalhada.
    * **Anexo de Arquivos (Opcional):** Suporte para anexos nos formatos `.odt`, `.doc`, `.docx`, `.pdf`, `.png`, `.jpeg` com limite máximo de 300KB.
    * Mensagem de sucesso ao criar o chamado.
* **Meus Chamados:**
    * Listagem de todos os chamados abertos pelo usuário logado.
    * Exibição clara do "Status" (Em atendimento ou Fechado).
    * Opções para "Visualizar" e "Excluir" chamados.
* **Visualização Detalhada do Chamado:**
    * Tela com todos os detalhes do chamado.
    * Opções para "Responder" ao chamado (adicionar uma resposta).
    * Opções para "Adicionar Solução" (adicionar uma solução e fechar o chamado automaticamente).
    * Exibição do arquivo anexo (se houver).

##  Tecnologias Utilizadas
* **Backend:** Ruby on Rails 8.0.2
* **Frontend:** HTML, ERB (Embedded Ruby)
* **Estilização:** Tailwind CSS
* **Banco de Dados:** SQLite3 (para desenvolvimento e testes)
* **Anexos:** Active Storage (com validação de tipo e tamanho de arquivo)
* **Gerenciamento de Dependências:** Bundler
* **JavaScript:** Hotwire (Turbo e Stimulus - Implicitamente usado pelo Rails para navegação SPA-like)

##  Configuração e Instalação
Para rodar este projeto em sua máquina local, siga os passos abaixo:

1.  **Pré-requisitos:**
    * Ruby (versão compatível com Rails 8.0.2, ex: 3.2.x ou superior)
    * Rails 8.0.2
    * Node.js (necessário para o Tailwind CSS)
    * Yarn ou npm (gerenciador de pacotes Node.js, geralmente vem com Node.js)

2.  **Clone o repositório:**
    ```bash
    git clone [LINK_DO_SEU_REPOSITORIO]
    cd trabalho_imersao
    ```
    (Substitua `[LINK_DO_SEU_REPOSITORIO]` pelo link real)

3.  **Instale as dependências do Ruby:**
    ```bash
    bundle install
    ```

4.  **Configure o Active Storage (para uploads de arquivos):**
    ```bash
    rails active_storage:install
    ```

5.  **Crie e execute as migrações do banco de dados:**
    ```bash
    rails db:create
    rails db:migrate
    ```

6.  **Crie o usuário administrador padrão:**
    Abra o console do Rails:
    ```bash
    rails c
    ```
    No console, digite e pressione Enter:
    ```ruby
    User.create(username: 'admin', password: '123')
    ```
    Saia do console:
    ```bash
    quit
    ```

## ▶ Como Rodar a Aplicação

Para iniciar o servidor de desenvolvimento do Rails e o processo de compilação do Tailwind CSS:

```bash
bin/dev
