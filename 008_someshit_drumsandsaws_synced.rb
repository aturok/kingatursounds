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
  nn = tick
  sample :drum_tom_lo_soft;
  sleep d_sleeps[nn];
end

live_loop :stuff do
  #stop
  nn = tick
  
  if nn > 72 and (nn % 18 == 4)
    cue :go_stuff2
  end
  
  if nn > 72*2 and (nn % 18 == 8)
    cue :go_fanfare
  end
  
  
  sample :glitch_bass_g, amp: 2 if nn > 2 and (nn % 18 == 0 or nn % 18 == 2)
  sleep d_sleeps[nn];
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
  n = [0,1].choose
  sample "c:/Sonic/samples/brass/", n
end



