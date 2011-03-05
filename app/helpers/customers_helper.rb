module CustomersHelper
  def customers_per_page_select(collection = Customer) 
    select_tag :per_page, options_for_select([10, 20, 30, Customer.count], 
  collection.per_page) 
  end
end
