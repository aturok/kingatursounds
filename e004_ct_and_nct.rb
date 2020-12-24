r = :C
s = :minor

beat_c = 1

live_loop :rh do
  cs = [
    chord_degree(beat_c, r, s, 3),
    chord_degree(3, r, s, 3),
    chord_degree(7, r, s, 3, invert: 1)
  ]
  ps = [0.3, 0.3, 0.3]
  as = [1.2, 1.2, 1.2]
  
  t = tick
  tt = t%cs.length
  
  
  with_bpm 120 do
    with_synth :piano do
      with_synth_defaults amp: as[tt], release: 2 do
        
        if tt == 0
          cue :domel
        end
        pace = ps[tt]
        cc = cs[tt]
        play cc[0]
        sleep pace
        play cc[1]
        sleep pace
        play cc[2]
        
        sleep 1-ps[tt]*2
      end
    end
  end
end


live_loop :mel do
  sync :domel
  
  notes_in = chord_degree(beat_c, r, s, 3)
  notes_out = scale(r,s) - notes_in
  with_synth :piano do
    with_synth_defaults amp: 2.4, release: 4 do
      if !one_in(7)
        play notes_in.choose+[12].choose
      end
    end
  end
end
