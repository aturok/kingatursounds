#synth :pretty_bell, note: 80, release: 0.45

puts(scale(:C, :minor))

root = :C
sc = :minor

sb = 0.4

live_loop :rh do
  s = sb
  pat = (ring [:i, 0], [:iii, 0], [:i, 1])
  with_synth :piano do
    with_synth_defaults amp: 0.5  do
      ci = pat.tick
      play_chord(chord_degree(ci[0], root-12, sc, 3, invert: ci[1]))
      
      t = tick % 3
      if t == 0 or t == 2
        cue :do_mel
      else
        if one_in(10)
          cue :do_mel
        end
      end
      
      sleep s
    end
  end
end

live_loop :mel do
  #stop
  sync :do_mel
  r = root
  if one_in(2)
    #r = root
  end
  
  if one_in(8)
    sync :do_mel
  end
  
  with_fx :reverb, room: 0.9 do
    with_synth :piano do
      with_synth_defaults amp: 1.5, release: 1.0  do
        if one_in(4)
          play scale(r, sc).choose
        else
          play_chord(chord_degree(rrand(1,8), r, sc, 3))
        end
      end
    end
  end
end


