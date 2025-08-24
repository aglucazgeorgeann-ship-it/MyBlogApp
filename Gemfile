source "https://rubygems.org"

ruby "3.4.5"

# Core Rails
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Windows timezone fix
gem "tzinfo-data", platforms: [:mingw, :x64_mingw, :mswin, :jruby]

# Performance
gem "bootsnap", require: false

# --- PRODUCTION (Render / Heroku) ---
group :production do
  
end

# --- DEVELOPMENT + TEST ---
group :development, :test do
  # Use SQLite for the development and test environments
group :development, :test do
  gem "sqlite3", "~> 1.6"
end

# Use PostgreSQL for the production environment (like Render)
group :production do
  gem "pg", "~> 1.6" # Ito ang para sa PostgreSQL
end

  gem "tailwindcss-rails"
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem "selenium-webdriver"
end


# --- DEVELOPMENT ONLY ---
group :development do
  gem "web-console"             # Rails console in browser errors
end
