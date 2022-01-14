use_bpm 90

live_loop :drum4 do
  ##| stop
  
  support_note = :d1
  support_amp = 4.0
  support_rel = 0.5
  
  cymb_lpf = 130
  cymb_amp_base = 5
  kick_lpf = 130
  kick_amp = 1.2
  
  ##| bar1
  sample :drum_bass_soft , lpf: 100, amp: 0.75*cymb_amp_base
  sleep 0.125
  sleep 0.125
  sample :drum_bass_soft , lpf: 60, amp: 0.75*cymb_amp_base
  sleep 0.125
  sample :drum_bass_soft , lpf: 40, amp: 0.75*cymb_amp_base
  sleep 0.125
  sleep 0.25
  sleep 0.25
  
  ##| bar2
  sample :drum_bass_soft , lpf: 100, amp: 0.75*cymb_amp_base
  sleep 0.125
  sleep 0.125
  sample :drum_bass_soft , lpf: 100, amp: 0.75*cymb_amp_base
  sleep 0.125
  sample :drum_bass_soft , lpf: 60, amp: 0.75*cymb_amp_base
  sleep 0.125
  sample :drum_bass_soft , lpf: 40, amp: 0.75*cymb_amp_base
  sleep 0.25
  sleep 0.25
  
  ##| bar3
  sleep 1
  
  ##| bar4
  sample :drum_bass_soft , lpf: 90, amp: 0.75*cymb_amp_base
  sleep 0.25
  sleep 0.25
  sample :drum_bass_soft , lpf: 90, amp: 0.75*cymb_amp_base
  sleep 0.25
  sleep 0.25
  
  ##| synth :sine, note: support_note, amp: support_amp, release: support_rel
  
end


