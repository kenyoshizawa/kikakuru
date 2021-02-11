Rails.application.config.generators do |g|
  g.assets false
  g.helper false
  g.test_framework false
  g.skip_routes true
  g.template_engine :slim
end
