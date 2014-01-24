module HstoreValidation
  def validates_hstore(field, condition,  &block)
    validation_class = Class.new do
      include ActiveModel::Validations
 
      def self.name
        '(validations)'
      end
 
      def initialize(data)
        @data = data || {}
      end
 
      def read_attribute_for_validation(attr_name)
        @data[attr_name]
      end
    end

    validation_class.class_eval &block

    validate do

      # instance order
      if self.send(condition)
        validator = validation_class.new(self[field])
        if validator.invalid?
          validator.errors.each do |attr, text|
            self.errors.add(attr, text)
          end
        end
      end
    end
  end
end