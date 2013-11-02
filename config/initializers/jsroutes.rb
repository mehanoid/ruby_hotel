JsRoutes.setup do |config|
  config.exclude = [/admin_/, /user_/]
  config.default_url_options = {format: :json}
end