live_loop :beat do
  a = 0
  n = 20
  d = -0
  ac = 1.0
  s = [0.23,0.23]
  with_fx :lpf, cutoff: 90 do
    with_synth :sine do
      play n, amp: a, release: s[0]+s[1], attack: 0.005
      sleep s[0]
      play n+d, amp: ac*a, release: s[1], attack: 0.005
      sleep s[1]
    end
  end
end

live_loop :s1 do
  #stop
  pra = 0.0
  pnotes = scale(48, :minor_pentatonic)
  shnote1 = 20
  shnote2 = shnote1 - 6
  sha = 0.0
  n = pnotes.choose
  synth :prophet, note: n, amp: pra, attack: 0.05, release: 0.26, pan: rrand(-0.25,0.25)
  sleep 1.0
  synth :prophet, note: n, amp: pra, attack: 0.05, release: 0.21, pan: rrand(-0.25,0.25)
  synth :cnoise, note: shnote1, amp: sha, attack: 0.05, sustain: 0.05, release: 0.1, cutoff: 85
  sleep 0.08
  synth :cnoise, note: shnote2, amp: 0.6*sha, attack: 0.01, sustain: 0.01, release: 0.05, cutoff: 105
  sleep 0.08
  synth :cnoise, note: shnote1, amp: sha, attack: 0.05, sustain: 0.05, release: 0.1, cutoff: 85
  sleep 0.08
  synth :cnoise, note: shnote2, amp: 0.6*sha, attack: 0.01, sustain: 0.01, release: 0.05, cutoff: 105
  sleep 0.08
end
