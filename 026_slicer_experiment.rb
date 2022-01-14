# Welcome to Sonic Pi



live_loop :what do
  with_fx :slicer, wave: 1, pulse_width: 0.03, phase: 0.5 do
    with_fx :bpf, centre: :e4, res: 0.01 do
      synth :noise, attack: 0.1, release: 0.1,  sustain: 0.9, env_curve: 1
      sleep 1
    end
  end
end

live_loop :x do
  with_fx :tremolo, phase: 0.1, wave: 3, depth: 1 do
    with_fx :bpf, centre: :e2, res: 0.4 do
      synth :saw, attack: 0.1, release: 0.1, sustain: 0.91, env_curve: 1
      sleep 1
    end
  end
  
end
