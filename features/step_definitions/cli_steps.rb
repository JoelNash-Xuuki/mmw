Given('the file {string} does exist') do |string|
  expect(File.exist?(string)).to be true                                 
end


When(/^Artist successfully run `mmw score \/tmp\/song.ly new 'Some new task'`$/) do
  command = "bundle exec bin/mmw score /tmp/song.ly"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
end

Then('{string} should exist') do |pdf_file|
  expect(File.exist?(pdf_file)).to be true                                 
end

And('{string} should exist') do |midi_file|
  expect(File.exist?(midi_file)).to be true                                 
end
