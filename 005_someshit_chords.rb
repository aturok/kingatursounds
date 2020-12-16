define :play_melody do |notes_list, sleep_list|
  tick_reset(:play_melody_tick)
  
  notes_list.length.times do
    cntr = tick (:play_melody_tick)
    play notes_list[tick]
    sleep sleep_list.ring[cntr]
  end
end

define :play_chords_timed do |chords_list, sleep_list|
  tick_reset(:play_chords_timed)
  
  chords_list.length.times do
    cntr = tick(:play_chords_timed)
    play_chord chords_list[tick]
    sleep sleep_list.ring[cntr]
  end
end



notes_secrecy = [
  [:F4, :D4, :A3, :D2],
  [:A4],
  [:D4, :b4],
  [:f4, :a3, :d2],
  [:e4, :a5, :a3, :d2],
  [:b4],
  [:c4],
  [:a4, :g4, :a3, :d2]
]

chords1 = [
  chord(:a2, :major7),
  chord(:a3, :major7),
  chord(:a4, :major7),
  chord(:a2, :major7),
  chord(:a3, :major7),
  chord(:a4, :major7),
  chord(:c4, :major7),
  chord(:c5, :major7),
  chord(:c4, :major7),
  chord(:c5, :major7),
  chord(:c4, :major7),
]

chords1_sleeps = [
  0.1,
  0.1,
  0.1,
  0.5,
  0.5,
  0.5,
  0.5,
  0.5,
  0.5,
  0.5,
  0.5,
]

with_synth :piano do
  #play_pattern_timed (scale :a2, :minor), (ring 0.2)
  #play_chords_timed chords1, chords1_sleeps
end

chords2 = [
  #chord(:a3, :maj11),
  #chord(:a2, :major7),
  #chord(:e2, :maj9),
  chord(:e4, :maj9),
  chord(:c5, :maj9),
]


live_loop :piano do
  with_fx :reverb, room: 1 do
    with_synth :piano do
      3.times do
        #    play_chord choose(chords2), amp: 3
        sleep 0.5
      end
      sleep 0.25
    end
  end
end

live_loop :base do
  #sample :bd_haus, amp: 0.1
  sleep 0.5
end

live_loop :stuff do
  with_fx :echo do
    #sample :drum_cymbal_pedal, amp: 0.5
    sleep 1
  end
end

live_loop :stuff2 do
  with_fx :panslicer do
    with_synth :pretty_bell do
      #play choose([:a4, :d4, :g4]), amp: 0.5, release: 0.8
      #play choose([:a4, :d4, :g4]), amp: 0.5, release: 0.8
      sleep 0.3
    end
  end
end

live_loop :stuff3 do
  with_fx :reverb, room: 0.2 do
    #sample :ambi_drone , amp: 5, release: 1, pitch: 1, pan: 0.25
    sleep 0.75
    #sample :drum_bass_soft, amp: 0.05
    sleep 0.25
  end
end







#with_fx :lpf, cutoff: 60 do
#play_melody notes, [0.3]
#end