require './main'
describe "Main" do

    before do
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

    context "input_command build_library" do
        it "split build_library|a|b|4 command return Invalid Value, It must be an integer!" do
            response = @main.input_command("build_library|a|b|4")
            expect(response).to eq("Invalid Value, It must be an integer!")
        end
        it "split build_library||| command return Invalid Value!" do
            response =  @main.input_command("build_library|||")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|1|2| command return Invalid Value!" do
            response =  @main.input_command("build_library|1|2|")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|a- command return Invalid Value!" do
            response =  @main.input_command("build_library|a-")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|2|1|3 command return Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added " do
            response =  build_library
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added")
        end
        it "split build_library|0|1|3 command return No Shelf added " do
            response =  @main.input_command("build_library|0|1|3")
            expect(response).to eq("No Shelf added")
        end
        it "split build_library|4|1|3 command return Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added\nShelf 3 with 1 rows and 3 columns is added\nShelf 4 with 1 rows and 3 columns is added" do
            response =  @main.input_command("build_library|4|1|3")
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added\nShelf 3 with 1 rows and 3 columns is added\nShelf 4 with 1 rows and 3 columns is added")
        end
        
        it "split build_library|1|1|3 command return Shelf 1 with 1 rows and 3 columns is added" do
            response = Main.new.input_command("build_library|1|1|3")
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added")
        end
    end 
    context "input_command put_book" do
        it "split put_book||| return Invalid Value!" do
            build_library
            response =  @main.input_command("put_book|||")    
            expect(response).to eq("Invalid Value!")
        end
        it "split put_book|9780747532743|Harry Potter 1|123 return Invalid Value!" do
            build_library
            response =  @main.input_command("put_book|9780747532743|Harry Potter 1|123")
            expect(response).to eq("Invalid Value!")
        end
        it "split put_book|abc|Harry Potter 1|J. K. Rowling return Invalid Value!" do
            build_library
            response =  @main.input_command("put_book|abc|Harry Potter 1|J. K. Rowling")
            expect(response).to eq("Invalid Value!")
        end
        it "split put_book|9780747532743|Harry Potter 1|J. K. Rowling return Allocated address: 010101" do
            build_library
            response =  put_book
            expect(response).to eq("Allocated address: 010101")
        end
        it "split put_book|9780807281918|Harry Potter 2|J. K. Rowling return Allocated address: 010102" do
            build_library
            put_book
            response =  put_book2
            expect(response).to eq("Allocated address: 010102")
        end
        it "split put_book|9780739330944|Eragon 1|Christopher Paolini return Allocated address: 010103" do
            build_library
            put_book
            put_book2
            response = put_book3
            expect(response).to eq("Allocated address: 010103")
        end
        it "split put_book|9780545582933|Harry Potter 3|J. K. Rowling return Allocated address: 020101" do
            build_library
            put_book
            put_book2
            put_book3
            response = put_book4
            expect(response).to eq("Allocated address: 020101")
        end
        it "split put_book|9780132350884|Clean Code|Robert Cecil Martin return Allocated address: 020102" do
            build_library
            put_book
            put_book2
            put_book3
            put_book4
            response = put_book5
            expect(response).to eq("Allocated address: 020102")
        end
        it "split put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck return Allocated address: 020103" do
            build_library
            put_book
            put_book2
            put_book3
            put_book4
            put_book5
            response = put_book6
            expect(response).to eq("Allocated address: 020103")
        end
    end
end
