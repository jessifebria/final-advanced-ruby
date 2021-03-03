class IndexToBookLocationAdapter
  def convert(shelter_index, row_index, column_index)
    "#{(shelter_index + 1).to_s.rjust(2,'0')}#{(row_index + 1).to_s.rjust(2,'0')}#{(column_index + 1).to_s.rjust( 2, '0')}"
  end
end
