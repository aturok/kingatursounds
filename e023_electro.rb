# Welcome to Sonic Pi

define :play_torn1 do |notes|
  #n = :d2
  with_synth_defaults release: 0.125, attack_level: 1, sustain_level: 0.6, sustain: 0, amp: 0.5, release: 0.25, attack: 0.1 do
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 0.75, release: 0.125, attack: 0.05
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 0.75, release: 0.125, attack: 0.05
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 0.35, release: 0.125, attack: 0.05
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 0.95, release: 0.125, attack: 0.05
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 0.75, release: 0.625, attack: 0.05
    sleep 0.125
    play_chord notes.each { |x| x-12 }, amp: 1.0, release: 0.25, attack: 0.05
    sleep 0.175
    play_chord notes, amp: 0.75, release: 0.75, attack: 0.1
    sleep 0.5
  end
end


define :play_torn2 do |notes|
  n_blasts = 5+rand_i(7)
  blasts = range(0,n_blasts).map { |x| pick([0.75, 0.75, 0.75, 0.35, 0.95, 1.0])[0] }
  pitch_adj = range(0,n_blasts).map { |x| x == n_blasts -1 ? 0 : -12 }
  
  attacks = range(0,n_blasts).map { |x| x == n_blasts - 1 ? 0.1 : 0.05 }
  releases = range(0,n_blasts).map { |x| x == n_blasts-3 ? 0.625 : x==n_blasts-2 ? 0.25 : x==n_blasts-1 ? 0.75 : 0.125 }
  
  sleeps = range(0,n_blasts).map { |x| x == n_blasts-1 ? 0.5 : x==n_blasts-2 ? 0.175 : 0.125 }
  
  with_synth_defaults release: 0.125, attack_level: 1, sustain_level: 0.6, sustain: 0, amp: 0.5, release: 0.25, attack: 0.1 do
    range(0, n_blasts).each do |i|
      play_chord notes.each { |x| x + pitch_adj[i] }, amp: blasts[i], release: releases[i], attack: attacks[i]
    end
  end
end




live_loop :xxx do
  #stop
  n = :a4
  with_fx :panslicer, wave: 3 do
    with_synth :saw do
      play_torn2 [:c2]
    end
    
    
  end
  
  
  sleep 1
end
