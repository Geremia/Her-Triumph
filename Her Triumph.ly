% A.M.D.G.

\version "2.18.2"
\language "english"

#(set-default-paper-size "letter")
#(set-global-staff-size 17)
#(ly:set-option 'point-and-click #f)

\paper {papersize = "letter"}

\header {
  dedication = "Our Blessed Virgin Mother"
  %subsubtitle = "Composed Lent 2016"
  title = \markup {
    \with-url #"https://music.benedictinesofmary.org/node/19"
    {Her Triumph}
  }
  composer = \markup {
    \with-url #"http://benedictinesofmary.org"
    {Benedictines of Mary, Queen of Apostles}
  }
  tagline = \markup {
    Engraved on
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

%parenthesizing a group of notes
%http://lsr.di.unimi.it/LSR/Snippet?id=902
startParenthesis = {
  \override ParenthesesItem.font-size = #1
  \once \override ParenthesesItem.stencils = #(lambda (grob)
                                                (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
                                                  (list (car par-list) point-stencil )))
}
endParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
                                                (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
                                                  (list point-stencil (cadr par-list))))
}

% flats: a, b, e

upper =	 \relative c'' {
  \clef treble
  \key c \minor
  \time 4/4

  % line 1
  \partial 8 g,8
  c4 ef8 \noBeam f g [(af g4)]
  f8 [(ef)] d [(bf)] c4. g8
  bf [c] ef [f] ef [(d8)] c8 [(bf8)]

  % line 2
  c4. g'8 af [g] f [ef]
  \time 3/8
  f \noBeam (af)  \noBeam f  \noBeam
  \time 2/4
  g2
  \time 3/4
  c,8 [(d)] ef [f] g [bf]
  \time 3/8
  a [(g)] f
  \time 3/4
  g4. g8 \noBeam

  % line 3
  bf c
  \time 3/8
  c4 c8
  \time 1/4
  bf c \noBeam
  \time 3/8
  g4 g8
  \time 3/4
  f [g] af [(g)] f [(ef)]
  \time 3/8
  f [(af)] f
  g4

  % line 4
  g8
  g \noBeam [(f)] ef \noBeam
  \time 4/4
  f [(ef)] d [(bf)] << {\stemUp c2} {s4. \parenthesize c8} >>
  ef8 [(c)] bf [c] bf [c]
  \time 3/8
  ef [(f)] ef
  \time 2/4
  d4 (c) \bar "||"
  
  % final stanza
  \break \mark \markup { \musicglyph #"scripts.segno" }
  \once \omit Staff.TimeSignature
  \time 2/4
  g'4 bf8 [c]
  \time 3/4
  c4. c8 \noBeam bf \noBeam c
  \time 3/8
  d8 \noBeam c \noBeam bf
  \time 4/4
  c4. \noBeam g8 af4 f8 \noBeam g
  af4 \noBeam f8 \noBeam g
  af \noBeam bf \noBeam c \noBeam d
  c1\fermata
}

lower =	 \relative c'' {
  \clef treble
  \key c \minor
  \time 4/4

  % line 1
  \partial 8 g,8
  c4 c8 \noBeam d ef4. c8
  d4 bf g4. g8
  g [g] g [g] af4 af4

  % line 2
  g4. c8 f [f] d [d]
  %\time 3/8
  d4 d8
  %\time 2/4
  ef2
  %\time 3/4
  c4 c8 [d] ef [ef]
  %\time 3/8
  f4 f8
  %\time 3/4
  g4. g8 \noBeam

  % line 3
  ef d
  %\time 3/8
  c4 c8
  %\time 1/4
  d d \noBeam
  %\time 3/8
  ef4 ef8
  %\time 3/4
  ef [ef] c4 d
  %\time 3/8
  d4 <<
    {
      \once \override NoteColumn.force-hshift = #3
      \startParenthesis \parenthesize d8 \endParenthesis \parenthesize ef4
    } \\ {c8 b4}
  >>
  
  % line 4
  b8
  c \noBeam c \noBeam c
  %\time 4/4
  bf4 bf << {bf (\stemUp af)} {s4. \parenthesize af8} >>
  af4 af8 [af] af [af]
  %\time 3/8
  c [d] c
  %\time 2/4
  bf [f] g4
  
  %final stanza
  \once \omit Staff.TimeSignature
  <ef' g>4 <ef g>8 <ef g>
  <f af>4. <f af>8 \noBeam <f af> \noBeam <f af>
  %\time 3/4
  <f af> \noBeam <f af> \noBeam <f af>
  <ef g>4. <ef g>8 <c f>4 <c f>8 \noBeam <c f>
  <c f>4 <c f>8 \noBeam <c f>
  <c f af> \noBeam <c f af> \noBeam <c f af> \noBeam <c f af>
  <c e g>1\fermata  \bar "|."
}

wordsA = \lyricmode {
  \set stanza = \markup{\right-align "1."}
  The crowds that waved palms now de -- ride. He is by Pe -- ter thrice de --
  nied. And faith -- less the a -- po -- stles flee. God ru -- ined, who could stay to see? The
  pas -- sion of the Church be -- gun, His bo -- dy Mys -- tic set up -- on,
  de -- filed by ruth -- less hands, ____ in blows and cur -- ses, spit and bands?

  %final stanza
  And I be -- lieve with my whole heart, I be -- lieve, His bo -- dy will rise and re --
  ceive the vic -- to -- ry!
}

wordsB = \lyricmode {
  \set stanza = \markup{\right-align "2."}
  "" Cru -- ci ____ -- fied__in sor -- row great, His truths are posed as crimes of hate. When His com -- mand -- ments none will teach, His blood can -- not His mem -- bers reach. Dis --
  fig -- ured and of beau -- ty reft, He sees be -- low a rem -- nent left.
  And in His gasp -- ing pleas ____ He entrusts you, faith -- ful Mo -- ther__to these.
}

wordsC = \lyricmode {
  \set stanza = \markup{\right-align "3."}
  "" Three days of darkness He lies slain. No sem -- blance of His Church re --
  mains, ex -- tin -- guished by the blindness of sin and the  be -- tray -- als from with -- in. O
  Mo -- ther will your tri -- umph be, now when His foes claim vic -- to -- ry?
  O will He__find faith__up -- on__the earth a -- part from ___ you who gave Him birth?
}

wordsD = \lyricmode {
  \set stanza = \markup{\right-align "4."}
  "" While it a -- ppears__the faith is gone, a -- lone in you the faith lives
  on. I will not dwell in faith -- less gloom, nor hast -- en to an emp -- ty tomb. He
  came all glor -- i -- ous to you, His wound -- ed hands out -- stretched a -- new. \markup{\small {\italic "D.S. al fine"}}
}

\score {
  \new ChoirStaff <<
    \new Staff {
      \set Staff.midiInstrument = #"choir aahs"
      \new Voice = "upperVoice" {
        \upper
      }
    }

    \new Lyrics = "upper"
    \context Lyrics = "upper" {
      \lyricsto "upperVoice" {
        \wordsA
      }
    }

    \new Lyrics = "upper"
    \context Lyrics = "upper" {
      \lyricsto "upperVoice" {
        \wordsB
      }
    }

    \new Lyrics = "upper"
    \context Lyrics = "upper" {
      \lyricsto "upperVoice" {
        \wordsC
      }
    }

    \new Lyrics = "upper"
    \context Lyrics = "upper" {
      \lyricsto "upperVoice" {
        \wordsD
      }
    }

    \new Staff {
      \set Staff.midiInstrument = #"voice oohs"
      \new Voice = "lowerVoice" {
        \lower
      }
    }
  >>
  \layout { }
  \midi {
    \context {
      \Score
      midiMinimumVolume = #0.0
      midiMaximumVolume = #1.0
    }
  }
}

\paper{
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.5\in
  right-margin = 0.5\in
  indent = 0
}