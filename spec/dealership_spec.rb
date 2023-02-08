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

      expect(dealership.inventory_count).to be 0
    end
  end
end