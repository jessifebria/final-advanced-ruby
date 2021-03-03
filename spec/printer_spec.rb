require '../advanced_final/app/printer_factory/printer'

describe 'Printer' do
  it 'return not implemented yet' do
    printer = Printer.new
    expect(printer.print('a')).to eq('Not Implemented Yet')
  end
end
