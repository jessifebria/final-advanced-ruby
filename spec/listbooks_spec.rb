require './app/command/listbooks'
require './app/gateway'

describe 'List Books' do
  before do
    @gateway = Gateway.new
    @listbooks = ListBooks.new
    Library.reset
  end

  let(:build_library) { @gateway.input_command('build_library|2|1|3') }
  let(:put_book) { @gateway.input_command('put_book|9780747532743|Harry Potter 1|J. K. Rowling') }
  let(:put_book2) { @gateway.input_command('put_book|9780807281918|Harry Potter 2|J. K. Rowling') }
  let(:put_book3) { @gateway.input_command('put_book|9780739330944|Eragon 1|Christopher Paolini') }
  let(:put_book4) { @gateway.input_command('put_book|9780545582933|Harry Potter 3|J. K. Rowling') }
  let(:put_book5) { @gateway.input_command('put_book|9780132350884|Clean Code|Robert Cecil Martin') }
  let(:put_book6) { @gateway.input_command('put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck') }

  context 'execute' do
    it 'return as expected' do
      build_library
      put_book
      put_book2
      put_book3
      put_book4
      put_book5
      response = @listbooks.execute
      expect(response).to eq("010101 : 9780747532743 | Harry Potter 1 | J. K. Rowling\n010201 : 9780807281918 | Harry Potter 2 | J. K. Rowling\n010301 : 9780739330944 | Eragon 1 | Christopher Paolini\n020101 : 9780545582933 | Harry Potter 3 | J. K. Rowling\n020201 : 9780132350884 | Clean Code | Robert Cecil Martin\n")
    end
  end
end
