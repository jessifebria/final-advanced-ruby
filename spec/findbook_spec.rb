require './app/command/findbook'
require './app/gateway'

describe 'Find Book' do
  before do
    @findbook = FindBook.new
    @gateway = Gateway.new
    Library.reset
  end

  let(:build_library) { @gateway.input_command('build_library|2|1|3') }
  let(:put_book) { @gateway.input_command('put_book|9780747532743|Harry Potter 1|J. K. Rowling') }
  let(:put_book2) { @gateway.input_command('put_book|9780807281918|Harry Potter 2|J. K. Rowling') }
  let(:put_book3) { @gateway.input_command('put_book|9780739330944|Eragon 1|Christopher Paolini') }
  let(:put_book4) { @gateway.input_command('put_book|9780545582933|Harry Potter 3|J. K. Rowling') }
  let(:put_book5) { @gateway.input_command('put_book|9780132350884|Clean Code|Robert Cecil Martin') }
  let(:put_book6) { @gateway.input_command('put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck') }

  context 'validate params' do
    it 'give params>1 return Invalid Value' do
      response = @findbook.validate(%w[34 23])
      expect(response).to eq('Invalid Value!')
    end
    it 'give not an integer param return Invalid Value!' do
      response = @findbook.validate(['aa'])
      expect(response).to eq('Invalid Value!')
    end
    it 'give int param, only 1, but negative return Invalid Value!' do
      response = @findbook.validate(['-11'])
      expect(response).to eq('Invalid Value!')
    end
    it 'valid param return valid' do
      response = @findbook.validate(['91239872311'])
      expect(response).to eq('valid')
    end
  end

  context 'execute' do
    it 'find_book|-1238123 return Invalid Value!' do
      build_library
      put_book
      put_book2
      put_book3
      put_book4
      response = @findbook.execute(['-1238123'])
      expect(response).to eq('Invalid Value!')
    end
    it 'find_book|9780807281918 return Found the book at 010102' do
      build_library
      put_book
      put_book2
      put_book3
      put_book4
      put_book5
      response = @findbook.execute(['9780807281918'])
      expect(response).to eq('Found the book at 010102')
    end
    it 'find_book|100 return Book not found!' do
      build_library
      put_book
      put_book2
      put_book3
      put_book4
      response = @findbook.execute(['100'])
      expect(response).to eq('Book not found!')
    end
  end
end
