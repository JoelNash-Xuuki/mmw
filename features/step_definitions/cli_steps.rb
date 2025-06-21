Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true                                 
end

Given('Artist successfully runs `mmw -f {string} score {string}`') do |string, string2|
  command = "bundle exec bin/mmw -f #{string} score #{string2}"
  @output = `#{command}`                                                                                                                                                    
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Success: .ly file built")
end

