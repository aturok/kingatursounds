n = 54

#play n


sleeps = stretch([1.0,1.0,0.4,0.4,0.4], 2)
print sleeps


live_loop :coins do
  sync :do_coins
  with_fx :hpf, cutoff: 100 do
    sample :drum_cymbal_pedal
    sleep 0.05
    sample :drum_cymbal_pedal
    sleep 0.2
    sample :drum_cymbal_pedal
    sleep 0.2
    sample :drum_cymbal_pedal
    sleep 0.2
    sample :drum_cymbal_pedal
    sleep 0.4
    sample :drum_cymbal_pedal, rate: 0.6
    sleep 0.4
    #sample :drum_cymbal_pedal, rate: 0.5
    sleep 0.4
  end
end



live_loop :hit do
  sync :do_hit
  
  sleeps = ring(0.3,0.2,0.3,0.2,0.5)
  
  10.times do
    nn = tick
    
    r = 0.7
    a = 1.2
    
    if nn % 10 < 4
      r = 0.8
    end
    
    if nn % 10 > 7
      a = 0
    end
    
    
    sample :drum_bass_soft, amp: a, pan: rrand(-1,1), rate: r
    sleep sleeps[nn]
  end
end

with_fx :reverb, room: 0.9 do
  live_loop :ambi do
    sync :do_ambi
    nn = tick
    a = 1
    base = 50
    diff = 12
    notes1 = scale(base, :major_pentatonic)
    notes2 = scale(base+diff, :major_pentatonic)
    notes = notes1
    
    sust = 3
    rel = 2
    ss = 0.15
    
    if nn % 5 > 2
      notes = notes2
    end
    
    snt = :sine
    
    synth snt, note: notes.choose, amp: a, sustain: sust, release: 2
    sleep ss
    synth snt, note: notes.choose, amp: 0.5*a, sustain: sust, release: 2
    sleep ss
    synth snt, note: notes.choose, amp: 0.5*a, sustain: sust, release: 2
    sleep ss
    synth snt, note: notes.choose, amp: 0.5*a, sustain: sust, release: 2
    sleep sust+rel-3*ss
  end
end

define :play_stuff3 do |n, am|
  play n, pitch: 4, amp: am, attack_level: 0.05, sustain_level: 0.05, sustain: 0.0, release: 0.01;
  play n, pitch: 2, amp: am, attack_level: 0.05, sustain_level: 0.05, sustain: 0.0, release: 0.01;
  play n, pitch: 16, amp: am, attack_level: 3, sustain_level: 1.5, sustain: 0.01, release: 0.01;
  
  play n, pitch: 8, amp: 0.25*am, attack: 0.1, sustain_level: 1, sustain: 0.5, release: 1.5;
  play n, pitch: 16, amp: 0.25*am, attack: 0.1, sustain_level: 1, release: 0.75;
end


live_loop :bells do
  nn = tick
  sync :do_bells
  a = 1.2
  base = 80
  diff = 8
  notes1 = scale(base, :major_pentatonic)
  notes2 = scale(base-8, :major_pentatonic)
  
  play_stuff3(notes1.choose, a)
  sleep 0.2
  play_stuff3(notes1.choose, 0.5*a)
  sleep 1
end


live_loop :control do
  nn = tick
  
  if nn % 5 == 0 and nn < 240
    cue :do_ambi
  end
  
  if nn > 20 && nn % 10 == 0 and nn < 220
    cue :do_hit
  end
  
  
  if nn > 40 && nn % 40 > 20 and nn % 2 == 0 and nn < 230
    cue :do_bells
  end
  
  if nn > 60 and nn % 3 == 0 and (nn < 120 or nn > 150 and nn < 190)
    cue :do_coins
  end
  
  
  sleep 1
  
end




