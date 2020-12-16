sample :drum_cymbal_open, attack: 0.01, sustain: 0.3, release: 2, rate: 0.2

live_loop :drums do
  
  4.times do
    sleep 0.5
    sample :drum_bass_hard, rate: 1.5
  end
  
  
  4.times do
    sleep 0.5
    sample :drum_bass_hard
  end
  
  sleep 0.25
end

sleep 2
sample :drum_cymbal_open, attack: 0.01, sustain: 0.3, release: 1, rate: 0.8


sleep 6

live_loop :stuff do
  sample :guit_e_fifths, rate: rrand(1.5,1.6), stop: 0.7
  sleep 0.625 + rrand(0,0.2)
end