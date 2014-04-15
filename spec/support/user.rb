class User < ActiveRecord::Base

  sanitizes :username, with: [:downcase, ->(content) { content.gsub(/\A@/, '') }]
  sanitizes :first_name, with: :strip
  sanitizes :last_name, with: :upcase

  sanitizes :email do |content|
    content.squish.downcase
  end

end