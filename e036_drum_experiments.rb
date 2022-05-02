samps808 = "C:/Sonic/samples/cymatics_orchid/808s & Basses/"
samps_drums = "C:/Sonic/samples/cymatics_orchid/Drum One Shots/"
samps_x = "C:/Sonic/samples/cymatics_orchid/One Shots/"
samps_v = "C:/Sonic/samples/cymatics_orchid/Vocal Loops/"

samps_pt_kicks = "Cymatics - Orchid Kick"
samps_pt_snares = "Cymatics - Orchid Snare"
samps_pt_hihats = "Cymatics - Orchid Hihat"
samps_pt_claps = "Cymatics - Orchid Clap"
samps_x = samps_pt_claps


##| sample samps_drums, samps_pt_kicks, 7, rate: 1, amp: 0.8
##| sample samps_drums, "Cymatics - Orchid Rimshot", 0, rate: 1, amp: 0.8

live_loop :x do
  
  with_fx :hpf, cutoff: 50 do
    sample samps_drums, samps_x, 2, rate: 0.7, finish: 0.05, amp: 0.8, pan: 0.3, release: 0.5
    sleep 0.14
    ##| sample samps_drums, samps_x, 3, rate: 1, amp: 0.5, pan: -0.2
    sleep 0.08
    ##| sample samps_drums, samps_x, 1, rate: 1, amp: 1, pan: -0.6
    ##| sample samps_drums, samps_x, 0, rate: 1, amp: 0.8, pan: 0.1
  end
  
  sample samps_drums, samps_pt_kicks, 7, rate: 1, amp: 1
  with_fx :lpf, cutoff: 40 do
    synth :bnoise, release: 1, amp: 0.5
  end
  sleep 0.5 + rrand_i(-1,1)*0.25
  
end
