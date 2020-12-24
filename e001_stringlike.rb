define :play_s do |n|
  a = 1
  synth :chiplead, note: n, release: 0.05, sustain: 0.0, cutoff: 130
  synth :chiplead, note: n+12, release: 0.05, sustain: 0.0, cutoff: 130, amp: 0.5*a
  synth :chiplead, note: n-24, attack: 0.02, release: 0.25, sustain: 0.05, decay_level: 0.2, cutoff: 50, amp: 0.5*a
  synth :chiplead, note: n-12, attack: 0.02, release: 0.25, sustain: 0.05, decay_level: 0.2, cutoff: 50, amp: 0.5*a
end

cc = chord(60, '6')
ss = scale(60, :major_pentatonic)

tick_reset
ss.length.times do
  n = tick
  cc = chord(ss[n-1], '6')
  play_s(cc[0])
  play_s(cc[1])
  play_s(cc[2])
  sleep 0.2
end

ss = scale(64, :major_pentatonic)

tick_reset
ss.length.times do
  n = tick
  cc = chord(ss[n-1], '6')
  play_s(cc[0])
  play_s(cc[1])
  play_s(cc[2])
  sleep 0.2
end

ss = scale(62, :major_pentatonic)

tick_reset
ss.length.times do
  n = tick
  cc = chord(ss[n-1], '6')
  play_s(cc[0])
  play_s(cc[1])
  play_s(cc[2])
  sleep 0.2
end


play_s(60)

