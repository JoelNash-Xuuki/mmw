Feature: Artist can render a midi and pdf file
  A musician will need to write musical scores, and use a midi file
  to support the sound design for the score.

Scenario: Render a .ly file
  Given the file "/tmp/My-Project" does exist
  And the file "/tmp/My-Project/song.ly" does exist
