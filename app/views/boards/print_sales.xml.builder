xml.instruct!
xml.sales do
  @sales.each do |sale|
    xml.sale do
      xml.amount sale.amount
      xml.customer sale.customer.name
      xml.invoice_date sale.invoice_date
    end
  end
end