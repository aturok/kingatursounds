define :play_stuff do |n|
  l = 2.15;
  play n, release: 1*l;
  play n, pitch: 2, release: 1*l;
  #play n, pitch: 3, release: 1*l;
  play n, pitch: 4, amp: 0.5, sustain: 0.9*l, release: 0.1*l;
  play n, pitch: 5, amp: 1.5, sustain: 0.9*l, release: 0.1*l;
  #play n, pitch: 6, amp: 1.0, release: 1*l;
  #play n, pitch: 7, amp: 1.0, release: 1.15;
  play n, pitch: 8, amp: 1.0, attack: 0.0, release: 0.8*l;
  #play n, pitch: 16, amp: 1.1, attack: 0.0, release: 0.2*l;
end

notes = scale(60, :major_pentatonic)

0.times do
  play_stuff notes.choose
  sleep 1
end

d_sleeps = stretch([0.4,0.2,0.4,0.2,0.1,0.1], 3);

live_loop :drums do
  #stop
  sync :go_drums
  36.times do
    nn = tick
    sample :drum_tom_mid_hard, amp: 1;
    sleep 0.5*d_sleeps[nn];
  end
  
end

live_loop :stuff do
  #stop
  sync :go_stuff
  nn = tick
  
  3.times do
    sample :glitch_bass_g, amp: 3, rate: 2 if nn > 2 and (nn % 1 == 0 or nn % 18 == 2)
    sleep d_sleeps[nn];
  end
  2.times do
    sleep 2*d_sleeps[nn];
    sample :glitch_bass_g, amp: 3, rate: 1.5 if nn > 2 and (nn % 1 == 0 or nn % 18 == 2)
  end
  
end

live_loop :stuff2 do
  sync :go_stuff2
  notes = scale(62, :minor)
  sleeps = [0.1,0.1,0.3,0.5,0.5]
  [0,1,2,3,4].each do |note|
    synth :saw, note: notes.choose, release: 3;
    sleep sleeps[note]
  end
end

live_loop :fanfare do
  sync :go_fanfare
  n = [1].choose
  sample "c:/Sonic/samples/brass/", n, rate: 0.7
end

with_fx :reverb, room: 0.8 do
  live_loop :stuff3 do
    sync :go_stuff3
    nn = tick
    amp = 0.7
    if nn > 2
      amp = 0.5
    end
    if nn > 4
      amp = 0.3
    end
    
    notes = scale(30, :minor)
    p = [-0.7, -0.5, -0.2, 0, 0.2, 0.5, 0.7].choose
    synth :saw, note: notes.choose, release: 10, pan: p;
    sleep 2
    synth :saw, note: notes.choose, amp: 0.7, release: 10, pan: p;
    sleep 8
  end
end

live_loop :control do
  nn = tick
  
  if nn % 2 == 0
    #cue :go_stuff3
  end
  
  if nn > 10
    #cue :go_drums
  end
  
  
  sleep 2
  
  if nn > 4 and nn < 10
    cue :go_stuff2
  end
  
  sleep 2
  
  if nn > 10
    #cue :go_stuff
  end
  
  sleep 1
  
  if nn == 10
    cue :go_fanfare
  end
  
  if nn > 12
    #cue :go_fanfare
  end
  
end


