# Welcome to Sonic Pi

# settings:
# - chord - an array of notes
# - beat_len, dflt: 1
# - note_len
# - note_dflt - same as note in pattern
# - pitch_shift
#
# pattern:
# - note: idx | r | p | rp (random or pause)
# - len: as part of beat_len, default: 0.25 or 'r'
# - swing: 0.0-1.0 as pct of len
#

## missing:
## - pitch shift (including that on note) / octave

def arpeggiator(settings, pattern)
  l = settings[:beat_len]
  chrd = settings[:chord]
  slept = 0
  pattern.each  do |p|
    ln = p[:len]
    ln = settings[:note_len] if ln.nil?
    ln = 0.25 if ln.nil?
    lnx = ln*l
    swing = p[:swing]
    swing = 0.0 if swing.nil?
    
    pitch_sh = p[:pitch_shift]
    pitch_sh = settings[:pitch_shift] if pitch_sh.nil?
    pitch_sh = 0 if pitch_sh.nil?
    
    n = p[:note]
    print(n)
    if n == "r" then n = rand_i(chrd.length) end
    if n == "rp" then n = rand_i(chrd.length+1) end
    
    if n == "p" || n >= chrd.length  then
      sleep lnx
      slept += lnx
    else
      n = chrd[n]
      sleep swing*lnx
      play n+pitch_sh, sustain: 0.75*lnx-swing*lnx, release: 0.5*lnx
      sleep (1-swing)*lnx
      slept += lnx
    end
  end
  
  if slept < l then sleep l - slept end
end

# bf minor
# bf c d ef f g a bf

chords = [
  [:bf4, :d4, :f4],
  [:c4, :ef4, :g4],
  [:ef4, :g4, :bf4],
  [:f4, :a4, :c4],
]

live_loop :x do
  c = pick(chords)[0]
  with_fx :slicer, wave: 1, phase: 0.15 do
    with_synth :sine do
      play_chord c.map{ |x| x}, amp: 0.8, release: 1
    end
  end
  
  
  with_fx :lpf, cutoff: 100 do
    with_synth :sine do
      arpeggiator(
        { beat_len: 1, note_len: 1.0/8, chord: c, pitch_shift: -12 },
        range(0,8).map { |x| {note: "rp", swing: x % 2 == 1 ? 0.1 : 0, len: pick([1.0/8, 1.0/8])[0]}}
      );
    end
  end
end

live_loop :yx do
  with_fx :vowel do
    synth :saw, note: :a5, attack: 0.2, release: 0.5
    sleep 0.5
    synth :saw, note: :b4, attack: 0.2, release: 0.5
    sleep 0.5
    synth :saw, note: :e6, attack: 0.2, release: 0.5
    sleep 0.5
  end
  
end
