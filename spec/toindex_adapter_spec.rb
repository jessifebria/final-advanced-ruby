require './booklocation_to_index_adapter'

describe "Book Location To Index Adapter" do
    it "060211 return 5,1,10" do
        adapter = BookLocationToIndexAdapter.new
        shelter_index, row_index, column_index = adapter.convert("060211") 
        expect(shelter_index).to eq(5)
        expect(row_index).to eq(1)
        expect(column_index).to eq(10)
    end

end