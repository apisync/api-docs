## Excluindo um item

```ruby
client = Apisync.new(api_key: token)
client.inventory_items.delete(id: "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2")
```

`DELETE /inventory-items/:id`

Para excluir um item, faça uma requisição para a URL acima.

Se você apenas deseja indicar que um item não está mais disponível à venda, mas
não quer exclui-lo, faça um `PUT` (atualização/update) passando
`available: false`. Isto é recomendado para que o histórico de performance
e eficiência deste item e seus anúncios não sejam perdidos.

### Exemplos

`DELETE /inventory-items/35b87e73-3fec-4f2c-86dd-6afe36a0dbd2`

Esta requisição excluirá o item com `id` `35b87e73-3fec-4f2c-86dd-6afe36a0dbd2`.
