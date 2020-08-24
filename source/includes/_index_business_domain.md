## What I Need To Know

This API has 2 main areas:

- **Organization:** this is your company. Use this namespace to access ad
  accounts, to create Accounts and configure billing.
- **Accounts:** use Accounts to separate marketing campaigns with Accounts. For
  agencies, this means having one Organization and many Accounts (one for each
  client). For non-agencies you'll probably have only one account.

Most endpoints require an `account_id` for the account you are managing. You
can find the `account_id` you need by going to one of your accounts, then under
Configurations. For more information, see the <a href="#account-id-details">Account
ID</a> section.
