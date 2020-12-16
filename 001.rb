# Welcome to Sonic Pi

live_loop :guit do
  #with_fx :echo, mix: 0.5, phase: 0.4 do
  #sample :guit_em9, rate: 0.25
  #end
  sample :guit_em9, rate: 0.5
  sleep 8
end

live_loop :boom do
  #with_fx :reverb, room: 0.5 do
  with_fx :echo, mix: 0.5, phase: 0.4 do
    sample :bd_boom, amp: 3, rate: 2.5
  end
  sleep 1
end

live_loop :boom2 do
  with_fx :reverb, room: 0 do
    sample :bd_boom, amp: 15, rate: 1
  end
  sleep 2.5
end
