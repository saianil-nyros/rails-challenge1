require 'rails_helper'

RSpec.describe Restaurant, type: :model do
     context 'validate tests' do 
        it 'ensures  name presence' do
            restaurant = Restaurant.new(address:'address',phone: 'phone').save
            expect(restaurant).to eq(false)
        end

        it 'ensures address presence' do
            restaurant = Restaurant.new(phone:'phone',name:'name').save
            expect(restaurant).to eq(false)
        end

        it 'ensures phone presence' do
            restaurant = Restaurant.new(name:'name',address: 'address').save
            expect(restaurant).to eq(false)
        end

        it 'should save successfully' do
            restaurant = Restaurant.new(name:"name",address: 'address',phone:'phone').save
            expect(restaurant).to eq(false)
        end
    end

end