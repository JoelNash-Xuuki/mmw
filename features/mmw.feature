Feature: Artist can render a midi and pdf file
  A musician will need to write musical scores, and use a midi file
  to support the sound design for the score. For test to succeed create dir 
  /tmp/My-Project and create the file and dir /tmp/My-Project/notes/ns-6001 containing lilypond
  note(s).

Scenario: Render a .ly file
  Given the file "/tmp/My-Project" doesn't exist
  Then create file "/tmp/My-Project"
  And the file "patches/testPatch-3" does exist
  And Artist successfully runs `mmw -n "/tmp/My-Project" score "/tmp/My-Project/song.ly"`


