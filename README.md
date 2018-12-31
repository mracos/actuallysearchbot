<h1 align="center">actually search bot</h1>
<blockquote align="center">profit</blockquote>

A search bot done with `lita` for telegram
Do not forget that `lita` needs `redis`

## development

- install dependencies `bundle install`
- start the lita shell `bundle exec lita start`
- do searches with `search QUERY`

- it tries to find redis in the default `url:port`, but if yours in a non standard location, you can uncomment and change the following line inside `lita_config.rb:19`
  `# config.redis["url"] = "redis://localhost:6379"`

## deploying

You will first need to define the following env variables
- `TEELGRAM_BOT_TOKEN` the token of you telegram bot, given by the @botfather in telegram
- `REDIS_URL` a url for the redis instance
- `LITA_ENV` as `production`, else it will not start the telegram server

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
