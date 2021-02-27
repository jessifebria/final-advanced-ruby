require './command/takebook'

describe "Take Book" do

    before do
        @takebook = TakeBook.new
    end

    context "validate params" do
        it "give params>1 return Invalid Value" do
            response = @takebook.validate([34,23])
            expect(response).to eq("Invalid Value!")
        end
        it "give not an integer param return Invalid Value!" do
            response = @takebook.validate(["aa"])
            expect(response).to eq("Invalid Value!")
        end
        
    end 
    # context "execute" do
        
    #     it "split put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck return Allocated address: 020103" do
    #         build_library
    #         put_book
    #         put_book2
    #         put_book3
    #         put_book4
    #         put_book5
    #         response = put_book6
    #         expect(response).to eq("Allocated address: 020103")
    #     end
    # end
end
