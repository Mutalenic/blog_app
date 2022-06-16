require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET /index' do
        context 'when the page is opened' do
            it 'returns a correct response' do
                get '/users'
                expect(response).to have_http_status(200)
                expect(response.body).to include('<h1>Users</h1>')
                expect(response.body).to include('<p>Show all users</p>')
                # expect(response.body).to render_template('users/index')
        end
    end
    end
end