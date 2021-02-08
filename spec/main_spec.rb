require 'hello'

describe Hello do 
    it "should say 'Hello World' when we call the say_hello method" do 
        obj = Hello.new
        message = obj.message
        expect(message).to eq "hello"
    end
 end