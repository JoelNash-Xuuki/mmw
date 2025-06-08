Feature: Artist can render a midi and pdf file
  A musician will need to write musical scores, and use a midi file
  to support the sound design for the score.

Scenario: Render a .ly file
  Given the file 'Song.ly' exists
  When Artist successfully run `mmw -f /tmp/My-Project/ score Song.ly`
  Then `/tmp/My-Project/Song.mid` should exist 
  And  `/tmp/My-Project/Song.mid` should exist
