require './main'

describe "Main" do
    context "build_library" do
        # it "split build_library|2|1|3 command return [2,1,3]" do
        #     response = input_command("build_library|2|1|3")
        #     expect(response).to eq([2,1,3])
        # end
        it "split build_library|a|b|4 command return Invalid Value, It must be an integer!" do
            response = input_command("build_library|a|b|4")
            expect(response).to eq("Invalid Value, It must be an integer!")
        end
        it "split build_library||| command return Invalid Value!" do
            response = input_command("build_library|||")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|1|2| command return Invalid Value!" do
            response = input_command("build_library|1|2|")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|a- command return Invalid Value!" do
            response = input_command("build_library|a-")
            expect(response).to eq("Invalid Value!")
        end
        it "split build_library|2|1|3 command return Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added " do
            response = input_command("build_library|2|1|3")
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added")
        end
        it "split build_library|0|1|3 command return No Shelf added " do
            response = input_command("build_library|0|1|3")
            expect(response).to eq("No Shelf added")
        end
        it "split build_library|4|1|3 command return Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added\nShelf 3 with 1 rows and 3 columns is added\nShelf 4 with 1 rows and 3 columns is added" do
            response = input_command("build_library|4|1|3")
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added\nShelf 2 with 1 rows and 3 columns is added\nShelf 3 with 1 rows and 3 columns is added\nShelf 4 with 1 rows and 3 columns is added")
        end
        
        it "split build_library|1|1|3 command return Shelf 1 with 1 rows and 3 columns is added" do
            response = input_command("build_library|1|1|3")
            expect(response).to eq("Shelf 1 with 1 rows and 3 columns is added")
        end
    end 
    context "put_book" do
        it "split put_book|9780747532743|Harry Potter 1|J. K. Rowling return [9780747532743,Harry Potter 1,J. K. Rowling]" do
            response = input_command("put_book|9780747532743|Harry Potter 1|J. K. Rowling")    
            expect(response).to eq(["9780747532743","Harry Potter 1","J. K. Rowling"])
        end
        it "split put_book||| return Invalid Value!" do
            response = input_command("put_book|||")    
            expect(response).to eq("Invalid Value!")
        end
        it "split put_book|9780747532743|Harry Potter 1|123 return Invalid Value!" do
            response = input_command("put_book|9780747532743|Harry Potter 1|123")
            expect(response).to eq("Invalid Value!")
        end
        it "split put_book|abc|Harry Potter 1|J. K. Rowling return Invalid Value!" do
            response = input_command("put_book|abc|Harry Potter 1|J. K. Rowling")
            expect(response).to eq("Invalid Value!")
        end
    end
end