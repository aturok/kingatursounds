live_loop :drum do
  stop
  with_fx :bitcrusher, amp: 1.0 do
    sample :drum_bass_hard
    sample :drum_cowbell, rate: 0.2
    sleep 0.08
    sample :drum_cowbell, rate: 0.2
    sleep 0.08
    sample :drum_cowbell, rate: 0.2
    sleep 0.5
    sample :drum_bass_soft
    sleep 0.25
    sample :drum_bass_soft
    sleep 0.5
  end
end

live_loop :drum2 do
  stop
  #sleep 2
  
  
  with_fx :pitch_shift, pitch: 4*rand_i(2) do
    with_fx :bitcrusher, amp: 0.4, bits: 8, sample_rate: 4000 do
      #sample :drum_cowbell, rate: 1.1
      
      sleep 0.05
      sample :drum_cowbell, rate: 0.4
      sleep 0.1
      sample :drum_cowbell, rate: 0.4
      sleep 0.1
      sample :drum_cowbell, rate: 0.4
      sleep 0.25
    end
    
  end
end

live_loop :drum3 do
  p = rand(1.5)-0.5
  stop
  
  with_sample_defaults amp: 0.5 do
    with_fx :pan, pan: p do
      sample :drum_bass_hard, rate: 0.9
      sleep 0.25
      sample :drum_bass_hard, rate: 1.8
      sleep 0.25
      sample :drum_bass_hard, rate: 0.9
      sleep 0.5
    end
  end
end



chords = [
  [:d3, :f3, :a3],
  [:a2, :d3, :f3],
  [:e3, :g3, :b3],
  [:g3, :b2, :d3],
  [:a2, :c3, :e3],
]

live_loop :bassline do
  stop
  c = pick(chords)[0]
  
  with_fx :ring_mod do
    with_synth :sine do
      play_chord c[0,1], amp: 2.0, sustain: 0.25
      sleep 0.25
      play_chord c[0,1]+c[2,3], amp: 4.0, sustain: 0.25
      sleep 0.75
    end
  end
  
end

chordsch = [
  #[:c4, :e4, :g4],
  [:c4, :e3, :g3],
  [:c3, :e3, :g3],
  #[:c4, :e4, :g4],
  [:f4, :a3, :c4],
  [:f3, :a3, :c4],
  [:g4, :b3, :d4],
  [:g3, :b3, :d4],
]

live_loop :xline do
  stop
  c = pick(chordsch)
  with_fx :echo, amp: 1.0, decay: 2 do
    with_synth :chiplead do
      play c[0][0]-12, release: 0.1
      sleep 0.25
      play c[0][2]-12, release: 0.2
      #play c[1], release: 0.2
    end
  end
  sleep 1
  
end

live_loop :yline do
  stop
  with_fx :reverb do
    sample :misc_crow, rate: 0*rand_i(10)+1
    sleep 0.25
  end
  
end

