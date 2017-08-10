---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

toc_footers:
  - <a href='https://apisync.io'>Inscrever-se</a>

includes:
  - inventory_items
  - errors

search: false
---

# Introdução à API

Nossa API permite que seus sistema fiquem em sincronia com nosso banco de
dados, de onde registros são enviados para serviços externos para geração de
anúncios e mais.

Utilizamos o formato <a href="http://jsonapi.org" target="jsonapi">JSON:API</a>
em todos os endpoints.

> O endereço da API é https://api.apisync.io

<aside class="warning">
  A API está em desenvolvimento.
</aside>

**URLs e domínios**

Vamos omitir o domínio quando especificando. Por exemplo,
`GET /inventory-items` significa uma requisição HTTP GET para
`https://api.apisync.io/inventory-items`.

**IDs locais e remotos**

> UUID tem o formato do ID a seguir:

```shell
{
  "data": {
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2"
  }
}
```

Todo registro enviado por você receberá um identificador único, chamado `id`.
Nós geraremos este `id` com o formato UUID e é usado por nossos sistemas.

Para que você possa manter referência dos objetos criados em nosso sistema,
todos os endpoints possuem um atributo string chamado `reference-id` que você
deve especificar com o identificador presente no seu sistema.

Com esta referência, você conseguirá excluir itens do nosso sistema quando
eles forem excluídos do seu.

## Caracteres especiais em URLs

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

# Autorização

> Para autenticar uma requisição, envie no cabeçalho sua API token:

```shell
# No shell, -H significa Header (cabeçalho)
curl -H "Token: 123456789"
     "URL_DA_API"
```

Todos clientes possuem uma chave única para acesso à API chamada
**API Token**. Você pode copiar a sua na página **Configurações** do seu
painel de administração. Ela é secreta e você não deve compartilhá-la com
ninguém.

O Aust espera que você inclua sua API token em todas as requisições em
um cabeçalho chamado `Authorization`, como no exemplo a seguir:

`curl -H "Token: Bearer $API_TOKEN" "https://api.apisync.io/inventory-items"`

<aside class="notice">
Você deve substituir `$API_TOKEN` com sua token verdadeira.
</aside>

Com isto, autenticamos sua requisição e reconhecemos a conta sendo usada.

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
