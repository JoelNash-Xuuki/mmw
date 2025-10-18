Feature: Artist can render a midi and pdf file
  A musician will need to write musical scores, and use a midi file
  to support the sound design for the score. For test to succeed create dir 
  /tmp/My-Project and create the file and dir /tmp/My-Project/notes/ns-6001, ns-3001 and ns-5001 
  containing lilypond note(s). Also make /tmp/My-Project/stems dir. cp patches/mpatch3 from modsyn to
  /tmp/My-Project/patches and make the fille testPatch-3 is also there.

Scenario: Render a .ly and .csd file
  Given the file "/tmp/My-Project" doesn't exist
  Then the file "/tmp/My-Project" is created
  And the file "patches/testPatch-3" does exist
  And Artist successfully runs `mmw -n "/tmp/My-Project" score "--filename=song" "--service=xuuki" "--title=songtitle" "--artist=artist" "--patch=patches/testPatch-3"`
  And Artist successfully runs `mmw -n "/tmp/My-Project" sounddesign "--patch=patches/mpatch3" "--csound=feature.csd" "--midichn=3"`
