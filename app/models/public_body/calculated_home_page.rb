# Guess the home page based on the request email domain.
module PublicBody::CalculatedHomePage
  extend ActiveSupport::Concern

  included do
    cattr_accessor :excluded_calculated_home_page_domains, default: %w[
      aol.com
      btinternet.com
      gmail.com
      gmx.com
      hotmail.com
      icloud.com
      mail.com
      mail.ru
      outlook.com
      protonmail.com
      qq.com
      yahoo.com
      yandex.com
      ymail.com
      zoho.com
    ]
  end

  def calculated_home_page
    @calculated_home_page ||= calculated_home_page!
  end

  private

  # Guess home page from the request email, or use explicit override, or nil
  # if not known.
  def calculated_home_page!
    if home_page && !home_page.empty?
      home_page[URI.regexp(%w(http https))] ? home_page : "https://#{home_page}"
    elsif request_email_domain
      return if excluded_calculated_home_page_domain?(request_email_domain)
      "https://www.#{request_email_domain}"
    end
  end

  def excluded_calculated_home_page_domain?(domain)
    excluded_calculated_home_page_domains.include?(domain)
  end
end
