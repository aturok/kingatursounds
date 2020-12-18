#synth :dtri, note: 60, attack: 0.1, sustain: 0.1, decay: 0, release: 0
#synth :growl, note: 60, attack: 0.0, sustain: 0.05, decay: 0, release: 0

do_strings = 0
do_beat = 0

define :play_beat do |n, a|
  aa = a
  synth :sine, note: n, amp: aa*0.5, attack: 0.0, sustain: 0.0, decay: 0.0, decay_level: 0.0,  release: 0.001
  synth :sine, note: n, amp: aa, attack: 0.0, sustain: 0.0, decay: 0.0,  release: 0.1
end

define :play_click do |n,a|
  synth :gnoise, note: n, amp: a, env_curve: 1, release: 0.020, res: 0.95, cutoff: 100
end




live_loop :beats do
  #stop
  #play_beat(range(48,52).choose, 0.1+rrand(0.0, 0.5))
  
  a = 0.3 + 0.1*do_beat
  
  4.times do
    if do_beat > 0
      sample :drum_heavy_kick, start: 0.00, finish: 0.08,lpf: 65, amp: a+rrand(0,1)
    end
    sleep 0.5
  end
end

live_loop :clicks do
  #stop
  n = range(2,6).choose
  s = 0.25+0.1*range(-1,3).choose
  rem = 4-0.5-s*n
  sleep 0.5
  n.times do
    play_click(120,0.05)
    sleep s
  end
  
  sleep rem
end


live_loop :wind do
  #stop
  a = 0.2
  att = (rrand(0,1)*0.5+0.5)
  rel = rrand(0,1)*3+3.5
  sust = rrand(0,1)*1+2
  wnotes = [76,78,80,82,84]
  n = wnotes.choose
  p = rrand(-0.5,0.5)
  synth :cnoise, note: n, attack: att, sustain: sust, release: rel, cutoff: 80, res: 0.7, pan: p, amp: a
  synth :cnoise, note: n, attack: att+sust, sustain: 0, release: rel, cutoff: 85, res: 0.8, amp: 0.5*a, pan: p
  sleep 20
end


live_loop :string do
  #stop
  #with_fx :bpf, centre: 90, res: 0.7 do
  notes = scale(58, :minor)
  notes2 = scale(58-6, :major_pentatonic)
  cc = 0.8
  r = 2.2
  a = 0.0
  pd = 60
  
  if do_strings == 1
    a = 0.5+rrand(0.0,0.3)
  end
  ps = [-24,-12,-8,-4,0]
  rs = [1, 1.1, 1.2]
  sample :guit_harmonics, pitch: ps.choose, amp: a, finish: 1, start: 0.0, rate: rs.choose
  sleep 2.8
  
end


live_loop :control do
  nn = tick
  
  if nn >= 30
    do_strings = 1
  end
  if nn % 20 == 1 and nn > 19 and nn < 60
    do_beat = do_beat + 1
  end
  if nn == 120
    do_beat = 0
  end
  
  sleep 1
end




