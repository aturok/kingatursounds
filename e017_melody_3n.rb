##| 4 / 4
use_bpm 60

notes = scale(:d, :dorian)
ns = [notes[0], notes[2], notes[4]]
(n1,n2,n3) = ns

live_loop :bassline do
  stop
  t=tick
  with_synth :sine do
    play ns[[0,2,2][t % 3]]-12, sustain: 1.8,  amp: 0.5
    sleep 2
  end
  if t > 6
    stop
  end
end

t1 = 1
t2 = 1/2.0
t4 = 1/4.0
t8 = 1/8.0
t16 = 1/16.0

define :mplay do |size, notes|
  s = 1.0/size
  notes.map { |n| play n, sustain: 0, release: s }
  sleep 1.0/size
end


live_loop :mel do
  ##| stop
  with_fx :reverb, room: 0.9 do
    with_synth :tri do
      ##| b1
      mplay(4, [n1])
      mplay(4, [n2])
      mplay(4, [n3])
      mplay(4, [n3])
      ##| play n1, sustain: t4
      ##| sleep t4
      ##| play n2, sustain: t4
      ##| sleep t4
      ##| play n3, sustain: t4
      ##| sleep t4
      ##| play n3, sustain: t4
      ##| sleep t4
      
      ##| b2
      play n2, sustain: t2
      sleep t2
      play n1, sustain: t2
      play n3, sustain: t2
      sleep t2
      ##| b3
      play n1, sustain: t8
      sleep t8
      play n2, sustain: t8
      sleep t8
      play n3, sustain: t4
      sleep t4
      
      sleep t4
      play n3, sustain: t8
      sleep t8
      play n3, sustain: t8
      sleep t8
      play n3, sustain: t4
      sleep t4
      
      ##| b4
      play n3, sustain: t8
      sleep t8
      play n2, sustain: t8
      sleep t8
      play n1, sustain: t4
      sleep t4
      
      sleep t4
      play n1, sustain: t8
      sleep t8
      play n1, sustain: t8
      sleep t8
      play n1, sustain: t4
      sleep t4
      
      ##| b5
      play n1, sustain: t4
      sleep t4
      play n2, sustain: t4
      sleep t4
      
      sleep t4
      
      play n2, sustain: t4
      sleep t4
      
      ##| b6
      play n3, sustain: t4
      sleep t4
      
      sleep t8
      play n3, sustain: t8
      sleep t8
      
      play n1, sustain: t2
      sleep t2
      
      ##| b7
      sleep t1
      
      ##| b8
      play n1, sustain: t2
      sleep t2
      
      sleep t4
      play n2
      sleep t4
      
      
      ##| b9
      play n2, sustain: t2
      sleep t2
      
      sleep t4
      play n3
      sleep t4
      
      ##| b10
      play n1, sustain: t4
      play n3, sustain: t4
      sleep t4
      
      play n3, sustain: t4
      sleep t4
      play n3, sustain: t4
      sleep t4
      
      ##| b11
      play n2, sustain: t4
      sleep t4
      play n3, sustain: t4
      sleep t4
      play n2, sustain: t4
      sleep t4
      play n1, sustain: t4
      sleep t4
      
      
      ##| b12 - 10
      play n1, sustain: t4
      play n3, sustain: t4
      sleep t4
      
      play n3, sustain: t4
      sleep t4
      play n3, sustain: t4
      sleep t4
      
      ##| b13 - 10'
      play n1, sustain: t4
      play n3, sustain: t4
      sleep t4
      
      play n2, sustain: t4
      sleep t4
      play n2, sustain: t4
      sleep t4
      
      ##| b14
      play n3, sustain: t4
      sleep t4
      play n2, sustain: t2
      sleep t2
      sleep t4
      
      ##| b15
      play n3, sustain: t4
      sleep t4
      play n2, sustain: t2
      sleep t2
      sleep t4
      
      ##| b16
      play n3, sustain: t4
      sleep t4
      play n1, sustain: t2
      sleep t2
      sleep t4
      
      ##| b17
      play n1, sustain: t4
      sleep t4
      play n1, sustain: t4
      sleep t4
      sleep t4
      play n2, sustain: t4
      sleep t4
      
      
      ##| b19
      sleep t4
      play n1, sustain: t2+t4
      sleep t2+t4
      
      stop
    end
  end
end
