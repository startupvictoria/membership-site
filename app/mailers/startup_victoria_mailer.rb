class StartupVictoriaMailer < ActionMailer::Base
  protected

  def default_from
    "\"Startup Victoria\" <no-reply@startupvictoria.com.au>"
  end
end
