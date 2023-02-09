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
    @inventory << car
  end

  def has_inventory?
    inventory_count > 0
  end

  def cars_by_make(make)
    @inventory.find_all do |car|
      car.make == make
    end
    # @inventory.select do |car|
      # car.make == make
    # end
  end

  def total_value
    @inventory.sum do |car|
      car.total_cost
    end
  end

  def details
    dealership_details = {}
    dealership_details["total_value"] = total_value
    dealership_details["address"] = @address
    dealership_details
  end

  def average_price_of_car
    count = 0
    (total_value / inventory_count).to_s.insert(2,',')
  end
  
  def cars_sorted_by_price
    @inventory.sort_by{|car| car.total_cost}
  end

  def inventory_hash
    dealership_inventory = @inventory.group_by{|car| car.make}
    dealership_inventory
  end
end