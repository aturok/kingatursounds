
def wows(note, options = {})
  degrade = options[:degrade] || 0.125
  chrd = note
  if !(note.respond_to? 'each')
    chrd = [note]
  end
  
  in_thread do
    with_fx :lpf, cutoff: 130, cutoff_slide: 0.125 do |clpf|
      with_synth :saw do
        play_chord chrd,
          env_curve: 6,
          attack: 0.005,
          attack_level: 1,
          decay: options[:decay] || 0.5,
          sustain_level: 0.5,
          release: options[:release] || 0.5
      end
      control clpf, cutoff: 100
      sleep degrade
      control clpf, cutoff: 70
      sleep degrade
      control clpf, cutoff: 55
      ##| sleep degrade
      ##| control clpf, cutoff: 100
      
    end
  end
end

##| 100.times do
##|   wows choose([:a3,:c4,:e4,:g4,:a4])
##|   sleep 0.25
##| end

##| scale(:a5, :minor).map{ |x| wows x, degrade: 0.05; sleep 0.25 }

live_loop :melody do
  ##| stop
  if one_in(5)
    sleep 0.25
  else
    
    wows choose([:c4,:g4,:b4,:c6,:c5]),
      degrade: rrand(0.05,0.15),
      decay: 1,
      release: 1
    sleep 0.25
  end
end


live_loop :bass do
  ##| stop
  wows :e2, degrade: 0.05, decay: 1, release: 2
  sleep 1.0
  3.times do
    wows :a2, degrade: 0.05, decay: 0.1, release: 0.3
    sleep 0.33
  end
  
end
