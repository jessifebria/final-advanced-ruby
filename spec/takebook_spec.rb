require './command/takebook'
require './main'

describe "Take Book" do

    before do
        @takebook = TakeBook.new
        @main = Main.new
        Library.reset
    end
    
    let (:build_library) {@main.input_command("build_library|2|1|3")}
    let (:put_book) {@main.input_command("put_book|9780747532743|Harry Potter 1|J. K. Rowling")}
    let (:put_book2){ @main.input_command("put_book|9780807281918|Harry Potter 2|J. K. Rowling") }
    let (:put_book3){ @main.input_command("put_book|9780739330944|Eragon 1|Christopher Paolini")}
    let (:put_book4){ @main.input_command("put_book|9780545582933|Harry Potter 3|J. K. Rowling") }
    let (:put_book5){ @main.input_command("put_book|9780132350884|Clean Code|Robert Cecil Martin")}
    let (:put_book6){ @main.input_command("put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck")}

    context "validate params" do
        it "give params>1 return Invalid Value" do
            response = @takebook.validate(["34","23"])
            expect(response).to eq("Invalid Value!")
        end
        it "give not an integer param return Invalid Value!" do
            response = @takebook.validate(["aa"])
            expect(response).to eq("Invalid Value!")
        end
        it "give int param, only 1, but length !=6 return Invalid Value!" do
            response = @takebook.validate(["11238"])
            expect(response).to eq("Invalid Value!")
        end
        it "give int param, only 1, length == 6, but negative return Invalid Value!" do
            response = @takebook.validate(["-11238"])
            expect(response).to eq("Invalid Value!")
        end
        it "give exceeding value of takebook return You exceed limit capacity!" do
            build_library
            put_book
            put_book2
            put_book3
            put_book4
            put_book5
            response = @takebook.validate(["010401"])
            expect(response).to eq("You exceed limit capacity!")
        end
        it "give one integer param, length ==6 and <99 return valid" do
            build_library
            put_book
            put_book2
            put_book3
            put_book4
            put_book5
            response = @takebook.validate(["112223"])
            expect(response).to eq("You exceed limit capacity!")
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
