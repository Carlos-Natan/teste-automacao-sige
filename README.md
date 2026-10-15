<div align="center">



# CONHEÇA-IFCE



![CONHEÇA-IFCE Banner](https://raw.githubusercontent.com/placeholder/conheca-ifce-banner.png)



**Plataforma Web de Divulgação Institucional e Integração Comunitária do IFCE**



[![Node.js](https://img.shields.io/badge/Node.js-18%2B-green.svg)](https://nodejs.org/)

[![TypeScript](https://img.shields.io/badge/TypeScript-5.0%2B-blue.svg)](https://www.typescriptlang.org/)

[![NestJS](https://img.shields.io/badge/NestJS-10%2B-red.svg)](https://nestjs.com/)

[![Prisma](https://img.shields.io/badge/Prisma-ORM-552F7B.svg)](https://www.prisma.io/)

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15%2B-blue.svg)](https://www.postgresql.org/)

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)



Projeto acadêmico desenvolvido para a disciplina de **Programação Web**



**Professor:** Samuel Lima  

**Equipe:** Carlos Natan & Marina Oliveira



---



</div>



> Sistema web modular para centralização de informações institucionais, divulgação de cursos, notícias, eventos, acervo visual e comunicação direta via chat global entre a comunidade e o Instituto Federal do Ceará.



---



## 📋 Sumário



- [Sobre o Projeto](#-sobre-o-projeto)

- [Problema & Justificativa](#-problema--justificativa)

- [Público-Alvo](#-público-alvo)

- [Tecnologias Utilizadas](#-tecnologias-utilizadas)

- [Níveis de Acesso (RBAC)](#-níveis-de-acesso-rbac)

- [Arquitetura & Estrutura](#-arquitetura--estrutura)

- [Fluxos da Aplicação](#-fluxos-da-aplicação)

- [Tratamento de Erros & Respostas](#-tratamento-de-erros--respostas)

- [Pré-requisitos](#-pré-requisitos)

- [Instalação & Configuração](#-instalação--configuração)

- [Scripts Disponíveis](#-scripts-disponíveis)

- [Variáveis de Ambiente](#-variáveis-de-ambiente)

- [Testando os Endpoints](#-testando-os-endpoints)

- [Desenvolvimento com Git](#-desenvolvimento-com-git)

- [Convenção de Commits](#-convenção-de-commits)

- [Testes e Qualidade](#-testes-e-qualidade)

- [Segurança](#-segurança)

- [Autores & Créditos](#-autores--créditos)



---



## 📌 Sobre o Projeto



O **CONHEÇA-IFCE** foi concebido para suprir a necessidade de aproximação entre o campus do IFCE e a comunidade em que está inserido, bem como com o público externo.



O sistema contempla as seguintes funcionalidades e módulos:



* 🏫 **Páginas Institucionais:** História, missão, visão e infraestrutura da instituição;

* 🎓 **Catálogo de Cursos:** Listagem por modalidade (técnico/superior), turno, carga horária e descrição detalhada;

* 📰 **Notícias e Eventos:** Publicações categorizadas com suporte a imagens, datas e rascunhos;

* 🖼️ **Galeria de Fotos:** Registros visuais das atividades e instalações do campus;

* 💬 **Chat Global:** Sala de conversa única e em tempo real para visitantes autenticados;

* ✉️ **Módulo de Contato:** Formulário para envio direto de mensagens à administração;

* 🔍 **Sistema de Pesquisa:** Busca abrangente sobre todos os conteúdos públicos do site;

* 🔐 **Controle de Acesso e Moderação:** Painel administrativo para CRUD de dados e moderação de conteúdo.



---



## 🎯 Problema & Justificativa



### O Problema

No município de inserção do campus, moradores locais frequentemente desconhecem as oportunidades educacionais, processos seletivos e eventos oferecidos pelo IFCE. Paralelamente, pessoas externas (de outras regiões ou estados) possuem pouca visibilidade da relevância e infraestrutura da instituição.



### Por que resolver?

A ausência de um canal digital centralizado e responsivo:

1. Reduz a visibilidade das ações de ensino, pesquisa e extensão;

2. Dificulta o alcance de editais e processos seletivos, afetando a procura por vagas;

3. Limita a integração entre a comunidade acadêmica e a sociedade local/empresarial.



---



## 👥 Público-Alvo



* **Moradores do Município:** Consulta de serviços, editais abertos e eventos da instituição.

* **Futuros Estudantes:** Alunos de ensino fundamental e médio em busca de orientação técnica/superior.

* **Pais e Responsáveis:** Famílias pesquisando a estrutura acadêmica para decisão dos filhos.

* **Comunidade Externa:** Interessados em conhecer a história e relevância do IFCE.

* **Servidores e Alunos:** Divulgadores de projetos, pesquisas e comunicados institucionais.

* **Parceiros & Empresas:** Organizações buscando contato institucional e parcerias.



---



## 🛠 Tecnologias Utilizadas



### Backend

* **Node.js** — Ambiente de execução JavaScript/TypeScript.

* **TypeScript** — Tipagem estática para robustez no código.

* **NestJS / Express** — Framework para construção de APIs escaláveis.

* **Prisma ORM** — Mapeamento objeto-relacional e gerenciamento de migrations.

* **PostgreSQL** — Banco de dados relacional robusto.

* **Class Validator** — Validação e sanitização de dados de entrada.



### Frontend / Presentation

* **HTML5 & CSS3** — Estrutura e estilização da interface.

* **Handlebars** — Mecanismo de renderização de templates no servidor.

* **HTMX** — Interatividade dinâmica AJAX/WebSockets diretamente no HTML.



### Infraestrutura & Ferramentas

* **Docker & Docker Compose** — Conteinerização do banco de dados e serviços.

* **Git & GitHub** — Controle de versão e colaboração.

* **VS Code** — Ambiente de desenvolvimento.

* **GitHub Actions** — Automação de CI/CD.



---



## 🔒 Níveis de Acesso (RBAC)



O sistema conta com **três perfis de usuário** distintos:



| Perfil | Nível de Autenticação | Permissões no Sistema |

| :--- | :--- | :--- |

| **Visitante Anônimo** | Não Autenticado | Leitura de conteúdos públicos (sobre, cursos, notícias, galeria), pesquisa global, leitura do chat e envio do formulário de contato. |

| **Visitante Cadastrado** | Autenticado | Todas as permissões do Anônimo + **envio de mensagens no Chat Global**. |

| **Administrador** | Autenticado (Privilegiado) | Acesso total: Criar, Editar, Excluir conteúdos do site (notícias, cursos, galeria, páginas) e **moderar/remover mensagens do chat global**. |



---



## 🏗 Arquitetura & Estrutura



O projeto adota uma arquitetura modular inspirada nos conceitos de **Domain-Driven Design (DDD)**.



```text

conheca-ifce/

│

├── .github/              # Workflows do GitHub Actions e Templates

├── docs/                 # Documentação técnica e diagramas

├── prisma/               # Schema, migrations e seeds do Prisma

│   ├── migrations/

│   ├── schema.prisma

│   └── seed.ts

├── public/               # Arquivos estáticos (CSS, JS, imagens)

├── src/                  # Código-fonte da aplicação

│   ├── common/           # Guards, Interceptors, Pipes, Filters e Utils

│   ├── database/         # Módulo de conexão com banco de dados

│   └── modules/          # Módulos de domínio da aplicação

│       ├── auth/         # Autenticação e Autorização (JWT/RBAC)

│       ├── users/        # Gestão de usuários (Visitantes e Admins)

│       ├── courses/      # Módulo de Cursos

│       ├── news/         # Notícias e Eventos

│       ├── gallery/      # Acervo visual

│       ├── contact/      # Mensagens de Contato

│       └── chat/         # Módulo e Gateway do Chat Global

├── views/                # Templates e componentes visuais (Handlebars/HTMX)

│   ├── components/

│   ├── layouts/

│   └── pages/

├── .env.example

├── docker-compose.yml

├── Dockerfile

├── package.json

└── README.md

```



---



## 🔄 Fluxos da Aplicação



### Fluxo de Requisição HTMX



```text

┌──────────────┐          HTMX          ┌──────────────┐

│   Browser    │ ─────────────────────> │  Controller  │

└──────▲───────┘                        └──────┬───────┘

       │                                       │

       │ Fragmento HTML                        ▼

       │                        ┌──────────────┐

       └─────────────────────── │   Service    │

                                └──────┬───────┘

                                       │

                                       ▼

                                ┌──────────────┐

                                │    Prisma    │ ───> PostgreSQL

                                └──────────────┘

```



### Exemplo HTMX para Envio de Mensagem no Chat



```html

<form

  hx-post="/chat/message"

  hx-target="#chat-box"

  hx-swap="beforeend"

  hx-on::after-request="this.reset()">

  <input type="text" name="content" placeholder="Digite sua mensagem..." required />

  <button type="submit">Enviar</button>

</form>

```



---



## ⚠️ Tratamento de Erros & Respostas



| Situação | Resposta HTTP | Ação da Interface |

| :--- | :---: | :--- |

| **Erro de Validação** | `422 Unprocessable Entity` | HTMX substitui o formulário exibindo as mensagens de erro nos campos. |

| **Não Autorizado** | `401 Unauthorized` | Redirecionamento via cabeçalho `HX-Redirect` para a página de Login. |

| **Acesso Negado** | `403 Forbidden` | Exibição de alerta ou modal restritivo. |

| **Erro do Servidor** | `500 Internal Server Error` | Disparo do evento `HX-Trigger` para notificação toast na tela. |



---



## 💻 Pré-requisitos



Antes de iniciar, certifique-se de possuir em seu ambiente:



* **Node.js** (v18.0.0 ou superior)

* **npm** ou **yarn**

* **Git**

* **Docker & Docker Compose**



---



## 🚀 Instalação & Configuração



```bash

# 1. Clonar o repositório

git clone https://github.com/seu-usuario/conheca-ifce.git

cd conheca-ifce



# 2. Instalar as dependências do projeto

npm install



# 3. Configurar as variáveis de ambiente

cp .env.example .env



# 4. Subir o container do banco de dados PostgreSQL

docker compose up -d



# 5. Executar as migrations do banco e popular com o seed inicial

npx prisma migrate dev

npm run seed



# 6. Rodar a aplicação em modo de desenvolvimento

npm run dev

```



A aplicação estará acessível em: `<http://localhost:3000>`



> **Acesso padrão do Administrador (Criado via seed):**  

> **E-mail:** `admin@ifce.edu.br`  

> **Senha:** `admin123`



---



## 📜 Scripts Disponíveis



| Comando | Descrição |

| :--- | :--- |

| `npm run dev` | Inicia o servidor de desenvolvimento com hot-reload. |

| `npm run start` | Roda a aplicação compilada em modo de produção. |

| `npm run build` | Compila o projeto TypeScript para JavaScript (`dist/`). |

| `npm run lint` | Executa o linter para checagem de padrões de código. |

| `npm run seed` | Popula o banco com os dados iniciais do sistema. |

| `npm run prisma:migrate` | Aplica as migrations no banco de dados. |

| `npm run prisma:studio` | Abre a interface gráfica do Prisma Studio. |

| `npm test` | Roda a suíte de testes unitários. |



---



## 🔑 Variáveis de Ambiente



Consulte o arquivo [.env.example](.env.example) antes de rodar o projeto.



| Variável | Descrição | Exemplo / Padrão |

| :--- | :--- | :--- |

| `PORT` | Porta em que o servidor irá rodar | `3000` |

| `DATABASE_URL` | String de conexão do PostgreSQL | `postgresql://user:pass@localhost:5432/conheca_ifce` |

| `JWT_SECRET` | Chave secreta para assinatura dos tokens | `sua_chave_secreta_aqui` |

| `NODE_ENV` | Ambiente de execução | `development` |



---



## 🧪 Testando os Endpoints



Caso utilize a extensão **REST Client** do VS Code, os arquivos de requisição estão disponíveis na pasta `http/`:



* `http/auth.http` — Testes de login e cadastro.

* `http/courses.http` — Consultas e cadastros de cursos.

* `http/chat.http` — Envio e moderação de mensagens do chat.



---



## 🌿 Desenvolvimento com Git



O repositório utiliza o fluxo de trabalho baseado em *feature branches*:



```text

main (produção)

 └── development (integração)

      ├── feature/descricao-da-task

      ├── fix/correcao-bug

      └── docs/atualizacao-readme

```



### Passo a passo para contribuir:



```bash

# 1. Atualize a branch de desenvolvimento

git checkout development

git pull origin development



# 2. Crie uma nova branch para sua tarefa

git checkout -b feature/implementa-chat-global



# 3. Realize suas alterações e faça os commits

git add .

git commit -m "feat(chat): adiciona envio de mensagem em tempo real"



# 4. Envie a branch para o repositório remoto

git push -u origin feature/implementa-chat-global



# 5. Abra um Pull Request direcionado para a branch 'development'

```



---



## 📝 Convenção de Commits



Seguimos a convenção de **Conventional Commits**:



| Tipo | Descrição | Exemplo |

| :--- | :--- | :--- |

| `feat` | Implementação de nova funcionalidade | `feat(courses): adiciona busca por modalidade` |

| `fix` | Correção de um erro/bug | `fix(auth): corrige validacao de token expirado` |

| `docs` | Alterações na documentação | `docs(readme): atualiza instrucoes de instalacao` |

| `refactor`| Refatoração de código sem alterar regra de negócio | `refactor(chat): otimiza consulta de mensagens` |

| `test` | Adição ou alteração de testes | `test(users): cria teste unitario do servico de login` |

| `chore` | Tarefas de manutenção ou configurações | `chore(deps): atualiza dependencias do projeto` |



---



## 🧪 Testes e Qualidade



Antes de enviar seu Pull Request, certifique-se de validar:



```bash

# Executa linter de código

npm run lint



# Executa testes unitários

npm test



# Valida compilação do projeto

npm run build

```



---



## 🛡 Segurança



* Arquivos sensíveis e credenciais **NUNCA** devem ser commitados no Git.

* Certifique-se de que o arquivo `.env` consta no `.gitignore`.

* Em caso de dúvidas, consulte os exemplos presentes no `.env.example`.



---



## 👥 Autores & Créditos



<div align="center">



| **Carlos Natan** | **Marina Oliveira** |

| :---: | :---: |

| Desenvolvedor | Desenvolvedora |



**Orientador:** Prof. Samuel Lima  

**Instituição:** Instituto Federal de Educação, Ciência e Tecnologia do Ceará (IFCE)



---



*PROJETO ACADÊMICO — PROGRAMAÇÃO WEB*



</div>