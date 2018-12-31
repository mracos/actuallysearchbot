Lita.configure do |config|
  config.robot.name = "actuallysearchbot"
  config.robot.locale = :en
  config.robot.adapter = :shell

  if ENV["LITA_ENV"] == "production"
    config.robot.log_level = :warn
    config.redis["url"] = ENV["REDIS_URL"]
  else
    config.robot.log_level = :info
    # config.redis["url"] = "redis://localhost:6379"
  end
end
