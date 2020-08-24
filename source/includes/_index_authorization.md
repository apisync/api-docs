# Authorization

> To authenticate a request, send your API token in the header:

```
curl -H "Authorization: ApiToken $API_TOKEN" \
     "https://api.apisync.io/inventory-items"
```

Every customer has a unique API token to access endpoints.
<strong>You can find yours in the dashboard, under Configurations.</strong>

You must include your API token in every request you make using the
`Authorization` header in the format
`Authorization: ApiToken $API_TOKEN`.

<aside class="notice">
Replace <code>$API_TOKEN</code> with your actual API token.
</aside>

Without this, we cannot know who's using the API and you won't be able to access
your data.

<a name="account-id-details"></a>
## Account ID

Most endpoints require that you specify an `account_id` for the account you are
managing.

For example, given you have 10 accounts and you are managing <em>campaigns</em>
for one of the accounts, you need to specify that account when calling the
campaigns endpoint (e.g `POST /accounts/:id/campaigns`).

You can find the `account_id` you need by going to one of your
accounts, then under Configurations.
