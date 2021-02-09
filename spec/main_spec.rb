require './main'

describe "Main" do
    context "build_library" do
        it "split build_library|2|1|3 command return 2,1,3" do
            response = input_command("build_library|2|1|3")
            expect(response).to eq([2,1,3])
        end
    end 
end