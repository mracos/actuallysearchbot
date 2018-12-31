if ENV["LITA_ENV"] == "production"
  Bundler.require(:default, :production)
else
  Bundler.require(:default)
end

Lita.configure do |config|
  config.robot.name = "actuallysearchbot"
  config.robot.locale = :en

  if ENV["LITA_ENV"] == "production"
    config.robot.log_level = :warn
    config.robot.adapter = :telegram_plus
    config.adapters.telegram_plus.token = ENV["TELEGRAM_BOT_TOKEN"]
    config.redis["url"] = ENV["REDIS_URL"]
    config.http.port = ENV["PORT"]
  else
    config.robot.adapter = :shell
    config.robot.log_level = :info
    # config.redis["url"] = "redis://localhost:6379"
  end
end

require_relative 'handlers/search_handler'
