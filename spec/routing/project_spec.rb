require 'rails_helper'

describe 'project routes' do
  it 'should root to project index' do
    expect(get '/').to route_to('projects#index')
    expect(get '/projects').to_not route_to('projects#index')
  end
end
