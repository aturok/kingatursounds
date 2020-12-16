define :play_stuff do |n|
  play n, release: 0.1;
  #play n, pitch: 2, release: 0.15;
  play n, pitch: 4, amp: 0.8, release: 0.2;
  play n, pitch: 8, amp: 1.2, attack: 0.1, release: 0.45;
  play n, pitch: 16, amp: 0.1, attack: 0.1, release: 0.3;
end

define :play_stuff2 do |n|
  play n, sustain_level: 0.05, sustain: 0.05, release: 0.01;
  #play n, pitch: 2, release: 0.15;
  play n, pitch: 4, amp: 0.8, release: 0.2;
  play n, pitch: 8, amp: 1.2, attack: 0.1, release: 0.8;
  #play n, pitch: 16, amp: 0.1, attack: 0.1, release: 0.3;
  
  play n, pitch: 4, amp: 0.5, sustain_level: 1, attack: 0.1, release: 0.02;
end

define :play_stuff3 do |n|
  play n, pitch: 4, attack_level: 0.05, sustain_level: 0.05, sustain: 0.0, release: 0.01;
  play n, pitch: 2, attack_level: 0.05, sustain_level: 0.05, sustain: 0.0, release: 0.01;
  play n, pitch: 16, attack_level: 3, sustain_level: 1.5, sustain: 0.01, release: 0.01;
  
  play n, pitch: 8, amp: 0.25, attack: 0.1, sustain_level: 1, sustain: 0.5, release: 1.5;
  play n, pitch: 16, amp: 0.25, attack: 0.1, sustain_level: 1, release: 0.75;
end


notes = scale(:e5, :minor)

#with_fx :reverb, room: 0.9 do
#10.times do
#play_stuff3(choose(notes))
#play_stuff(:e5)
#sleep 2
#end
#end

live_loop :boom do
  #sample :drum_snare_soft, amp: 0.4
  sleep 1
end

define :play_drama do
  9.times do
    sample :drum_snare_hard, amp: 0.6
    sleep 0.15
  end
  3.times do
    sample :drum_snare_hard, amp: 1.8
    sleep 0.4
  end
end


live_loop :boos do
  sleep 1.5
  #play_drama()
end



live_loop :bells do
  play_stuff3(choose(scale(:e5, :minor)))
  sleep 1.2
end

live_loop :amb do
  #sample :ambi_sauna, amp: 0.1
  sleep 0.8
end

live_loop :gui2 do
  sample :guit_e_fifths, pitch: rrand(5,20)*0.05, amp: 8
  sleep 2
end








with_bpm 60 do
  #play_stuff3(:e5)
  
  #synth :dull_bell, note: :e5
end


