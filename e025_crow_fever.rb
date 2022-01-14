
live_loop :yline do
  #stop
  sync :drum_sync
  
  #with_fx :band_eq, freq: 40, res: 0.25, db: 1 do
  with_fx :reverb do
    2.times do
      #sample :misc_crow, rate: 0.0*rand_i(10)+1
      synth :bnoise, attack: 0.0, release: 0.25, amp: 0.5
      sleep 0.25
    end
  end
  #end
  
end

live_loop :dr1 do
  #stop
  cue :drum_sync
  with_fx :reverb, amp: 0.15 do
    sample :elec_lo_snare, rate: 2.5, cutoff: 75
    sleep 0.25
    sample :elec_mid_snare
    sleep 0.125
    sample :elec_lo_snare, rate: 2.5, cutoff: 65
    sleep 0.125
    sample :elec_mid_snare, rate: 2
    sleep 0.25
    sample :elec_mid_snare, rate: 2.75
    sleep 0.25
  end
end

live_loop :bass1 do
  #stop
  sync :drum_sync
  #n = pick([:c2, :e2, :g2, :a2, :e2, :c2, :a2])[0]
  n = pick([:c2, :g2])[0]
  
  with_synth :tri do
    play n, release: 0.2, attack: 0.1
    sleep 0.25
    #play n-12, release: 0.1, attack: 0.1
    sleep 0.25
    play n+7, release: 0.1, attack: 0.1
    sleep 0.25
    #play n-12, release: 0.1, attack: 0.1
  end
  
  
end
