use_bpm 120

cymr = 2
cyml = 0.3

live_loop :beat do
  sample :drum_bass_soft, cutoff: 85
  sleep 1.5
  play :a2, release: 3, amp: 3
  sleep 1.5
  #sample :drum_bass_hard, cutoff: 85
  #play :e2, release: 2, amp: 3
  #sleep 1
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
  use_synth :piano
  with_fx :reverb, room: 0.8 do
    play_chord [n-24,n+7-24], sustain: 2
    if one_in(4)
      if one_in(2)
        with_synth :sine do
          play n, sustain: 2
        end
      end
      sleep 3
    else
      play_chord [n, n+7], sustain: 1
      sleep 1
      play n+7
      sleep 1
      
      if one_in(3)
        play n+4
      end
      
      sleep 0.5
      
      if one_in(3)
        play n+4
      end
      sleep 0.5
    end
  end
end