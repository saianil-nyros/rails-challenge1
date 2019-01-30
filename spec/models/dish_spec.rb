require 'rails_helper'
require 'paperclip'

RSpec.describe Dish, type: :model do
     context 'validation tests' do 

        it 'ensures  name presence' do
            dish = Dish.new(price: 'price',rating:'rating',tagging_id: 'tagging').save
            expect(dish).to eq(false)

        end

        it 'ensures price presence' do
            dish = Dish.new(name: 'name', rating:'rating',tagging_id: 'tagging').save
            expect(dish).to eq(false)
        end

        it 'ensures rating presence' do
            dish = Dish.new(name: 'name',price: 'price',tagging_id: 'tagging').save
            expect(dish).to eq(false)
        end

        it 'ensures tagging_id presence' do
            dish = Dish.new(name: 'name',price: 'price',rating: 'rating').save
            expect(dish).to eq(false)
        end
        
		#Pass condition
        it 'Dish create'do
        Dish.create(:name=>"Friedrice")
    	end

        it 'should save successfully' do
            dish = Dish.new(name:"name",price: 'price',rating:'rating',tagging_id: 'tagging').save
            expect(dish).to eq(true)
        end
    end

end