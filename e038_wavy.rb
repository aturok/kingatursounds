
live_loop :l1 do
  with_fx :echo do
    x = synth :dsaw, detune: 0.05, note: :a3, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    sleep 0.125
    control x, cutoff: 60
    sleep 0.125
    x2 = synth :dsaw, detune: 0.05, note: :c4, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    control x, cutoff: 70
    sleep 0.125
    control x2, cutoff: 60
    sleep 0.125
    control x2, cutoff: 70
    sleep 0.5
    
    x = synth :dsaw, detune: 0.05, note: :e3, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    sleep 0.125
    control x, cutoff: 60
    sleep 0.125
    x2 = synth :dsaw, detune: 0.05, note: :g4, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    control x, cutoff: 70
    sleep 0.125
    control x2, cutoff: 60
    sleep 0.125
    control x2, cutoff: 70
    sleep 1
    
    
    x = synth :dsaw, detune: 0.05, note: :f4, attack: 0.0, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    sleep 0.125
    control x, cutoff: 60
    sleep 0.125
    x2 = synth :dsaw, detune: 0.05, note: :a4, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    control x, cutoff: 70
    sleep 0.125
    control x2, cutoff: 60
    sleep 0.125
    control x2, cutoff: 70
    sleep 0.5
    
    x = synth :dsaw, detune: 0.05, note: :g4, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    sleep 0.125
    control x, cutoff: 60
    sleep 0.125
    x2 = synth :dsaw, detune: 0.05, note: :b3, attack: 0.1, decay: 1, release: 0.5, cutoff: 40, cutoff_slide: 0.125
    control x, cutoff: 70
    sleep 0.125
    control x2, cutoff: 60
    sleep 0.125
    control x2, cutoff: 70
    
    sleep 1
    
  end
  
  
end
