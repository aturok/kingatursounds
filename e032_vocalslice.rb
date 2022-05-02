def melody
  play :a3, sustain: 0.25, release: 0.25
  sleep 0.25
  
  play :c4, sustain: 0.25, release: 0.25
  sleep 0.25
  
  play :c4, sustain: 0.125, release: 0.125
  sleep 0.125
  play :d4, sustain: 0.125, release: 0.125
  sleep 0.125
  
  play :e4, sustain: 0.25, release: 0.25
  sleep 0.25
end

##| with_fx :flanger, phase: 0.1 do
##|   with_synth :dsaw do
##|     with_synth_defaults detune: 0.2, cutoff: 70, attack: 0.1 do
##|       melody
##|     end
##|   end
##| end


##| with_synth :fm do
##|   with_synth_defaults cutoff: 70, divisor: 30, depth: 10, attack: 0.1 do
##|     melody
##|   end
##| end

samps808 = "C:/Sonic/samples/cymatics_orchid/808s & Basses/"
samps_drums = "C:/Sonic/samples/cymatics_orchid/Drum One Shots/"
samps_x = "C:/Sonic/samples/cymatics_orchid/One Shots/"
samps_v = "C:/Sonic/samples/cymatics_orchid/Vocal Loops/"
#sample samps_drums, 9

def hihi
  samps_drums = "C:/Sonic/samples/cymatics_orchid/Drum One Shots/"
  sample samps_drums, 9
  sleep 0.125
  sample samps_drums, 8
  sleep 0.125
  sample samps_drums, 9
  sleep 0.125
  sleep 0.125
  sample samps_drums, 7, rate: 1.5
  sleep 0.25
  sample samps_drums, 7
  sleep 0.25
end

#sample samps_v, 3, slice: 20, start: 1, finish: 2, release: 0.1


live_loop :xv do
  #stop
  x = 80
  n = rrand_i(2,8)
  sample samps_v, 3, num_slices: x, slice: n, release: 0.1, amp: 3
  sleep 0.25
end

live_loop :xb do
  #stop
  t = tick
  note = [:a3, :c3, :e3][t % 3]
  note2 = [:a3, :c3, :e3][(t+1) % 3]
  synth :dsaw, note: note, detune: 0.5, sustain: 1.0, release: 0.2, cutoff: 40, amp: 0.8
  
  sleep 0.75
  synth :dsaw, note: note2, detune: 0.45, sustain: 0.05, release: 0.2, cutoff: 65, amp: 1.1
end

live_loop :xd do
  sample samps_drums, 19
  sample samps_drums, 9
  sleep 0.25
  sample samps_drums, 9, rate: 0.9
  sleep 0.125
  sample samps_drums, 9, rate: 0.95
  sleep 0.125
  
  sample samps_drums, 19, amp: 0.8
  sleep 0.125
  sample samps_drums, 19
  sample samps_drums, 9, rate: 0.9
  sleep 0.125
  sample samps_drums, 19
  sample samps_drums, 9, rate: 1.5
  sleep 0.25
  sample samps_drums, 9, rate: 1.5
end





##| sleep 1
##| sample samps808, 4
##| sleep 0.25
##| sample samps808, 4
##| sleep 0.5
##| sample samps808, 6, pitch_stretch: 0.75
##| sample samps808, 4
##| sleep 0.25
##| sample samps808, 3
##| sleep 0.25
##| sample samps808, 3
##| sleep 0.25
