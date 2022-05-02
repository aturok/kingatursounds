samps808 = "C:/Sonic/samples/cymatics_orchid/808s & Basses/"
samps_drums = "C:/Sonic/samples/cymatics_orchid/Drum One Shots/"
samps_x = "C:/Sonic/samples/cymatics_orchid/One Shots/"
samps_v = "C:/Sonic/samples/cymatics_orchid/Vocal Loops/"

samps_pt_kicks = "Cymatics - Orchid Kick"
samps_pt_snares = "Cymatics - Orchid Snare"
samps_pt_hihats = "Cymatics - Orchid Hihat"
samps_pt_claps = "Cymatics - Orchid Clap"
samps_x = samps_pt_claps


##| sample samps_drums, samps_pt_kicks, 7, rate: 1, amp: 0.8
##| sample samps_drums, "Cymatics - Orchid Rimshot", 0, rate: 1, amp: 0.8

def spl1(note, options = {})
  degrade = options[:degrade] || 0.125
  chrd = note
  if !(note.respond_to? 'each')
    chrd = [note]
  end
  
  in_thread do
    with_fx :lpf, cutoff: 130, cutoff_slide: degrade do |clpf|
      with_synth :saw do
        x = play_chord chrd,
          env_curve: 6,
          attack: 0.005,
          attack_level: 1,
          decay: options[:decay] || 0.5,
          sustain_level: 0.5,
          release: options[:release] || 0.5,
          amp: options[:amp] || 1,
          pan: options[:pan] || 0
        
        control clpf, cutoff: 100
        sleep degrade
        control clpf, cutoff: 75
        sleep degrade
        control clpf, cutoff: 55
        ##| sleep degrade
        ##| control clpf, cutoff: 100
      end
    end
  end
end




live_loop :x1 do
  l = 1.5/8
  8.times do
    spl1([:a4], decay: 0.5*l, release: 0.5*l, amp: 0.25 + rrand(-0.1,0.1), pan: rrand(-0.5,0.5))
    sleep l
  end
  
  8.times do
    spl1([:e4], decay: 0.5*l, release: 0.5*l, amp: 0.25 + rrand(-0.1,0.1), pan: rrand(-0.5,0.5))
    sleep l
  end
  
  8.times do
    spl1([:e4, :e5], decay: 0.5*l, release: 0.5*l, amp: 0.25 + rrand(-0.1,0.1), pan: rrand(-0.5,0.5))
    sleep l
  end
  
  8.times do
    spl1([:a5], decay: 0.5*l, release: 0.5*l, amp: 0.25 + rrand(-0.1,0.1), pan: rrand(-0.5,0.5))
    sleep l
  end
  
  
end


live_loop :bass do
  ##| stop
  a1 = 0.1
  a2 = 0.1
  
  ss = :dsaw
  
  x = 0.5
  
  with_synth_defaults detune: 0.25 do
    with_fx :reverb, room: 0.9, damp: 0.8 do
      with_fx :hpf, cutoff: 30 do
        with_fx :lpf, cutoff: 50 do
          synth :sine, note: :a2, attack: a1, sustain: 0, sustain: 1, release: 0.5, amp: x
          synth ss, note: :a2, attack: a1, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :d3, attack: a2, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :d3, attack: a2, sustain: 0, release: 0.25
          sleep 0.125
          synth ss, note: :a3, attack: a1, sustain: 0, release: 0.25
          sleep 0.125
          synth ss, note: :e3, attack: a1, sustain: 0, release: 0.5
          sleep 0.75
          
          synth :sine, note: :e3, attack: a1, sustain: 0, sustain: 1, release: 0.5, amp: x
          synth ss, note: :e3, attack: a1, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :g3, attack: a2, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :b2, attack: a2, sustain: 0, release: 0.25
          sleep 0.125
          ##| synth ss, note: :b3, attack: a1, sustain: 0, release: 0.25
          sleep 0.125
          synth ss, note: :g3, attack: a1, sustain: 0, release: 0.5
          sleep 0.75
          
          
          synth :sine, note: :e3, attack: a1, sustain: 0, sustain: 1, release: 0.5, amp: x
          synth ss, note: :e3, attack: a1, sustain: 0, release: 0.125
          sleep 0.125
          synth ss, note: :e3, attack: a1, sustain: 0, release: 0.125
          sleep 0.125
          synth ss, note: :g3, attack: a2, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :b2, attack: a2, sustain: 0, release: 0.125
          sleep 0.125
          synth ss, note: :b3, attack: a1, sustain: 0, release: 0.125
          sleep 0.125
          synth ss, note: :g3, attack: a1, sustain: 0, release: 0.5
          sleep 0.75
          
          synth :sine, note: :a2, attack: a1, sustain: 0, sustain: 1, release: 0.5, amp: x
          synth ss, note: :a2, attack: a1, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :c3, attack: a2, sustain: 0, release: 0.25
          sleep 0.25
          synth ss, note: :e3, attack: a2, sustain: 0, release: 0.25
          sleep 0.125
          synth ss, note: :a3, attack: a1, sustain: 0, release: 0.25
          sleep 0.125
          synth ss, note: :c3, attack: a1, sustain: 0, release: 0.5
          sleep 0.75
        end
      end
    end
  end
end

live_loop :dr do
  hh1 = 1
  hh2 = 3
  
  with_fx :lpf, cutoff: 110 do |clpf|
    control clpf, cutoff: 120
    sample samps_drums, samps_pt_kicks, 0, rate: 0.7, amp: 0.65
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh1, rate: 1, amp: 0.35
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh2, rate: 1.1, amp: 0.3
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh2, rate: 1.2, amp: 0.4
    
    control clpf, cutoff: 105
    sample samps_drums, samps_pt_kicks, 0, rate: 0.65, amp: 0.6
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh1, rate: 1, amp: 0.35
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.1, amp: 0.3
    sleep 0.75
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4
    
    sleep 0.25
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4+rrand(-0.1,0.1)
    sleep 0.125
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4+rrand(-0.1,0.1)
    sleep 0.125
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4+rrand(-0.1,0.1)
    sleep 0.125
    sample samps_drums, samps_pt_hihats, hh1, rate: 1.2, amp: 0.4+rrand(-0.1,0.1)
    sleep 0.125
    sample samps_drums, samps_pt_hihats, hh2, rate: 1.0, amp: 0.55
  end
end



##| live_loop :voice do
##|   with_fx :autotuner, note: :c4 do
##|     synth :sound_in
##|     sleep 1
##|   end
##| end




##| spl2([:e5])
##| sleep 0.25
##| spl2([:e5])
##| sleep 0.5
##| spl2([:a5])
##| sleep 0.25
##| spl2([:e5])
##| sleep 0.25
##| spl2([:d5])




##| spl1(:a5)
##| sleep 0.25
##| spl1(:e5)
##| sleep 0.25
##| spl1(:e5, degrade: 0.125)
##| sleep 0.5
##| spl1(:a5)
##| sleep 0.25
##| spl1(:e5)
##| sleep 0.25
##| spl1(:d5)

##| sleep 1
