r = :c
s = :dsaw

3.times do
  t = tick % 3
  sn = r-12+t
  tn = r-24
  synth s, note: sn, amp: 0.5, attack: 0.1, release: 0.25, pan: rrand(-0.2,0.2)
  sleep 0.3
  synth s, note: sn, amp: 0.5, attack: 0.1, release: 0.25, pan: rrand(-0.2,0.2)
  sleep 0.3
  synth s, note: sn, amp: 0.75, attack: 0.1, release: 0.25, pan: rrand(-0.2,0.2)
  
  if t > 0
    #synth :tri, note: tn, amp: 0.75, attack: 0.1, release: 0.25
  end
  
  sleep 0.25
  synth s, note: sn, amp: 1, attack: 0.1, release: 0.25, pan: rrand(-0.2,0.2)
  
  if t > 0
    #synth :tri, note: tn, amp: 0.75, attack: 0.1, release: 0.25
  end
  
  sleep 0.15
  
  if t == 2
    synth :tri, note: tn, amp: 1.5, attack: 0.1, release: 1.5
    synth :bnoise, note: tn-36, amp: 0.15, attack: 0.0, release: 1.5, cutoff: 80
  end
  
  sleep 0.3
end
