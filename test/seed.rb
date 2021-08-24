(Date.new(2014,1,1)..Date.new(2017,12,31)).each do |d|
  DateDimension.new_from_date(d).save!
end

(1..5).each do |i|
  user = User.create!(
    created_at: Time.now - i.months,
    username: "user_#{i}"
  )

  Profile.create!(
    created_at: Time.now - i.months,
    user: user,
    favorite_pokemon: 'Pikachu'
  )
end

(1..25).each do |i|
  base = rand(100)
  tax = rand(100)
  Sale.create!(
    item: "Item#{rand(3)}",
    base_price: base,
    taxes: tax,
    total: base + tax,
    placed_at: DateDimension.find("201603#{(rand(30)+1).to_s.rjust(2, '0')}")
  )
end

platforms = {}
platforms['3DS']    = Platform.create!(name: '3DS', kind: 'Portable')
platforms['Wii U']  = Platform.create!(name: 'Wii U', kind: 'Console')
platforms['Switch'] = Platform.create!(name: 'Switch', kind: 'Hybrid')

locations = {}
locations['North America']  = Location.create!(name: 'North America')
locations['Europe']         = Location.create!(name: 'Europe')
locations['Australia']      = Location.create!(name: 'Australia')
locations['Japan']          = Location.create!(name: 'Japan')

series = {}
series["Animal Crossing series"] = Series.create!(name: "Animal Crossing series")
series["BOXBOY! series"] = Series.create!(name: "BOXBOY! series")
series["Chibi-Robo! series"] = Series.create!(name: "Chibi-Robo! series")
series["Fire Emblem series"] = Series.create!(name: "Fire Emblem series")
series["Kirby series"] = Series.create!(name: "Kirby series")
series["Monster Hunter Stories series"] = Series.create!(name: "Monster Hunter Stories series")
series["Shovel Knight series"] = Series.create!(name: "Shovel Knight series")
series["Skylanders SuperChargers series"] = Series.create!(name: "Skylanders SuperChargers series")
series["Splatoon series"] = Series.create!(name: "Splatoon series")
series["Super Mario series"] = Series.create!(name: "Super Mario series")
series["Super Mario Bros. 30th Anniversary series"] = Series.create!(name: "Super Mario Bros. 30th Anniversary series")
series["Super Smash Bros. series"] = Series.create!(name: "Super Smash Bros. series")
series["The Legend of Zelda series"] = Series.create!(name: "The Legend of Zelda series")
series["Yoshi's Woolly World series"] = Series.create!(name: "Yoshi's Woolly World series")
series["Animal Crossing Cards - New Leaf Welcome amiibo series"] = Series.create!(name: "Animal Crossing Cards - New Leaf Welcome amiibo series")
series["Animal Crossing Cards - Promos series"] = Series.create!(name: "Animal Crossing Cards - Promos series")
series["Animal Crossing Cards - Series 1"] = Series.create!(name: "Animal Crossing Cards - Series 1")
series["Animal Crossing Cards - Series 2"] = Series.create!(name: "Animal Crossing Cards - Series 2")
series["Animal Crossing Cards - Series 3"] = Series.create!(name: "Animal Crossing Cards - Series 3")
series["Animal Crossing Cards - Series 4"] = Series.create!(name: "Animal Crossing Cards - Series 4")
series["Animal Crossing x Sanrio Cards series"] = Series.create!(name: "Animal Crossing x Sanrio Cards series")
series["Mario Sports Superstars series"] = Series.create!(name: "Mario Sports Superstars series")
series["Pokkén Tournament series"] = Series.create!(name: "Pokkén Tournament series")

genres = {}
genres["Adventure"] = Genre.create!(display_name: "Adventure")
genres["Action"] = Genre.create!(display_name: "Action")
genres["Fighting"] = Genre.create!(display_name: "Fighting")
genres["Racing"] = Genre.create!(display_name: "Racing")
genres["RPG"] = Genre.create!(display_name: "RPG")

games = {}
games["Mario Kart 8 Deluxe"] = Game.create!(title: "Mario Kart 8 Deluxe", platform: platforms['Switch'], genre: genres['Racing'])
games["Poochy & Yoshi's Woolly World"] = Game.create!(title: "Poochy & Yoshi's Woolly World", platform: platforms['3DS'], genre: genres['Adventure'])
games["Miitopia"] = Game.create!(title: "Miitopia", platform: platforms['3DS'], genre: genres['RPG'])
games["Animal Crossing: Happy Home Designer"] = Game.create!(title: "Animal Crossing: Happy Home Designer", platform: platforms['3DS'], genre: genres['RPG'])
games["Style Savvy: Fashion Forward"] = Game.create!(title: "Style Savvy: Fashion Forward", platform: platforms['3DS'], genre: genres['RPG'])
games["Animal Crossing: New Leaf"] = Game.create!(title: "Animal Crossing: New Leaf", platform: platforms['3DS'], genre: genres['RPG'])
games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"] = Game.create!(title: "Taiko Drum Master: Atsumete Tomodachi Daisakusen", platform: platforms['Wii U'], genre: genres['RPG'])
games["Animal Crossing: amiibo Festival"] = Game.create!(title: "Animal Crossing: amiibo Festival", platform: platforms['Wii U'], genre: genres['RPG'])
games["Super Mario Maker"] = Game.create!(title: "Super Mario Maker", platform: platforms['Wii U'], genre: genres['RPG'])
games["Goodbye! BOXBOY!"] = Game.create!(title: "Goodbye! BOXBOY!", platform: platforms['3DS'], genre: genres['RPG'])
games["Chibi-Robo! Zip Lash"] = Game.create!(title: "Chibi-Robo! Zip Lash", platform: platforms['3DS'], genre: genres['RPG'])
games["Fire Emblem Echoes: Shadows of Valentia"] = Game.create!(title: "Fire Emblem Echoes: Shadows of Valentia", platform: platforms['3DS'], genre: genres['RPG'])
games["Kirby: Planet Robobot"] = Game.create!(title: "Kirby: Planet Robobot", platform: platforms['3DS'], genre: genres['RPG'])
games["Picross 3D Round 2"] = Game.create!(title: "Picross 3D Round 2", platform: platforms['3DS'], genre: genres['RPG'])
games["One Piece: Super Grand Battle! X"] = Game.create!(title: "One Piece: Super Grand Battle! X", platform: platforms['3DS'], genre: genres['RPG'])
games["Super Smash Bros. for Nintendo 3DS"] = Game.create!(title: "Super Smash Bros. for Nintendo 3DS", platform: platforms['3DS'], genre: genres['RPG'])
games["Yoshi's Woolly World"] = Game.create!(title: "Yoshi's Woolly World", platform: platforms['Wii U'], genre: genres['RPG'])
games["Kirby and the Rainbow Curse"] = Game.create!(title: "Kirby and the Rainbow Curse", platform: platforms['Wii U'], genre: genres['RPG'])
games["Super Smash Bros. for Wii U"] = Game.create!(title: "Super Smash Bros. for Wii U", platform: platforms['Wii U'], genre: genres['RPG'])
games["Mario Kart 8"] = Game.create!(title: "Mario Kart 8", platform: platforms['Wii U'], genre: genres['RPG'])
games["Monster Hunter Stories"] = Game.create!(title: "Monster Hunter Stories", platform: platforms['3DS'], genre: genres['RPG'])
games["Shovel Knight"] = Game.create!(title: "Shovel Knight", platform: platforms['Wii U'], genre: genres['RPG'])
games["Azure Striker Gunvolt 2"] = Game.create!(title: "Azure Striker Gunvolt 2", platform: platforms['3DS'], genre: genres['RPG'])
games["Mario Party: Star Rush"] = Game.create!(title: "Mario Party: Star Rush", platform: platforms['3DS'], genre: genres['RPG'])
games["Metroid Prime: Federation Force"] = Game.create!(title: "Metroid Prime: Federation Force", platform: platforms['3DS'], genre: genres['RPG'])
games["Metroid Prime: Blast Ball"] = Game.create!(title: "Metroid Prime: Blast Ball", platform: platforms['3DS'], genre: genres['RPG'])
games["Mini Mario & Friends amiibo Challenge"] = Game.create!(title: "Mini Mario & Friends amiibo Challenge", platform: platforms['Wii U'], genre: genres['RPG'])
games["Mario & Luigi: Paper Jam"] = Game.create!(title: "Mario & Luigi: Paper Jam", platform: platforms['3DS'], genre: genres['RPG'])
games["Ace Combat Assault Horizon Legacy +"] = Game.create!(title: "Ace Combat Assault Horizon Legacy +", platform: platforms['3DS'], genre: genres['RPG'])
games["Mario Tennis: Ultra Smash"] = Game.create!(title: "Mario Tennis: Ultra Smash", platform: platforms['Wii U'], genre: genres['RPG'])
games["Mario Party 10"] = Game.create!(title: "Mario Party 10", platform: platforms['Wii U'], genre: genres['RPG'])
games["Splatoon"] = Game.create!(title: "Splatoon", platform: platforms['Wii U'], genre: genres['RPG'])
games["niconico app"] = Game.create!(title: "niconico app", platform: platforms['3DS'], genre: genres['RPG'])
games["Mario & Sonic at the Rio 2016 Olympic Games"] = Game.create!(title: "Mario & Sonic at the Rio 2016 Olympic Games", platform: platforms['Wii U'], genre: genres['RPG'])
games["Captain Toad: Treasure Tracker"] = Game.create!(title: "Captain Toad: Treasure Tracker", platform: platforms['Wii U'], genre: genres['RPG'])
games["The Legend of Zelda: Breath of the Wild"] = Game.create!(title: "The Legend of Zelda: Breath of the Wild", platform: platforms['Wii U'], genre: genres['RPG'])
games["The Legend of Zelda: Twilight Princess HD"] = Game.create!(title: "The Legend of Zelda: Twilight Princess HD", platform: platforms['Wii U'], genre: genres['RPG'])
games["Hyrule Warriors"] = Game.create!(title: "Hyrule Warriors", platform: platforms['Wii U'], genre: genres['RPG'])
games["Hyrule Warriors Legends"] = Game.create!(title: "Hyrule Warriors Legends", platform: platforms['3DS'], genre: genres['RPG'])
games["Star Fox Guard"] = Game.create!(title: "Star Fox Guard", platform: platforms['Wii U'], genre: genres['RPG'])
games["Star Fox Zero"] = Game.create!(title: "Star Fox Zero", platform: platforms['Wii U'], genre: genres['RPG'])
games["Fire Emblem Fates"] = Game.create!(title: "Fire Emblem Fates", platform: platforms['3DS'], genre: genres['RPG'])
games["Code Name: S.T.E.A.M."] = Game.create!(title: "Code Name: S.T.E.A.M.", platform: platforms['3DS'], genre: genres['RPG'])
games["Xenoblade Chronicles 3D"] = Game.create!(title: "Xenoblade Chronicles 3D", platform: platforms['3DS'], genre: genres['RPG'])
games["Mega Man Legacy Collection"] = Game.create!(title: "Mega Man Legacy Collection", platform: platforms['3DS'], genre: genres['RPG'])
games["Mario Sports Superstars"] = Game.create!(title: "Mario Sports Superstars", platform: platforms['3DS'], genre: genres['RPG'])
games["Pokkén Tournament"] = Game.create!(title: "Pokkén Tournament", platform: platforms['Wii U'], genre: genres['RPG'])

figure = Figure.create!(
  name: "Isabelle - Winter Outfit",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "K.K.",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Mabel",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Tom Nook",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Digby",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Reese",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Cyrus",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Lottie",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Blathers",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160129'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160130'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Celeste",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160129'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160130'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Resetti",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160129'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160130'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Kicks",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160129'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160130'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Timmy & Tommy",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Kapp'n",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Rover",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Isabelle - Summer Outfit",
  kind: "amiibo figure",
  series: series["Animal Crossing series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Qbby",
  kind: "amiibo figure",
  series: series["BOXBOY! series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170202'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
figure = Figure.create!(
  name: "Chibi-Robo",
  kind: "amiibo figure",
  series: series["Chibi-Robo! series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151008'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151009'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151106'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151107'))
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Alm",
  kind: "amiibo figure",
  series: series["Fire Emblem series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170420'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170519'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170519'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170520'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
figure = Figure.create!(
  name: "Celica",
  kind: "amiibo figure",
  series: series["Fire Emblem series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170420'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170519'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170519'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170520'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
figure = Figure.create!(
  name: "Kirby",
  kind: "amiibo figure",
  series: series["Kirby series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160611'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Kirby: Planet Robobot"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Meta Knight",
  kind: "amiibo figure",
  series: series["Kirby series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160611'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby: Planet Robobot"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "King Dedede",
  kind: "amiibo figure",
  series: series["Kirby series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160611'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby: Planet Robobot"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Waddle Dee",
  kind: "amiibo figure",
  series: series["Kirby series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160611'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby: Planet Robobot"])
figure = Figure.create!(
  name: "One-Eyed Rathalos and Rider (Female)",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161008'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "One-Eyed Rathalos and Rider (Male)",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161008'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Navirou",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161008'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rathian and Cheval",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161208'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Barioth and Ayuria",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161208'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Qurupeco and Dan",
  kind: "amiibo figure",
  series: series["Monster Hunter Stories series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161208'))
GameCompatability.create!(amiibo: figure, game: games["Monster Hunter Stories"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Shovel Knight",
  kind: "amiibo figure",
  series: series["Shovel Knight series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151211'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160108'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160108'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160630'))
GameCompatability.create!(amiibo: figure, game: games["Shovel Knight"])
GameCompatability.create!(amiibo: figure, game: games["Azure Striker Gunvolt 2"])
GameCompatability.create!(amiibo: figure, game: games["Shovel Knight"])
GameCompatability.create!(amiibo: figure, game: games["Shovel Knight"])
figure = Figure.create!(
  name: "Hammer Slam Bowser",
  kind: "amiibo figure",
  series: series["Skylanders SuperChargers series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150920'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150924'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Turbo Charge Donkey Kong",
  kind: "amiibo figure",
  series: series["Skylanders SuperChargers series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150920'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150924'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Dark Hammer Slam Bowser",
  kind: "amiibo figure",
  series: series["Skylanders SuperChargers series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150920'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150924'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Dark Turbo Charge Donkey Kong",
  kind: "amiibo figure",
  series: series["Skylanders SuperChargers series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150920'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150924'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Inkling Girl",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150528'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Inkling Boy",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150528'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Inkling Squid",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150528'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Callie",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160707'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160709'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["niconico app"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Marie",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160707'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160709'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["niconico app"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Inkling Girl (Lime Green)",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160707'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160709'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Inkling Boy (Purple)",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160707'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160709'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Inkling Squid (Orange)",
  kind: "amiibo figure",
  series: series["Splatoon series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160707'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160708'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160709'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Splatoon"])
figure = Figure.create!(
  name: "Mario",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Luigi",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Peach",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Yoshi",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Toad",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Captain Toad: Treasure Tracker"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Bowser",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150312'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150321'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mario - Gold Edition",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150320'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150625'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mario - Silver Edition",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Wario",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161007'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161008'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Rosalina",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161007'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161008'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Boo",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161007'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161008'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
figure = Figure.create!(
  name: "Donkey Kong",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161007'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161008'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Waluigi",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161105'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Daisy",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161105'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
figure = Figure.create!(
  name: "Diddy Kong",
  kind: "amiibo figure",
  series: series["Super Mario series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161020'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161104'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161105'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Mario - Classic Colors",
  kind: "amiibo figure",
  series: series["Super Mario Bros. 30th Anniversary series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150910'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150912'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151109'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mario - Modern Colors",
  kind: "amiibo figure",
  series: series["Super Mario Bros. 30th Anniversary series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150910'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151023'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151024'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mario",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Peach",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Yoshi",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Donkey Kong",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Link",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Fox",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Star Fox Guard"])
GameCompatability.create!(amiibo: figure, game: games["Star Fox Zero"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Samus",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Wii Fit Trainer",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Villager",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Pikachu",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Kirby",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Marth",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141121'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141128'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141129'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Fates"])
GameCompatability.create!(amiibo: figure, game: games["Code Name: S.T.E.A.M."])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Zelda",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Diddy Kong",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Luigi",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Little Mac",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Pit",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Captain Falcon",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20141206'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20141212'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20141214'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20141219'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Rosalina",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Bowser",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Lucario",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Toon Link",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sheik",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
figure = Figure.create!(
  name: "Ike",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150123'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Fates"])
GameCompatability.create!(amiibo: figure, game: games["Code Name: S.T.E.A.M."])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Shulk",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150220'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Xenoblade Chronicles 3D"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Sonic",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150220'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mega Man",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150220'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mega Man Legacy Collection"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mega Man - Gold Edition",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160223'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mega Man Legacy Collection"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "King Dedede",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150220'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Meta Knight",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150122'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150129'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150220'))
GameCompatability.create!(amiibo: figure, game: games["Goodbye! BOXBOY!"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Kirby and the Rainbow Curse"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Robin",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Fates"])
GameCompatability.create!(amiibo: figure, game: games["Code Name: S.T.E.A.M."])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Lucina",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Fates"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Code Name: S.T.E.A.M."])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Wario",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Charizard",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Ness",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Pac-Man",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150424'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150425'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Greninja",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Jigglypuff",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150429'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150529'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150530'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Palutena",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150611'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150704'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150724'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Dark Pit",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150611'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150704'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150731'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Zero Suit Samus",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150611'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150704'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Ganondorf",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150611'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150704'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Dr. Mario",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150723'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Sonic at the Rio 2016 Olympic Games"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Bowser Jr.",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150723'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Federation Force"])
GameCompatability.create!(amiibo: figure, game: games["Metroid Prime: Blast Ball"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Olimar",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150717'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150723'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150911'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mr. Game & Watch",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "R.O.B. (NES)",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Duck Hunt",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Mii Brawler",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150910'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151101'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Mii Swordfighter",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150910'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151101'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Mii Gunner",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150910'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150926'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151101'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Mewtwo",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151023'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151024'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Falco",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151105'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Star Fox Guard"])
GameCompatability.create!(amiibo: figure, game: games["Star Fox Zero"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Lucas",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151217'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160129'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160130'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "R.O.B. (Famicom)",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Roy",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Ryu",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160428'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Cloud",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Corrin",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
GameCompatability.create!(amiibo: figure, game: games["Fire Emblem Echoes: Shadows of Valentia"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
figure = Figure.create!(
  name: "Bayonetta",
  kind: "amiibo figure",
  series: series["Super Smash Bros. series"]
)
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
figure = Figure.create!(
  name: "Wolf Link",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160304'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160304'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160305'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160310'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Link - The Legend of Zelda",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161203'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Link - Ocarina of Time",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161203'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Toon Link - The Wind Waker",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161203'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Zelda - The Wind Waker",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161201'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161203'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Link (Archer)",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170303'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Link (Rider)",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170303'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Guardian",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170303'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Zelda",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170303'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Twilight Princess HD"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Hyrule Warriors Legends"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Ace Combat Assault Horizon Legacy +"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bokoblin",
  kind: "amiibo figure",
  series: series["The Legend of Zelda series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170303'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170303'))
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["The Legend of Zelda: Breath of the Wild"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Green Yarn Yoshi",
  kind: "amiibo figure",
  series: series["Yoshi's Woolly World series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150625'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150716'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151016'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Pink Yarn Yoshi",
  kind: "amiibo figure",
  series: series["Yoshi's Woolly World series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150625'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150716'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151016'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Light-Blue Yarn Yoshi",
  kind: "amiibo figure",
  series: series["Yoshi's Woolly World series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20150625'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20150626'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150716'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151016'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Mega Yarn Yoshi",
  kind: "amiibo figure",
  series: series["Yoshi's Woolly World series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151115'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151127'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151128'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151210'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Miitopia"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party: Star Rush"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario & Luigi: Paper Jam"])
GameCompatability.create!(amiibo: figure, game: games["Chibi-Robo! Zip Lash"])
GameCompatability.create!(amiibo: figure, game: games["Picross 3D Round 2"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["One Piece: Super Grand Battle! X"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Nintendo 3DS"])
GameCompatability.create!(amiibo: figure, game: games["Mini Mario & Friends amiibo Challenge"])
GameCompatability.create!(amiibo: figure, game: games["Mario Tennis: Ultra Smash"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Mario Party 10"])
GameCompatability.create!(amiibo: figure, game: games["Super Smash Bros. for Wii U"])
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8"])
figure = Figure.create!(
  name: "Poochy",
  kind: "amiibo figure",
  series: series["Yoshi's Woolly World series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170119'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170203'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170203'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170204'))
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Yoshi's Woolly World"])
figure = Figure.create!(
  name: "Vivian",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hopkins",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "June",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Piper",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Paolo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hornsby",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Stella",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tybalt",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Huck",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sylvana",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Boris",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Wade",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Carrie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ketchup",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rex",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Stu",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ursala",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jacob",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Maddie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Billy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Boyd",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bitty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Maggie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Murphy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Plucky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sandy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Claude",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Raddle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Julia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Louie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bea",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Admiral",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ellie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Boots",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Weber",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Candi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Leopold",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Spike",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cashmere",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tad",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Norma",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gonzo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sprocket",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Snooty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Olive",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Dobie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Buzz",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cleo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ike",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tasha",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - New Leaf Welcome amiibo series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20161110'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161111'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20161202'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Isabelle (Character Parfait)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Promos series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150801'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Goldie (amiibo Festival)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Promos series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Stitches (amiibo Festival)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Promos series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rosie (amiibo Festival)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Promos series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20151113'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151121'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "K.K. Slider (Pikopuri)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Promos series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160315'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Isabelle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Tom Nook",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "DJ KK",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Sable",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kapp'n",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Resetti",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Joan",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Timmy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Digby",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Pascal",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Harriet",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Redd",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Saharah",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Luna",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tortimer",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lyle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lottie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Bob",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Fauna",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Curt",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Portia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Leonardo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cheri",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kyle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Al",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Renée",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lopez",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jambette",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rasher",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tiffany",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sheldon",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bluebear",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bill",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kiki",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Deli",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Alli",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kabuki",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Patty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jitters",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gigi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Quillson",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Marcie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Puck",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Shari",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Octavian",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Winnie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Knox",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sterling",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bonbon",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Punchy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Opal",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Poppy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Limberg",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Deena",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Snake",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bangle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Phil",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Monique",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Nate",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Samson",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tutu",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "T-Bone",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mint",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pudge",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Midge",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gruff",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Flurry",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Clyde",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bella",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Biff",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Yuka",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lionel",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Flo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cobb",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Amelia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jeremiah",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cherry",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Roscoe",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Truffles",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Eugene",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Eunice",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Goose",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Annalisa",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Benjamin",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pancetti",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chief",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bunnie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Clay",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Diana",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Axel",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Muffy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Henry",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bertha",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cyrano",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Peanut",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cole",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Willow",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Roald",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Molly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Walker",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 1"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20150730'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20150925'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151002'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151003'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "K.K.",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Reese",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Kicks",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Labelle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Copper",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Booker",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Katie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tommy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Porter",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Leila",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Shrunk",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Don",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Isabelle (Winter)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Blanca",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Nat",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chip",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jack",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Poncho",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Felicity",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ozzie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lucha",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Fuchsia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Harry",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gwen",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Coach",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kitt",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tom",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tipper",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Prince",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pate",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Vladimir",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Savannah",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kidd",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Phoebe",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Egbert",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cookie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Blaire",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Avery",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Nana",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Peck",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Olivia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cesar",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Carmen",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rodney",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Scoot",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Whitney",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Broccolo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Coco",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Groucho",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Wendy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Alfonso",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rhonda",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Butch",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gabi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Moose",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Timbra",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Zell",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pekoe",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Teddy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mathilda",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ed",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bianca",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Filbert",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kitty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Beau",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Nan",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bud",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ruby",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Benedict",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Agnes",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Julian",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bettina",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jay",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sprinkle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Flip",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hugh",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hopper",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pecan",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Drake",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Alice",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Camofrog",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Anicotti",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chops",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Charlise",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Vic",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ankha",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Drift",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Vesta",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Marcel",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pango",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Keaton",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gladys",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hamphrey",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Freya",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kid Cat",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Agent S",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Big Top",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rocket",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 2"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20151029'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20151120'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20151121'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160122'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rover",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Blathers",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Tom Nook",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Pelly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Phyllis",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pete",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mabel",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Leif",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Wendell",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cyrus",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Grams",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Timmy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Digby",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Don",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Isabelle (Kimono)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Franklin",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jingle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lily",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Anchovy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tabby",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kody",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Miranda",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Del",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Paula",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ken",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mitzi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rodeo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bubbles",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cousteau",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Velma",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Elvis",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Canberra",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Colton",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Marina",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Spork",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Freckles",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bam",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Friga",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ricky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Deirdre",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hans",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chevre",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Drago",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tangy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mac",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Eloise",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Wart Jr.",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hazel",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Beardo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ava",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chester",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Merry",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Genji",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Greta",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Wolfgang",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Diva",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Klaus",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Daisy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Stinky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tammi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tucker",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Blanche",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gaston",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Marshal",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gala",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Joey",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pippy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Buck",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bree",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rooney",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Curlos",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Skye",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Moe",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Flora",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hamlet",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Astrid",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Monty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Dora",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Biskit",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Victoria",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lyman",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Violet",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Frank",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chadder",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Merengue",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cube",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Claudia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Curly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Boomer",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Caroline",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sparro",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Baabara",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rolf",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Maple",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Antonio",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Soleil",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Apollo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Derwin",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Francine",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chrissy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 3"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160114'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Isabelle (Dress)",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160617'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Style Savvy: Fashion Forward"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Brewster",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Katrina",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Phineas",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Celeste",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Tommy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gracie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Leilani",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Resetti",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Timmy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lottie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Poochy & Yoshi's Woolly World"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Super Mario Maker"])
figure = Figure.create!(
  name: "Shrunk",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pave",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gulliver",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Redd",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Zipper",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Goldie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Stitches",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pinky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mott",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mallary",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rocco",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Katt",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Graham",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Peaches",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Dizzy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Penelope",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Boone",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Broffina",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Croque",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pashmina",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Shep",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lolly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Erik",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Dotty",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pierce",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Queenie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Fang",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Frita",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tex",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Melba",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bones",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Anabelle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rudy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Naomi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Peewee",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tammy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Olaf",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lucy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Elmer",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Puddles",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rory",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Elise",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Walt",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mira",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pietro",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Aurora",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Papi",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Apple",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rod",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Purrl",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Static",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Celia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Zucker",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Peggy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Ribbot",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Annalise",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chow",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sylvia",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Jacques",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sally",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Doc",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Pompom",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Tank",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Becky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rizzo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Sydney",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Barold",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Nibbles",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Kevin",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gloria",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lobo",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Hippeux",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Margie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Lucky",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rosie",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rowan",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Maelle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Bruce",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "O'Hare",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Gayle",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cranston",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Frobert",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Grizzly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Cally",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Simon",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Iggly",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Angus",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Twiggy",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Robin",
  kind: "amiibo card",
  series: series["Animal Crossing Cards - Series 4"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160324'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160610'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160618'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Taiko Drum Master: Atsumete Tomodachi Daisakusen"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: amiibo Festival"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: Happy Home Designer"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Rilla",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Marty",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Étoile",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chai",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Chelsea",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Toby",
  kind: "amiibo card",
  series: series["Animal Crossing x Sanrio Cards series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20161103'))
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20161125'))
GameCompatability.create!(amiibo: figure, game: games["Mario Kart 8 Deluxe"])
GameCompatability.create!(amiibo: figure, game: games["Animal Crossing: New Leaf"])
figure = Figure.create!(
  name: "Mario - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Mario - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170310'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170311'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170324'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170330'))
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Mario - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Mario - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Mario - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Luigi - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Luigi - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Luigi - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Luigi - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170310'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170311'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170324'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170330'))
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Luigi - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Peach - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Peach - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Peach - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170310'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170311'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170324'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170330'))
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Peach - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Peach - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Daisy - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Daisy - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Daisy - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Daisy - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Daisy - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170310'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170311'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170324'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170330'))
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Yoshi - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Yoshi - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Yoshi - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Yoshi - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Yoshi - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Wario - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Wario - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Wario - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Wario - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Wario - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Waluigi - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Waluigi - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Waluigi - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Waluigi - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Waluigi - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Donkey Kong - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Donkey Kong - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Donkey Kong - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Donkey Kong - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Donkey Kong - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Diddy Kong - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Diddy Kong - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Diddy Kong - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Diddy Kong - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Diddy Kong - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20170310'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20170311'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20170324'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20170330'))
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser Jr. - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser Jr. - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser Jr. - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser Jr. - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Bowser Jr. - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Boo - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Boo - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Boo - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Boo - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Boo - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Mario - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Mario - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Mario - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Mario - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Mario - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Luigi - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Luigi - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Luigi - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Luigi - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Baby Luigi - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Birdo - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Birdo - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Birdo - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Birdo - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Birdo - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Rosalina - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Rosalina - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Rosalina - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Rosalina - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Rosalina - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Metal Mario - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Metal Mario - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Metal Mario - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Metal Mario - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Metal Mario - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Pink Gold Peach - Soccer",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Pink Gold Peach - Baseball",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Pink Gold Peach - Tennis",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Pink Gold Peach - Golf",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Pink Gold Peach - Horse Racing",
  kind: "amiibo card",
  series: series["Mario Sports Superstars series"]
)
GameCompatability.create!(amiibo: figure, game: games["Mario Sports Superstars"])
figure = Figure.create!(
  name: "Shadow Mewtwo",
  kind: "amiibo card",
  series: series["Pokkén Tournament series"]
)
ReleaseDate.create!(amiibo: figure, location: locations["Europe"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["North America"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Japan"], released_on: DateDimension.find('20160318'))
ReleaseDate.create!(amiibo: figure, location: locations["Australia"], released_on: DateDimension.find('20160319'))
GameCompatability.create!(amiibo: figure, game: games["Pokkén Tournament"])
