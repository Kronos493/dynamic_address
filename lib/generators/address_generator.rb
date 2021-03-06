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

  def create_migration_variables_to_zone
     migration_template "add_variables_to_zones.rb", "db/migrate/add_variables_to_zones.rb"
  end

  def create_migration_is_main_to_address
    migration_template "add_is_main_to_addresses.rb", "db/migrate/add_is_main_to_addresses.rb"
  end

  def create_migration_zones
    migration_template "create_zones.rb", "db/migrate/create_zones.rb"
  end

  def create_migration_postal_codes
    migration_template "create_postal_codes.rb", "db/migrate/create_postal_codes.rb"
  end

  def create_migration_zip_code_column_type
     migration_template "change_zip_code_column_type.rb", "db/migrate/change_zip_code_column_type.rb"
  end

  def create_migration_zone_id_to_postal_code
    migration_template "add_zone_id_to_postal_codes.rb", "db/migrate/add_zone_id_to_postal_codes.rb"
  end

  def create_migration_state_name_to_address
    migration_template "add_state_name_to_address_translations.rb", "db/migrate/add_state_name_to_address_translations.rb"
  end

  def create_migration_reference_to_address_types
    migration_template "add_reference_to_address_types.rb", "db/migrate/add_reference_to_address_types.rb"
  end
  
  def create_migration_is_main_to_contact_number
    migration_template "add_is_main_to_contact_numbers.rb", "db/migrate/add_is_main_to_contact_numbers.rb"
  end

  def create_migration_company_name_to_address
    migration_template "add_company_name_to_address_translations.rb", "db/migrate/add_company_name_to_address_translations.rb"
  end
  

  def create_migration_city_name_to_address
    migration_template "add_city_name_to_address_translations.rb", "db/migrate/add_city_name_to_address_translations.rb"
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

  def create_migration_address_types
    migration_template "create_address_types.rb", "db/migrate/create_address_types.rb"
  end

  def create_migration_settings
    migration_template "create_settings.rb", "db/migrate/create_settings.rb"
  end

  def create_migration_contact_numbers
    migration_template "create_contact_numbers.rb", "db/migrate/create_contact_numbers.rb"
  end
end