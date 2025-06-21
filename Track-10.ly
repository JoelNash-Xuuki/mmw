\version "2.22.0"

\header {
  tagline = "xuuki"
  title = "song-title"
  composer = "vyvn"
}
\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Bass"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
        \include "notes/ns-3001"
      }
     >>
    \new StaffGroup <<
      \new Staff \with {
        instrumentName= "Snare"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
        \include "notes/ns-5001"
        \include "notes/ns-6001"
      }
      \new Staff \with {
        instrumentName= "HiHat"
      }

      {
        \time 4/4
        \tempo 4 = 84
        \clef bass
        \key c \major
        \include "notes/ns-6001"
      }
     >>
  >>
  \layout {}
  \midi {
    \tempo 4 = 84
  }
}
