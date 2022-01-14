r = :D
s = :major

beat_c = 1

BPM=180

live_loop :rh do
  notelens = [1,1,1,1]
  
  t = tick
  tt = t%4
  
  
  with_bpm BPM do
    if tt == 0
      cue :lh
    end
    
    if tt == 0
      cue :domel
    end
    if tt == 1 && one_in(10)
      cue :domel
    end
    if tt == 2 && one_in(3)
      cue :domel
    end
    if tt == 3 && one_in(10)
      cue :domel
    end
    
    sleep 1
  end
end


live_loop :lh do
  sync :lh
  
  lh_root = r-12
  cs = [
    chord_degree(beat_c, lh_root, s, 3),
    chord_degree(2,  lh_root, s, 3),
    chord_degree(7, lh_root, s, 3, invert: -1),
    chord_degree(4, lh_root, s, 3)
  ]
  ps = [0.0, 0.0, 0.0, 0.0]
  as = [0.8, 0.6, 0.6, 0.6]
  notelens = [1,1,1,1]
  
  tt =tick%cs.length
  
  
  with_bpm BPM do
    with_synth :tri do
      with_synth_defaults amp: as[tt]*0.2, attack: 0.5, sustain: 1.5, release: 2.0 do
        pace = ps[tt]
        cc = cs[tt]
        play cc[0]
        sleep pace
        play cc[1]
        sleep pace
        play cc[2]
        
        #sleep notelens[tt]-ps[tt]*2
      end
    end
  end
end


live_loop :mel do
  sync :domel
  mel_root = r
  notes_in = chord_degree(beat_c, mel_root, s, 3)
  notes_out = scale(mel_root,s) - notes_in
  notes_c = [notes_in,notes_out].choose
  
  with_bpm BPM do
    with_fx :reverb, room: 0.7 do
      with_synth :piano do
        with_synth_defaults amp: 1.2, release: 4 do
          if !one_in(7)
            play notes_c.choose
          end
        end
      end
    end
  end
end
