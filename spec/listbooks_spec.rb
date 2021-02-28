require './command/listbooks'
require './main'

describe "List Books" do

    before do
        @main = Main.new
        @listbooks = ListBooks.new
        Library.reset
    end
    
    let (:build_library) {@main.input_command("build_library|2|1|3")}
    let (:put_book) {@main.input_command("put_book|9780747532743|Harry Potter 1|J. K. Rowling")}
    let (:put_book2){ @main.input_command("put_book|9780807281918|Harry Potter 2|J. K. Rowling") }
    let (:put_book3){ @main.input_command("put_book|9780739330944|Eragon 1|Christopher Paolini")}
    let (:put_book4){ @main.input_command("put_book|9780545582933|Harry Potter 3|J. K. Rowling") }
    let (:put_book5){ @main.input_command("put_book|9780132350884|Clean Code|Robert Cecil Martin")}
    let (:put_book6){ @main.input_command("put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck")}

    context "execute" do
        it "return as expected" do
            build_library
            put_book
            put_book2
            put_book3
            put_book4
            put_book5
            response = @listbooks.execute
            expect(response).to eq("You exceed limit capacity!")
        end
    end 

    
end
