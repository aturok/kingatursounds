##| https://github.com/sonic-pi-net/sonic-pi/blob/main/etc/doc/tutorial/B.02-Shortcut-Cheatsheet.md


use_synth :tri
use_bpm 120

notes = scale(:e, :blues_major)

live_loop :notes do
  n = notes[0]
  a = 1
  s = play n, slide: 0.2, amp: a, sustain: 4.8, release: 0.1, attack: 0.1
  sleep 1
  3.times do
    control s, amp: a, note: notes.choose
    sleep 1
  end
  control s, amp: a, note: n
  sleep 1
end
