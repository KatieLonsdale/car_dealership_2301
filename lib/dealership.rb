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
end