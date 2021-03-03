require './app/adapter/index_to_booklocation_adapter'

describe 'Index To Book Location Adapter' do
  it '5,1,10 return 060111' do
    adapter = IndexToBookLocationAdapter.new
    response = adapter.convert(5, 1, 10)
    expect(response).to eq('060211')
  end
end
