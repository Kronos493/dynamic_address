require 'rails/generators'
require 'rails/generators/migration'

class AddressGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_addresses
    migration_template "create_addresses.rb", "db/migrate/create_addresses.rb"
  end

  def create_migration_postal_codes
    migration_template "create_postal_codes.rb", "db/migrate/create_postal_codes.rb"
  end
end