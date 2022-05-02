live_loop :c3 do
  t = tick
  bss = [:a3,:f3,:d3][t%3]
  cue :ccc, bss: bss, root: [:a5,:f5,:d5][t%3]
  ##| cue :bar, n: n
  sleep 2
end


live_loop :bass do
  values = sync :ccc
  n = values[:bss]
  print values
  
  with_fx :ping_pong, feedback: 0.05 do
    with_fx :lpf, cutoff: 60 do
      2.times do
        synth :dsaw, detune: 0.1, note: n, sustain: 0.12, release: 0.01
        sleep 0.125
        synth :dsaw, detune: 0.3, note: n, sustain: 0.25, release: 0.01, amp: 0.7
        sleep 0.25
      end
      7.times do
        synth :dsaw, detune: 0.3, note: n, sustain: 0.12, release: 0.01, amp: choose([0.7,0.85,1])
        sleep 0.125
      end
      synth :dsaw, detune: 0.1, note: n, sustain: 0.12, release: 0.01
    end
  end
end

live_loop :chords do
  values = sync :ccc
  n = values[:root]
  ct =  n==:f5 ? :m : :M
  
  with_fx :reverb, room: 0.95, damp: 0.9 do
    with_synth :sine do
      play_chord chord(n,:sus4), release: 0.25
      sleep 0.25
      play_chord chord(n,'5'), release: 0.75
      sleep 0.75
      play_chord chord(n,:sus4), release: 0.25
      sleep 0.25
      synth :piano, note: n+11
      sleep 0.0
      play_chord chord(n,ct), release: 0.5
      
    end
  end
end

