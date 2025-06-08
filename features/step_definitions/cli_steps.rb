Given('the file {string} exists') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('Artist successfully run `mmw score \/tmp\/song.ly`') do
  command = "bundle exec bin/mmw score /tmp/song.ly"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
end

Then('`\/tmp\/song.pdf` should exist') do
  expect(File.exist?('/tmp/saodjfkdlng.pdf')).to be true
end

Then('`\/tmp\/song.mid` should exist') do
  expect(File.exist?('/tmp/saong.mid')).to be true
end
