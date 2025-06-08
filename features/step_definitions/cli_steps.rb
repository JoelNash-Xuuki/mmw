Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true                                 
end
