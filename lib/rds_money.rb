module RdsMoney
  extend ActiveSupport::Concern

  def display_money(amount)
    "#{currency}#{parse_money(amount)}"
  end

  def parse_money(amount)
    amount ||= 0
    sprintf "%.2f", amount
  end

  def currency
    self[:currency] || Setting[:default_currency]
  end

  module ClassMethods
    def define_display_money!(*args)
      args.each do |arg|
        define_method("display_#{arg}") do
          display_money( self.send(arg) )
        end
      end
    end
  end
end
