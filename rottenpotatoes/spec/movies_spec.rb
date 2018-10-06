require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    
    it 'creates a movie' do
        post :create, :movie => { :title => "Star Wars", :director => "George Lucas", :rating => 'PG' }
        expect(flash[:notice]).to be_present
        expect(response).to redirect_to(movies_path)
    end
    
    it 'deletes a movie' do
        @movie = Movie.create(:title => "Star Wars", :director => "George Lucas", :rating => 'PG')
        @movie.destroy
        expect{Movie.find(@movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
    
end