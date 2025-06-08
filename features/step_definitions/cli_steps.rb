Given('the file {string} exists') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('Artist successfully run `mmw -f \/tmp\/My-Project\/ score Song.ly`') do
  command = "bundle exec bin/mmw score song.ly"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
end

Then('`\/tmp\/My-Project\/Song.mid` should exist') do
  pending # Write code here that turns the phrase above into concrete actions
end

