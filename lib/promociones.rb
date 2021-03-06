require 'discounter'

include Discounter

  pricing_rules = []

  discount_rules = DiscountRules.new
  # Everyday discounts that you don't wanna retype every time
  pricing_rules << discount_rules.dos_por_uno({ code: "001", limit: 2, discount: 3.11 })
  pricing_rules << discount_rules.descuento_fijo({ code: "002", limit: 3, discount: 0.50 })

  co = Checkout.new(pricing_rules)

  co.scan Item.new("001", "AM", 3.11)
  co.scan Item.new("001", "AM", 3.11)
  co.scan Item.new("001", "AM", 3.11)
  co.scan Item.new("002", "AC", 5.00)
  co.scan Item.new("003", "CA", 11.23)

  puts "Total1:(espera 22.45)"
  puts price = co.total

  co = Checkout.new(pricing_rules)

  co.scan Item.new("001", "AM", 3.11)
  co.scan Item.new("001", "AM", 3.11)

  puts "Total2(espera 3.11):"
  puts price = co.total

  co = Checkout.new(pricing_rules)

  co.scan Item.new("001", "AM", 3.11)
  co.scan Item.new("002", "AC", 5.00)
  co.scan Item.new("002", "AC", 5.00)
  co.scan Item.new("002", "AC", 5.00)

  puts "Total3:(espera 16.61)"
  puts price = co.total
