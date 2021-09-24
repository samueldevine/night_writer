module ReadableCSV
  def read_csv(path)
    CSV.read(path, headers: true)
  end
end
