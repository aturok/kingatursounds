define :play_piano do
  #play_chord chord(:e5, :minor), amp: 2
  #play :e5
  with_fx :reverb, room: 0.9 do
    play :g5, release: 0.5
    sleep 0.8
    play :g5, release: 0.5
    sleep 0.8
    play :e4, release: 1.0
    #play :a4, release: 1.0
    sleep 1.6
  end
end


live_loop :pi do
  with_synth :piano do
    play_piano
    sleep 1.4
    play_piano
    sleep 2
  end
end

live_loop :dr do
  sample :bd_fat , decay: 2, amp: 1
  sleep 0.8
end

live_loop :sss do
  
end

