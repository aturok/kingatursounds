use_bpm 60
live_loop :drum do
  stop
  sample :drum_heavy_kick, amp: 1.5
  sleep 0.5
  sample :drum_heavy_kick
  sleep 0.125
  sample :drum_heavy_kick
  sample :drum_cymbal_closed, hpf: 90, amp: 0.5
  sleep 0.125
  sample :drum_heavy_kick
  sample :drum_cymbal_closed, hpf: 90, amp: 0.5
  sleep 0.125
  sample :drum_heavy_kick
  sample :drum_cymbal_closed, hpf: 90, amp: 0.5
  sleep 0.125
  
  sample :drum_heavy_kick, amp: 1.5
  sample :drum_cymbal_open, hpf: 90, amp: 1, lpf: 90
  sleep 0.5
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
end

live_loop :drum2 do
  stop
  sample :drum_cymbal_closed, lpf: 90, amp: 1.0
  sleep 0.25
  sample :drum_cymbal_closed, lpf: 90, amp: 0.75
  sleep 0.25
  if tick % 2 == 0
    sample :drum_cymbal_closed, lpf: 90, amp: 0.5
  else
    sample :drum_cymbal_soft, hpf: 90, amp: 1, lpf: 120, beat_stretch: 0.5
    sample :drum_cymbal_soft, hpf: 50, amp: 0.75, start: 0.5
  end
  
  sleep 0.25
  sleep 0.25
  
  sample :drum_heavy_kick, amp: 1.2, lpf: 90
  sleep 0.5
  sample :drum_heavy_kick, amp: 1, lpf: 90
  sleep 0.25
  sample :drum_heavy_kick, amp: 1, lpf: 90
  sleep 0.25
end

live_loop :drum3 do
  stop
  
  ##| bar1
  sample :drum_cymbal_closed, lpf: 90, amp: 1.0
  sleep 0.25
  sample :drum_cymbal_closed, lpf: 90, amp: 0.75
  sleep 0.25
  sample :drum_cymbal_closed, lpf: 90, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, lpf: 90, amp: 0.25
  sleep 0.25
  
  kick_lpf = 80
  kick_amp = 0.7
  ##| bar2
  sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf
  sleep 0.5
  sample :drum_heavy_kick, amp: 1*kick_amp, lpf: kick_lpf, rate: 0.8
  sleep 0.5
  
  ##| bar3
  sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf, rate: 0.8
  sample :drum_snare_soft, amp: 1*kick_amp, lpf: 70
  sleep 0.5
  sample :drum_heavy_kick, amp: 1, lpf: kick_lpf, rate: 0.8
  sample :drum_snare_soft, amp: 1*kick_amp, lpf: 70
  sleep 0.25
  sample :drum_snare_soft, amp: 1*kick_amp, lpf: 90
  sleep 0.25
  
  
  ##| bar4
  sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf, rate: 1.05
  sleep 0.5
  sample :drum_heavy_kick, amp: 1*kick_amp, lpf: kick_lpf, rate: 0.8
  sleep 0.5
end


live_loop :drum4 do
  ##| stop
  
  support_note = :d1
  support_amp = 0.5
  support_rel = 0.5
  
  cymb_lpf = 55
  cymb_amp_base = 5
  kick_lpf = 60
  kick_amp = 0.5
  
  ##| bar1
  ##| sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 1.0*cymb_amp_base
  synth :sine, note: support_note, amp: support_amp, release: support_rel
  sleep 0.25
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.75*cymb_amp_base
  sleep 0.25
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.5*cymb_amp_base
  sleep 0.25
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.25*cymb_amp_base
  sleep 0.25
  
  ##| bar2
  sample :drum_heavy_kick, amp: 0.5*kick_amp, lpf: kick_lpf
  ##| sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.25*cymb_amp_base
  synth :sine, note: support_note, amp: support_amp, release: support_rel
  sleep 0.5
  ##| sample :drum_heavy_kick, amp: 0.5*kick_amp, lpf: kick_lpf, rate: 0.8
  ##| sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.25*cymb_amp_base
  sleep 0.5
  
  ##| bar3
  sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf, rate: 0.8
  synth :sine, note: support_note, amp: support_amp, release: support_rel
  ##| sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.25*cymb_amp_base
  sleep 0.5
  ##| sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.5*cymb_amp_base
  sleep 0.25
  ##| sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.5*cymb_amp_base
  sleep 0.25
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.75*cymb_amp_base
  sleep 0.25
  
  
  ##| bar4
  sample :drum_heavy_kick, amp: 1.2*kick_amp, lpf: kick_lpf, rate: 1.05
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.75*cymb_amp_base
  synth :sine, note: support_note, amp: support_amp, release: support_rel
  sleep 0.25
  sample :drum_cymbal_closed, lpf: cymb_lpf, amp: 0.75*cymb_amp_base
  sleep 0.25
  ##| sample :drum_heavy_kick, amp: 0.5*kick_amp, lpf: kick_lpf, rate: 0.8
  sleep 0.5
end

live_loop :bass do
  ##| stop
  n = tick % 8
  cd = [1, 2, 6, 4, 1, 2, 2, 6]
  c = chord_degree(cd[n], :d3, :major, 3)
  
  with_fx :lpf, cutoff: 60 do
    with_synth :piano do
      play c[0], amp: 0.75
      play c[2], amp: 0.75
      ##| play c[3], release: 1, amp: 0.5
      ##| play c[1], release: 1
      
    end
  end
  sleep 1
end

live_loop :waves do
  if one_in(2)
    synth :bnoise, note: :c3, release: 1, amp: 0.2
    sleep 0.25
    synth :bnoise, note: :c3, release: 1, amp: 0.22
  else
    sleep 0.25
  end
  sleep 0.5
  if one_in(2)
    synth :bnoise, note: :c3, release: 1, amp: 0.1
    sleep 0.25
    synth :bnoise, note: :c3, release: 1, amp: 0.1
    sleep 0.25
  else
    synth :bnoise, note: :c3, release: 3, amp: 0.05
    sleep 0.5
  end
  synth :bnoise, note: :c3, release: 3, amp: 0.05
  sleep 2.75
end



