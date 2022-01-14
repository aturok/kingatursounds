
use_bpm 90

define :mch do |base, ints|
  return ints.map { |i| base+i }
end

# a minor
# a b c d e f g

print chord(:a,:m)
print mch(:a, [0,3])

live_loop :bass do
  use_synth :sine
  use_synth_defaults amp: 0.5
  with_fx :panslicer, wave: 3, mix: 0.75 do
    sleep 1
    play :f2, sustain: 1.75, release: 0.5
    sleep 2
    play :a2, sustain: 1.75, release: 0.5
    sleep 1
  end
end


live_loop :notes_low do
  x = tick
  #stop
  use_synth :piano
  with_fx :reverb, room: 0.8 do
    play_chord [:a3, :e3], release: 1
    if tick % 2 == 1
      sleep 0.25
      play_chord [:c5], release: 0.5
      sleep 0.75
    else
      sleep 1
    end
    
    play_chord [:d3, :a4]
    sleep 1
    
    play_chord [:f3, :c4], release: 1
    if tick % 2 == 1
      sleep 0.25
      play_chord [:a5], release: 0.75
      sleep 0.75
    else
      sleep 1
    end
    
    play_chord [:e3, :b4]
    sleep 1
  end
end



