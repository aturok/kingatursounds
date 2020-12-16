notes = (ring :B, :B, :B, :A, :B, :C, :C4, :B2)
with_fx :reverb, room: 1 do
  
  synth :piano, note: :B
  sleep 0.5
  synth :piano, note: :B
  sleep 0.5
  synth :piano, note: :B
  sleep 0.5
  synth :piano, note: :A
  synth :piano, note: :B2
  sleep 0.5
  synth :piano, note: :B
  synth :piano, note: :B2
  sleep 0.5
  synth :piano, note: :C
  synth :piano, note: :C1
  sleep 0.5
  synth :piano, note: :C
  synth :piano, note: :C1
  sleep 0.5
  synth :piano, note: :B
  synth :piano, note: :B1
  synth :piano, note: :B2
  sleep 1
  
  5.times do
    synth :piano, note: :D6
    sleep 0.4
  end
  
  5.times do
    synth :piano, note: :C5
    sleep 0.2
  end
  
  
end
