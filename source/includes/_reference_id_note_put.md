* **reference_id:**
if another object already has the same `reference_id` value, an error message
will be returned and the item won't be saved. If you  want to update an object
but doesn't know its `id`, make a `POST` request without specifying an `:id`
on the URL, but setting a `reference_id`. That way your object will be updated
(as long as it exists on the server).
