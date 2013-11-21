require 'rails/generators'
require 'rails/generators/migration'

class AddressGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    unless @prev_migration_nr
      @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    else
      @prev_migration_nr += 1
    end
    @prev_migration_nr.to_s
  end

  def seed_settings
    append_to_file 'db/seeds.rb' do
      "\n\rSetting.available_locales = [:en]" +
      "\n\rSetting.default_locale = :en"
    end
  end

  def setup_hstore
    migration_template "setup_hstore.rb", "db/migrate/setup_hstore.rb"
  end

  def create_migration_addresses
    migration_template "create_addresses.rb", "db/migrate/create_addresses.rb"
  end

  def create_migration_postal_codes
    migration_template "create_postal_codes.rb", "db/migrate/create_postal_codes.rb"
  end

  def create_migration_buildings
    migration_template "create_buildings.rb", "db/migrate/create_buildings.rb"
  end

  def create_migration_settings
    migration_template "create_settings.rb", "db/migrate/create_settings.rb"
  end
end