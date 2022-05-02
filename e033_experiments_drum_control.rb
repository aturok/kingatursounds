samps808 = "C:/Sonic/samples/cymatics_orchid/808s & Basses/"
samps_drums = "C:/Sonic/samples/cymatics_orchid/Drum One Shots/"
samps_x = "C:/Sonic/samples/cymatics_orchid/One Shots/"
samps_v = "C:/Sonic/samples/cymatics_orchid/Vocal Loops/"

samps_pt_kicks = "Cymatics - Orchid Kick"
samps_pt_snares = "Cymatics - Orchid Snare"
samps_pt_hihats = "Cymatics - Orchid Hihat"

live_loop :control_me do
  cue :beat
  sleep 1
  cue :beat
  cue :beat2
end


live_loop :kick do
  ##| stop
  sync :beat
  sample samps_drums, samps_pt_kicks, 4, rate: 0.8, amp: 0.8
  
  sync :beat
  sample samps_drums, samps_pt_kicks, 4, rate: 0.9, amp: 0.4
  ##| sleep 0.5
  ##| sample samps_drums, samps_pt_snares, 4, rate: 1, amp: 0.5
end

##| _|k |  |k |  |
##| _| |  |x |  |

live_loop :hihats do
  ##| stop
  
  gen_cutoff = lambda{ 100+15*rand() }
  
  with_fx :lpf, cutoff: 130, cutoff_slide: 0.3 do |c_lpf|
    sync :beat
    control c_lpf, cutoff: gen_cutoff.call
    sleep 0.5+(-0.05*0.1*rand())
    sample samps_drums, samps_pt_hihats, 0, rate: 1, amp: 0.6
    ##| sleep 0.75+(-0.05*0.1*rand())
    ##| sample samps_drums, samps_pt_hihats, 0, rate: 1, amp: 0.6
    
    sync :beat
    
    control c_lpf, cutoff: gen_cutoff.call
    sleep 0.25+(-0.05*0.1*rand())
    sample samps_drums, samps_pt_hihats, 0, rate: 1, amp: 0.5
    control c_lpf, cutoff: gen_cutoff.call
    sleep 0.5+(-0.05*0.1*rand())
    sample samps_drums, samps_pt_hihats, 0, rate: 1, amp: 0.75
  end
end



live_loop :atmosphere do
  stop
  with_fx :reverb, room: 0.9, damp: 0.5 do
    with_fx :hpf, cutoff: 55 do
      sample samps_v, 8, rate: 0.25 + (-0.05 + rand()*0.1), finish: 0.184, attack: 1, release: 1
      sleep 9.0 + rand()*2
      sample samps_v, 8, rate: 0.25 + (-0.05 + rand()*0.1), start: 0.32, finish: 0.60, attack: 1, release: 1
      sleep 11.0 + rand()*2
      
    end
  end
end

live_loop :chords1 do
  ##| stop
  
  with_fx :reverb, room: 0.8, damp: 0.6 do
    with_fx :lpf, cutoff: 80 do
      with_synth :dsaw do
        with_synth_defaults amp: 0.4, detune: 0.2 do
          
          ##| bar1
          
          sync :beat
          play_chord [:a4, :c4, :e4], sustain: 0.5
          sleep 0.5
          
          
          play_chord [:d4, :f4, :a4], sustain: 0.25
          sleep 0.25
          play_chord [:d4, :f4, :a4], sustain: 0.25
          
          
          sync :beat
          play_chord [:g4, :b3, :d4], sustain: 0.5
          sleep 0.5
          play_chord [:g4, :b3, :d4], sustain: 0.5
          
          ##| bar
          sync :beat
          play_chord [:a4, :c4, :e4], sustain: 0.5
          sleep 0.5
          play_chord [:a4, :c4, :e4], sustain: 0.5
          sleep 0.1
          
          
          sync :beat
          play_chord [:d4, :f4, :a4], sustain: 0.75, release: 0.25
          sleep 0.1
          
          sync :beat
          play_chord [:g4, :b3, :d4], sustain: 0.25
          sleep 0.25
          play_chord [:g4, :b3, :d4], sustain: 0.25
          sleep 0.25
          play_chord [:g4, :b3, :d4], sustain: 0.5
          
        end
      end
    end
  end
end


