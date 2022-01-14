##| so I've seen a video of the Underdog Belgium electronic music school
##| on what they call Arpeggiator and what one can do with it
##| essentially that's a tool in a DAW that let's you play arpeggios over
##| a given chord progression.
##| In Sonic Pi we don't need a tool for that - we've got our programming language
##| since the effect is quite nice I wanted to reproduce that stuff
##| and also see how one can do that kind of thing in Sonic efficiently

##| first we'll need a scale
##| print(scale(:a, :minor))
##| whatever
##| no, a minor is dull, bcs it's C major
##| whatever again, let's use it
##| we'll take 1-2-4-5 chord progression
##| abcdefg

##| chords = [
##|   [:a4, :c4, :e4],
##|   [:b4, :d4, :f4],
##|   [:d4, :f4, :a4],
##|   [:e4, :g4, :b4],
##| ]

##| now D major
##| D, E, F?, G, A, B, and C?

chords = [
  [:d4, :fs4, :a4],
  [:e4, :g4, :b4],
  [:g4, :b4, :d4],
  [:a4, :cs4, :e4],
]

##| now just play a sine rotating through these in one loop

live_loop :one do
  upper_pitch_shift = 12
  cue :one
  chord1 = chords[tick() % 4];
  play_chord chord1.map { |n| n-0 }, amp: 0.6, sustain: 0.5, release: 0.5
  
  # I will just pick random notes from the chord and play fourths on top
  # of the note that's already playing
  
  play pick(chord1)[0]+upper_pitch_shift, amp: 1, sustain: 0.125, release: 0.125
  sleep 0.3
  if rand() > 0.1 then
    play pick(chord1)[0]+upper_pitch_shift, amp: 0.2, sustain: 0.125, release: 0.075
  end
  sleep 0.2
  if rand() > 0.1 then
    play pick(chord1)[0]+upper_pitch_shift, amp: 0.6, sustain: 0.125, release: 0.125
  end
  sleep 0.35
  if rand() > 0.1 then
    play pick(chord1)[0]+upper_pitch_shift, amp: 0.4, sustain: 0.075, release: 0.075
  end
  
  sleep 0.15
end

##| they were overlapping - hence the ugliness


##| next step is to play the actual notes over them.
##| I'd like to do that in a separate live_loop, but I have to know
##| the chord that I'm currently playing in there
##| let's start in the same loop

##| it does sound interesting, but the problem is
# (1) we barely distinguish the two lines - mostly hear just the short ones
# (2) it's just messy

# let's push them from each other in terms of pitch
# - just shift the upper ones an octave higher
# - and I'd push the lower ones an octave lower

# now at least we have something going on
# to make it more interesting I have a very limited range of tools
# (1) I could skip notes in some cases (some of them)
# (2) I could accent some of them more and some of them less (changing amp)
# (3) I could add some swing
# (4) I could also sometimes play longer or shorter notes
# all of these are about the upper (and shorter) notes - I won't touch the bass


# It does get better with some skips

# Playing with amp is difficult - afaik there are some complexities about
# how it is interpreted.
# I do feel some difference, but have mixed feelings about it. Very subtle.
# Not sure if valuable. Let's leave as is and try to add swing
# (swing is 'delaying' certain notes in the pattern -
# we'll delay the second and fourth
# it would mean playing them shorter and sleeping more before them

# Probably a bit too much
# Plus I miscalculated, so they got overlapped

# Won't be trying to play longer/shorter now
# The thing did got somewhat interesting - at least at my level.
# One could certainly come up with nice patterns of notes instead of
# just playing them at random
# Plus, if the pattern is fixed there is more room for playing reasonably
# with the length of notes
# Next thing to do for me would be to code up several fixed patterns and pick
# at random from them - that should drive us closer to something like a melody
# that actually has some fixed emotion (on top of the emotion given by the scale)

# However, no time now, so let me just switch it to a different scale,
# to check whether I'll see a change in sentiment and then we get off to bed

# Well, at least I'm good enough to feel the emotional difference
# between a minor and major scale
# Cool, off to bed. Thanks for going through this with me!

sample :drum_heavy_kick
sleep 0.5
sample :drum_heavy_kick
sleep 0.5
sample :drum_heavy_kick, rate: 0.5
sleep 0.5