##| 4 / 4
use_bpm 60

notes = scale(:f, :minor)
ns = [notes[0], notes[2], notes[4]]
(n1,n2,n3) = ns

live_loop :bassline do
  ##| stop
  t=tick
  with_synth :dark_ambience do
    play ns[[0,2,1,2][t % 4]]-12, sustain: 0.8,  amp: 0.25
    sleep 1
  end
  if t > 18
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
  with_fx :reverb, room: 0.8 do
    with_synth :sine do
      ##| b1
      mplay(4, [n1])
      mplay(4, [n2])
      mplay(4, [n3])
      mplay(4, [n3])
      
      ##| b2
      mplay(2, [n2])
      mplay(2, [n1,n3])
      
      ##| b3
      mplay(8, [n1])
      mplay(8, [n2])
      mplay(4, [n3])
      mplay(4, [])
      mplay(8, [n3])
      mplay(8, [n3])
      
      ##| b4
      
      mplay(4, [n3])
      mplay(8, [n3])
      mplay(8, [n2])
      mplay(4, [n1])
      mplay(4, [])
      
      
      ##| b5
      mplay(8, [n1])
      mplay(8, [n1])
      mplay(4, [n1])
      mplay(4, [])
      mplay(4, [n1])
      
      ##| b5
      mplay(4, [n1])
      mplay(4, [n2])
      mplay(4, [])
      mplay(4, [n2])
      
      ##| b6
      mplay(4, [n3])
      mplay(8, [])
      mplay(8, [n3])
      mplay(2, [n1])
      
      
      ##| b7
      mplay(2, [])
      mplay(2, [n1])
      
      
      ##| b8
      mplay(2, [n1])
      mplay(4, [])
      mplay(4, [n2])
      
      ##| b9
      mplay(2, [n2])
      mplay(4, [])
      mplay(4, [n3])
      
      
      ##| b10
      mplay(2, [n1,n3])
      mplay(4, [n3])
      mplay(4, [n3])
      
      
      ##| b11
      mplay(4, [n2])
      mplay(4, [n3])
      mplay(4, [n2])
      mplay(4, [n1])
      
      
      
      ##| b12 - 10
      mplay(2, [n1,n3])
      mplay(4, [n3])
      mplay(4, [n3])
      
      ##| b13 - 10'
      mplay(2, [n1,n3])
      mplay(4, [n2])
      mplay(4, [n2])
      
      ##| b14
      mplay(4, [n3])
      mplay(2, [n2])
      mplay(4, [])
      
      ##| b15
      mplay(4, [n3])
      mplay(2, [n2])
      mplay(4, [])
      
      ##| b16
      mplay(4, [n3])
      mplay(2, [n1])
      mplay(4, [])
      
      ##| b17
      mplay(4, [n1])
      mplay(4, [n1])
      mplay(4, [])
      mplay(4, [n2])
      
      
      ##| b19
      mplay(4, [])
      mplay(4.0/3, [n1])
      stop
    end
  end
end
