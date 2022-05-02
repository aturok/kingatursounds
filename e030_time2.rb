bass_chords = [
  [:a2, :c3, :e3],
  [:e2, :g3, :b2],
  [:g2, :b2, :d3],
  [:d2, :a2, :fs4],
  
  [:a2, :c3, :e3],
  [:c2, :e3, :g3, :b3],
  [:g2, :b2, :d3],
  [:d2, :a2, :fs4],
]

def play_c(c)
  #play_chord(c)
  play c[0], sustain: 1.5
  rest = 1
  if(c.length() == 4)
    rest = 2
    play c[1], sustain: 1.5
  end
  sleep 0.25
  play c[rest]
  sleep 0.25
  play c[rest+1]
  sleep 1.5
end



live_loop :bass_chords do
  n = tick
  cue :bar, n: n
  chrd = bass_chords[n%8]
  with_fx :hpf, cutoff: 35 do
    with_fx :lpf, cutoff: 95 do
      with_synth :piano do
        with_synth_defaults sustain: 1 do
          play_c(chrd)
          #synth :bnoise, release: 2, amp: 0.05
          #sleep 2
        end
      end
    end
  end
end

live_loop :ambient do
  sync :bar
  with_fx :bpf, centre: choose([:e3,:e4,:e5])  do
    synth :bnoise, sustain: 2, amp: 0.05
  end
end


live_loop :line do
  #stop
  values = sync :bar
  n = values[:n]
  print n
  note = [:a5,:e6,:g5,:d6,:a5,:c6,:g5,:d6][n % 8]
  
  with_fx :ping_pong, feedback: 0.25, phase: 0.25 do
    with_synth :dull_bell do
      sample :perc_snap, amp: 0.01
      sleep 0.1
      play note, amp: 0.2
      sleep 0.4
      #play note, amp: 0.85
      sleep 0.5
      #play note, amp: 0.6
      sleep 0.5
      
    end
  end
end


live_loop :drum do
  stop
  sample :drum_heavy_kick, amp: 0.3
  sleep 1
  #sample :drum_snare_soft, amp: 0.4
  sleep 0.95
  sample :drum_tom_lo_soft, amp: 0.25
  sleep 1.05
  #sample :drum_snare_soft, amp: 0.25
  sleep 1
end



