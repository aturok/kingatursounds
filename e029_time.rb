bass_chords = [
  [:a2, :c3, :e3],
  [:e2, :g3, :b2],
  [:g2, :b2, :d3],
  [:d2, :fs4, :a2],
  
  [:a2, :c3, :e3],
  [:c2, :e3, :g3, :b3],
  [:g2, :b2, :d3],
  [:d2, :fs4, :a2],
]

live_loop :bass_chords do
  n = tick
  chrd = bass_chords[n%8]
  with_fx :lpf, cutoff: 85 do
    with_synth :piano do
      with_synth_defaults sustain: 1 do
        play_chord(chrd)
        synth :bnoise, release: 2, amp: 0.05
        sleep 2
      end
    end
  end
end

live_loop :line do
  n = tick
  note = [:a5,:e6,:g5,:d6,:a5,:c6,:g5,:d6][n % 8]
  
  with_fx :ping_pong do
    with_synth :dull_bell do
      sample :perc_snap, amp: 0.01
      sleep 0.1
      play note, amp: 0.2
      sleep 0.4
      #play note, amp: 0.85
      sleep 0.5
      #play note, amp: 0.6
      sleep 0.5
      
      sleep 0.5
    end
  end
end


live_loop :drum do
  sample :drum_heavy_kick, amp: 0.3
  sleep 1
  #sample :drum_snare_soft, amp: 0.4
  sleep 0.95
  sample :drum_tom_lo_soft, amp: 0.25
  sleep 1.05
  #sample :drum_snare_soft, amp: 0.25
  sleep 1
end



