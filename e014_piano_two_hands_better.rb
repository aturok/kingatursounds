r = :A
s = :major


BPM=240

main_chords = [[1,0], [2,0], [7,-1],[4,0]];

live_loop :rh do
  notelens = [1,1,1,1]
  
  t = tick
  tt = t%4
  
  
  with_bpm BPM do
    if tt == 0
      cue :lh
    end
    cue :domel
    
    
    sleep 1
  end
end


live_loop :lh do
  sync :lh
  
  lh_root = r-12
  cs = main_chords.map { |c| chord_degree(c[0], lh_root, s, 3, invert: c[1]) }
  ps = [0.0, 0.0, 0.0, 0.0]
  as = [0.8, 0.6, 0.6, 0.6]
  notelens = [1,1,1,1]
  
  tt =tick%cs.length
  
  
  with_bpm BPM do
    with_synth :piano do
      with_synth_defaults amp: as[tt]*0.6, attack: 0.0, sustain: 0.5, release: 3.0 do
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
  tt = tick % 16
  mel_root = r
  this_chord = main_chords[tt/4]
  notes_in = chord_degree(this_chord[0], mel_root, s, 3, invert: this_chord[1])
  notes_out = scale(mel_root,s) - notes_in
  notes_c = [notes_in,notes_out].choose
  
  if !(tt%4 == 0 && one_in(50) || tt % 4 == 1 && one_in(5) || tt % 4 == 2 && one_in(10) || tt % 4 == 3 && one_in(5))
    
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
end

