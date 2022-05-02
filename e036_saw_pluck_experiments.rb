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
          release: options[:release] || 0.5
        
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


def spl1(note, options = {})
  degrade = options[:degrade] || 0.125
  chrd = note
  if !(note.respond_to? 'each')
    chrd = [note]
  end
  
  ##| in_thread do
  with_fx :lpf, cutoff: 60, cutoff_slide: degrade do |clpf|
    with_synth :saw do
      x = play_chord chrd,
        env_curve: 6,
        attack: 0.005,
        attack_level: 1,
        decay: options[:decay] || 0.5,
        sustain_level: 0.5,
        release: options[:release] || 0.5
      
      control clpf, cutoff: 60
      at [degrade,degrade+degrade], [85,55] do |level|
        control clpf, cutoff: level
      end
      
      
      ##| control clpf, cutoff: 100
      ##| sleep degrade
      ##| control clpf, cutoff: 75
      ##| sleep degrade
      ##| control clpf, cutoff: 55
      ##| sleep degrade
      ##| control clpf, cutoff: 100
    end
  end
  ##| end
end


def spl2(chrd, options = {})
  degrade = options[:degrade] || 0.125
  
  in_thread do
    with_synth :saw do
      clpf = play_chord chrd,
        env_curve: 6,
        attack: 0.005,
        attack_level: 1,
        decay: options[:decay] || 0.5,
        cutoff_slide: degrade,
        sustain_level: 0.5,
        release: options[:release] || 0.5
      
      control clpf, cutoff: 100
      sleep degrade
      control clpf, cutoff: 75
      sleep degrade
      control clpf, cutoff: 50
    end
  end
end


live_loop :x1 do
  stop
  spl1(choose([[:a4,:e4], [:e4,:a4,:a6], [:a4,:c4], [:rest]]), release: 2)
  sleep 0.25
end


live_loop :bass do
  ##| stop
  with_fx :lpf, cutoff: 55 do
    synth :saw, note: :a2, attack: 0.1, sustain: 1.5, release: 0.5
    sleep 2
    synth :saw, note: :e3, attack: 0.0, sustain: 0, release: 0.25
    sleep 0.25
    synth :saw, note: :e3, attack: 0.0, sustain: 0, release: 0.25
    sleep 0.25
    synth :saw, note: :c3, attack: 0.0, sustain: 0, release: 0.5
    sleep 1
    
    synth :saw, note: :a2, attack: 0.0, sustain: 0, release: 0.25
    sleep 0.25
    synth :saw, note: :c3, attack: 0.0, sustain: 0, release: 0.5
    sleep 0.5
    
    synth :saw, note: :c3, attack: 0.0, sustain: 0, release: 0.25
    sleep 0.25
    synth :saw, note: :e3, attack: 0.0, sustain: 0, release: 0.5
    sleep 0.5
    
    synth :saw, note: :g2, attack: 0.0, sustain: 0, release: 0.5
    sleep 0.5
    synth :saw, note: :c3, attack: 0.1, sustain: 0, release: 0.5
    sleep 0.5
    
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
