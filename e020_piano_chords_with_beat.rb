use_bpm 120

cymr = 2
cyml = 0.3

live_loop :beat do
  #sample :drum_tom_lo_hard
  play :a2, release: 3, amp: 3
  sleep 2
  sample :drum_bass_hard, cutoff: 85
  play :e2, release: 2, amp: 3
  sleep 1
  #sample :drum_cymbal_closed, finish: cyml, rate: cymr, amp: 0.5
  #sleep 0.5
  #sample :drum_cymbal_closed, finish: cyml, rate: cymr, amp: 0.5
  #sleep 0.5
end

# a minor
# a b c d e f g

live_loop :notes do
  x = tick
  n = pick([:a4, :d4, :e4, :f4], 1)[0]
  #stop
  with_fx :reverb, room: 0.8 do
    if one_in(4)
      if one_in(2)
        use_synth :sine
        play n-12, release: 3
      end
      sleep 3
    else
      use_synth :piano
      play_chord [n, n+7], sustain: 1
      sleep 1
      play n+7
      sleep 1
      
      if one_in(3)
        play n+4
      end
      
      sleep 1
    end
  end
end