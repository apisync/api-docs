---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - ruby

toc_footers:
  - <a href='https://apisync.io'>Inscrever-se</a>

includes:
  - inventory_items.md.erb
  - errors

search: false
---

# Introdução

Nossa API RESTful permite que seus sistemas fiquem em sincronia com nosso banco de
dados, de onde registros são enviados para serviços externos para geração de
anúncios e mais.

Utilizamos o formato <a href="http://jsonapi.org" target="jsonapi">JSON:API</a>
em todos os endpoints.

> O endereço da API é https://api.apisync.io

Caso sua linguagem/framework esteja listada abaixo, recomendamos o uso da
respectiva biblioteca para interação com a API.

- **Ruby:** <a href="https://github.com/apisync/apisync-ruby">https://github.com/apisync/apisync-ruby</a>
- **Ruby on Rails:** <a href="https://github.com/apisync/apisync-rails">https://github.com/apisync/apisync-rails</a>

**URLs e domínios**

O servidor da API está localizado em `https://api.apisync.io`. Esta parte da
URL será omitida dos exemplos. Por exemplo, `GET /inventory-items` significa
uma requisição HTTP GET para `https://api.apisync.io/inventory-items`.

**Requisição HTTP**

```
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
```

Você deve definir os seguintes cabeçalhos `Content-Type` e `Accept` para
`application/vnd.api+json` como formato da requisição.

**Nota:** defina `application/vnd.api+json` em vez de `application/json`
para evitar inconsistências.

**IDs e reference-id no Apisync**

> UUID tem o formato do ID a seguir:

```json
{
  "data": {
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "attributes": {
      "reference-id": "your-own-id"
    }
  }
}
```

Todo registro enviado por você receberão automaticamente um identificador único,
chamado `id` no formato UUID.

Você também pode enviar um `id` personalizado usando o atributo `reference-id`.

Se uma requisição **POST** possuir um
atributo `reference-id` de um registro já existente, tal objeto será
_atualizado_. Se não existe um objeto com o `reference-id` enviado ou este é
nulo, um novo registro é criado.

**Caracteres especiais em URLs**

Embora uma URL com caracteres inválidos possa funcionar, nós recomendamos
a utilização de caracteres codificados. A
[RFC3986](http://tools.ietf.org/html/rfc3986) define o que esperar em uma
URL.

Se você precisar utilizar caracteres especiais em uma URL, recomendamos que
você substitua-os por um caractere codificado. Por exemplo,

`/admin?ids=1,2,3`

é uma URL inválida porque vírgulas são consideradas caracteres reservados.
A URL abaixo, entretanto, é totalmente válida:

`/admin?ids=1%2C2%2C3%2C`

Para ver a lista completa de caracteres codificados,
[veja esta página](http://www.w3schools.com/tags/ref_urlencode.asp) que inclui
o `%2C` acima.

<aside class="notice">
Em vez de `%2C`, mostraremos caracteres como `,` (vírgula) neste manual para melhorar
a legibilidade.
</aside>

# Formatos

**Hifenização**

```json
{
  "custom-attributes": [{
    "title": "Custom attribute",
    "identifier": "custom-attribute",
    "value": "Some value"
  }]
}
```

Para que possamos gerar anúncios adequadamente, bem como processar dados
enviados de forma determinística, todos os atributos precisam ser
_hifenizados_ (dasherized), ou seja,
descritos no formato `word-word`. Desta forma, evitamos diferenças entre
`my-key`, `myKey` e `my_key`.

**Moedas**

Todas as moedas são especificadas usando padrão [ISO
4217](https://pt.wikipedia.org/wiki/ISO_4217). Por exemplo, especifique `BRL`
para real brasileiro. Veja o link para os detalhes.

**Datas**

```json
{
  "created-at": "20171012T101200Z"
}
```

Todas as datas devem ser criadas e são retornadas no formato ISO-8601.

**Tipos**

Todos os tipos especificados neste documento são do
[tipo JSON](https://en.wikipedia.org/wiki/JSON#Data_types.2C_syntax_and_example).
Por exemplo,
`"word"` é do tipo string enquanto `{"key": "value"}` é do tipo objeto.

# Autorização

> Para autenticar uma requisição, envie no cabeçalho sua API token:

```ruby
token = "seu-token"
client = Apisync.new(api_key: token)
```

Todos clientes possuem uma chave única para acesso à API chamada
**API Token**. Você pode copiar a sua na página **Configurações** do seu
painel de administração. Ela é secreta e você não deve compartilhá-la com
ninguém.

Você deve incluir sua API token em todas as requisições em
um cabeçalho chamado `Authorization`, no formato
`Authorization: ApiToken sua-token-aqui`, como no exemplo a seguir:

`curl -H "Authorization: ApiToken $API_TOKEN" "https://api.apisync.io/inventory-items"`

<aside class="notice">
Você deve substituir `$API_TOKEN` com sua token verdadeira.
</aside>

Com isto, autenticamos sua requisição e reconhecemos a conta sendo usada.

# Conta de testes

Todos os clientes possuem uma conta de testes. Esta conta não possui limites
ou restrições em relação à quantidade mensal de requisições à API, sendo assim
recomendada para desenvolvimento e testes.

Para usar a conta de testes nas suas requisições de API, utilize a API Token da
conta de testes. Ela está visível na tela de configurações no painel de
administração da conta de testes.

Para acessá-la, entre no seu painel de administração, clique no
menu de Opções e em seguida _Ir para a conta de testes_. Lá você encontrará
sua API Token para testes.

Em produção, utilize a API Token da conta principal.

<aside class="notice">
Lembrete: a API Token da conta de testes é diferente da API Token da conta
de produção.
</aside>

# Paginação

> Por exemplo, além da entidade, você também tem acesso ao atributo **meta**.

```json
{
  "data": {
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "type": "inventory-items",
    "attributes": {
      "first-name": "Luke",
      "last-name":  "Skywalker"
    },
  },
  "meta": {
    "page-number": "2",
    "page-size": "50"
  }
}
```

Quando você acessa uma URL da API, você recebe registros divididos por páginas.

No exemplo à direita, a entidade **meta** está presente. Com ela você é informado
da página atual e do total de páginas. Com estas informações em mãos, você pode
realizar requisições adicionais para ler as demais páginas desejadas.

Para ler a terceira página, use o atributo `page`, como no exemplo abaixo:

`curl "https://api.apisync.io/inventory-items?page[number]=3&page[size]=20"`

<aside class="notice">
  Por simplicidade, omitiremos **meta** dos exemplos daqui em diante.
</aside>

<h1 id="resources" class="section">Resources</h1>
