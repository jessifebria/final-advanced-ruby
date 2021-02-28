require_relative 'libraryprinter'
require_relative 'bookprinter'

class PrinterFactory 

    def self.new_printer(type)
        case type
        when 'library'
            LibraryPrinter.new
        when 'bookprinter'
            BookPrinter.new
        end
    end
    
end