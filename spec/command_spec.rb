require '../advanced_final/app/command/command'

describe 'Printer' do
  it 'return not implemented yet' do
    command = Command.new
    expect(command.validate('a')).to eq('Not Implemented Yet')
  end
  it 'return not implemented yet' do
    command = Command.new
    expect(command.execute('a')).to eq('Not Implemented Yet')
  end
end
