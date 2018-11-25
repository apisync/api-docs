server "apisync.io", user: ENV.fetch('APISYNC_DEPLOY_USER'), roles: ['web']
set :branch, ENV.fetch('BRANCH', 'master')
