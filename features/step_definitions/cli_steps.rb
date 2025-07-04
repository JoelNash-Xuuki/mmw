Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true                                 
end

Given /^the file "([^"]*)" doesn't exist$/ do |file|                                                                  
  if File.exist?(file)                                                                                                
    if File.directory?(file)                                                                                          
      FileUtils.rm_rf(file) # Remove directory and its contents                                                       
    else                                                                                                              
      FileUtils.rm(file) # Remove file                                                                                
    end                                                                                                               
  end                                                                                                                 
  FileUtils.mkdir_p(file) # Create directory                                                                          
end                                                                                                                    

Given('Artist successfully runs `mmw -n {string} score {string}`') do |string, string2|
  command = "bundle exec bin/mmw -n #{string} score #{string2}"
  @output = `#{command}`                                                                                                                                                    
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Success: .ly file built")
end

