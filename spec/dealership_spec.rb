require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  describe '#initialize' do
    it 'exists' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership).to be_a Dealership
    end

    it 'has a name' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.name).to eq('Acme Auto')
    end

    it 'has and address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.address).to eq('123 Main Street')
    end

    it 'has no inventory by default' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory).to be_a Array 
      expect(dealership.inventory.count).to be 0
    end
  end

  describe '#inventory_count' do
    it 'returns number of cards in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)

      expect(dealership.inventory_count).to be 0

      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory_count).to eq 2
    end
  end

  describe '#add_car' do
    it 'adds a car to inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)

      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory).to eq([car_1, car_2])
    end
  end

  describe '#has_inventory?' do
    it 'returns whether dealership has inventory or not' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.has_inventory?).to be false

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.has_inventory?).to be true
    end
  end

  describe '#cars_by_make' do
    it 'returns cars with given make' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make('Toyota')).to eq([car_2, car_3])
      expect(dealership.cars_by_make('Ford')).to eq([car_1])
    end
  end

  describe '#total_value' do
    it 'sums and returns value of all cars in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.total_value).to eq 156000
    end
  end

  describe '#details' do
    it 'returns hash with dealership total value and address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
    end
  end

  describe '#average_price_of_car' do
    it 'returns average price of cars in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.average_price_of_car).to eq('39,000')
    end
  end

  # describe '#cars_sorted_by_price' do
  #   it 'returns cars from lowest to highest price' do
  #     dealership = Dealership.new("Acme Auto", "123 Main Street")

  #     car_1 = Car.new("Ford Mustang", 1500, 36)
  #     car_2 = Car.new("Toyota Prius", 1000, 48)
  #     car_3 = Car.new("Toyota Tercel", 500, 48)
  #     car_4 = Car.new("Chevrolet Bronco", 1250, 24)

  #     dealership.add_car(car_1)
  #     dealership.add_car(car_2)
  #     dealership.add_car(car_3)
  #     dealership.add_car(car_4)

  #     expect(dealership.cars_sorted_by_price).to eq([car_3, car_2, car_4, car_1])
  #   end
  # end
end