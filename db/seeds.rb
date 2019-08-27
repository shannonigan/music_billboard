Artist.destroy_all

10.times do
  artist = Artist.create(name: Faker::Music.band)
end

    5.times do
      artist.songs.create(name: Faker::Music::UmphreysMcgee.song)
    
    end


Billboard.destroy_all

100.times do
  