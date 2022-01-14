# Welcome to Sonic Pi

# syncopy

##| chord 1/4
##| 3,5 1/4 - 1 1/8

key = :cs
sc = :minor

use_synth :piano
use_bpm 120

##| c = chord_degree(1, :c, :major, 3, invert: -1)
##| c.each { |n| play(n); sleep 0.5 }

live_loop :rh do
  ##| stop
  chords = [
    chord_degree(1, key-12, sc, 3),
    chord_degree(2, key-12, sc, 3),
    chord_degree(6, key-12, sc, 3, invert: -1),
    chord_degree(5, key-12, sc, 3, invert: -1),
  ]
  
  with_fx :reverb, room: 0.8 do
    chords.each do |chord1|
      play_chord(chord1, sustain: 0.5, release: 0.5)
      sleep 1
      
      play chord1[1], sustain: 0.5, release: 0.5
      play chord1[2], sustain: 0.5, release: 0.5
      sleep 0.5
      play chord1[0], release: 0.5
      sleep 0.5
    end
  end
end

live_loop :lh do
  sleep 1
end

live_loop :groove do
  sample :drum_heavy_kick, amp: 1, lpf: 80
  sleep 1
  sample :drum_heavy_kick, amp: 0.8, lpf: 70
  sleep 0.5
  sample :drum_heavy_kick, amp: 0.8, lpf: 70
  sleep 0.5
  
  sample :drum_heavy_kick, amp: 1, lpf: 80
  sleep 1
  sleep 0.5
  sample :drum_heavy_kick, amp: 0.8, lpf: 70
  sleep 0.5
end

