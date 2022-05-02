live_loop :drum1 do
  stop
  sample :drum_heavy_kick, rate: 0.8
  synth :sine, note: :c1, attack: 0.02, release: 0.25
  sleep 0.25
  sample :elec_snare, amp: 0.8
  sleep 0.25
  sample :drum_heavy_kick, rate: 0.8
  synth :sine, note: :c1, attack: 0.02, release: 0.25
  sleep 0.25
  sample :elec_snare, amp: 0.8
  sleep 0.1
  sample :elec_snare, amp: 0.2
  with_fx :lpf, cutoff: 75 do
    with_fx :echo do
      synth :noise, attack: 0.02, release: 0.15
    end
  end
  sample :drum_bass_soft, rate: 2
  sleep 0.05
  sample :drum_bass_soft, rate: 2
  sleep 0.05
  sample :drum_bass_soft, rate: 2
  sleep 0.05
  
  
  
  
  sample :drum_heavy_kick, rate: 0.8
  synth :sine, note: :c1, attack: 0.02, release: 0.25
  sleep 0.25
  sample :drum_cowbell, amp: 0.8
  sleep 0.2
  sample :drum_cowbell, amp: 0.8, rate: 1.2
  sleep 0.05
  sample :drum_heavy_kick, rate: 0.8
  synth :sine, note: :c1, attack: 0.02, release: 0.25
  sleep 0.25
  sample :elec_snare, amp: 0.8
  sleep 0.1
  sample :elec_snare, amp: 0.2
  with_fx :lpf, cutoff: 75 do
    with_fx :echo do
      synth :noise, attack: 0.02, release: 0.15
    end
  end
  sleep 0.15
end

live_loop :bass1 do
  stop
  x = tick
  steps = ring(1,2,5)
  with_fx :lpf, cutoff: 120 do
    with_synth :sine do
      play_chord chord_degree(steps[x], :A3, :minor)
    end
  end
  sleep 0.5
end

live_loop :drum2 do
  stop
  sample :drum_bass_soft
  sleep 0.25
  
  sample :drum_bass_hard
  sleep 0.25
  
  sample :drum_bass_soft
  sleep 0.25
  
  sample :drum_bass_hard
  sleep 0.25
  
  
  sample :drum_bass_soft
  sleep 0.25
  
  sample :drum_bass_hard
  sample :drum_snare_soft
  sleep 0.25
  
  sample :drum_snare_hard
  sample :drum_bass_soft
  sleep 0.25
  
  sample :drum_snare_hard
  sample :drum_bass_hard
  sleep 0.25
  
end


notes = ring(:c5, :g5, :a5, :c6)
live_loop :elec do
  x = tick
  n = notes[x]
  
  with_fx :echo, phase: 0.1  do
    with_fx :lpf do
      #synth :sine, note: n, decay_level: 0.25, release: 0.25, attack: 0.01, amp_slide: 2, amp_slide_shape: 3
    end
  end
  
  with_fx :tremolo, wave: 3, phase: 0.05, depth: 0.25 do
    with_fx :echo, phase: 0.06, decay: 2 do
      
      with_fx :hpf, cutoff: 80, res: 0 do
        synth :saw, note: n, attack: 0.01, release: 0.2
        synth :noise, note: n, attack: 0.01, release: 0.4
      end
    end
  end
  
  
  sleep 1
end

