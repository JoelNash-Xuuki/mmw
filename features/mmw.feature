Feature: Artist can render a midi and pdf file
  A musician will need to write musical scores, and use a midi file
  to support the sound design for the score.

Scenario: Render a .ly file
  Given the file '/tmp/song.ly' exists
  When Artist successfully run `mmw score /tmp/song.ly`
  Then `/tmp/song.mid` should exist 
  And  `/tmp/song.pdf` should exist
