Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true
end

Given /^the file "([^"]*)" doesn't exist$/ do |file|
  unless File.exist?(file)
    FileUtils.mkdir_p(file) # Create directory if it doesn't exist
    notes_dir = "#{file}/notes"
    Dir.mkdir(notes_dir) unless Dir.exist?(notes_dir)
    File.write("#{notes_dir}/ns-6001", "d1")
  end
end

Given('Artist successfully runs `mmw -n {string} score {string} {string} {string} {string} {string}`') do |string, string2, string3, string4, string5, string6|
  command = "bundle exec bin/mmw -n #{string} score #{string2}  #{string3} #{string4} #{string5} #{string6}"
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

Given('Artist successfully runs `mmw -n {string} sounddesign {string} {string} {string} {string}`') do |string, string2, string3, string4, string5|
  command = "bundle exec bin/mmw -n #{string} sounddesign #{string2} #{string3} #{string4} #{string5}"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Success: Csound file created successfully.")
end


