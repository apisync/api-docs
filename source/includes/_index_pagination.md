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
