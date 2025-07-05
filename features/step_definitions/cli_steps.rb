Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true                                 
end

Given /^the file "([^"]*)" doesn't exist$/ do |file|                        
  unless File.exist?(file)                                                  
    FileUtils.mkdir_p(file) # Create directory if it doesn't exist          
  end                                                                       
end

Given('Artist successfully runs `mmw -n {string} score {string}`') do |string, string2|
  command = "bundle exec bin/mmw -n #{string} score #{string2}"
  @output = `#{command}`                                                                                                                                                    
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Success: .ly file built")
end

Then('the file {string} is created') do |file|                              
  unless File.exist?(file)                                                  
    raise "Expected #{file} to be created, but it does not exist."          
  end                                                                       
  puts "#{file} exists."                                                    
end                                                                         
  
