class Dealership
  attr_reader :name, :address, :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory.push(car)
  end

  def has_inventory?
    self.inventory_count > 0 ? true : false
  end

  def cars_by_make(make)
    @inventory.find_all do |car|
      car.make == make
    end
  end

  def total_value
    total_value_of_inventory = 0
    @inventory.each do |car|
      total_value_of_inventory += car.total_cost
    end
    total_value_of_inventory
  end

  def details
    dealership_details = {}
    dealership_details["total_value"] = total_value
    dealership_details["address"] = @address
    dealership_details
  end

  def average_price_of_car
    average_price = 0
    @inventory.each do |car|
      average_price += car.total_cost
    end
    average_price /= inventory_count
    formatted_average_price = ''
    count = 0
    average_price.to_s.reverse.each_char do |char|
      if count == 3
        formatted_average_price.prepend(',')
        formatted_average_price.prepend(char)
        count = 0
      else 
        formatted_average_price.prepend(char)
        count += 1
      end
    end
    formatted_average_price
  end

  # def cars_sorted_by_price
  #   @inventory.sort_by{|car| car.total_cost}
  # end
end