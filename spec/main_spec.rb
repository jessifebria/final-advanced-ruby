require './main'

describe "Main" do
    context "build_library" do
        it "split build_library|2|1|3 command return [2,1,3]" do
            response = input_command("build_library|2|1|3")
            expect(response).to eq([2,1,3])
        end
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
    end 
end