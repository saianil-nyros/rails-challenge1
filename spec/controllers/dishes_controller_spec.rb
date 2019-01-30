require 'rails_helper'
require 'spec_helper'

RSpec.describe DishesController, type: :controller do
	it 'indexpage for all dishes' do
		 get :index
		 expect(response.status).to render_template(:index)
		 expect(response.status).to eq(200)
	end

	it 'search page' do
		get :search
		expect(response.status).to render_template(:search)
		expect(response.status).to eq(200)
	end
	it  "Range slider" do
	    get :search
	    expect(response.status).to render_template(:search)
	    expect(response.status).to eq(200)
  end
  it "Dish rating" do
	    get :search
	    expect(response.status).to render_template(:search)
	    expect(response.status).to eq(200)
  end
	
end