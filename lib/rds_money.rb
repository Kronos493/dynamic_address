module RdsMoney
  extend ActiveSupport::Concern

  def display_money(amount)
    "#{currency}#{display_amount(amount)}"
  end

  def display_amount(amount)
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
