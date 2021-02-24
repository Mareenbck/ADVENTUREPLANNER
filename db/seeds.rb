# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trip.destroy_all
User.destroy_all

mont_blanc_north_face = Trip.new(name: "Mont Blanc North Face", subtitle: "A satisfyingly long descent from the Alps' highest summit.", start_lat: 45.901348125189486, start_long: 6.8851469736546305, end_lat: 45.901348125189486, end_long: 6.8851469736546305, kilometers: 22.3, duration: "1 day", difficulty: 4, description: "This ultra-classic ski mountaineering itinerary gives one of the longest possible descents in Europe. It is also the only way to ski Mont Blanc from its summit without engaging in true extreme skiing. This route is very popular when in condition, however it should by no means be underestimated. The climb up is very arduous and can present some mountaineering challenges; an often-icy ridge on the Dôme de Goûter and the final Bosses Arête leading up to the summit. While the descent rarely exceeds 35 degrees in steepness it is a very serious high mountain route with significant serac and crevasse hazard as well as problems associated with high altitude.", recommended_time: "April-May", positive_elevation: 2889, negative_elevation: 2889, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
mont_blanc_north_face.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/mont_blanc_north_face.gpx")).call
mont_blanc_north_face.save!


couloir_du_trappier = Trip.new(name: "Couloir du Trappier", subtitle: "A large and very attractive couloir in plain view from Chamonix", start_lat: 45.873266989365206, start_long: 6.7792742326855695, end_lat: 45.887944288551815, end_long: 6.813335940241811, kilometers: 10.4, duration: "6-7 hours", difficulty: 4, description: "The Trappier is a stunning and broad couloir of moderate steepness, highly visible from the Chamonix town center. With 800 meter slopes averaging 38 degrees (maximum 45 for a short section) and a predominantly shady aspect, this line simply calls out to be skied. However, a word of caution; both the approach and descent are in serious avalanche terrain with significant terrain trap hazards. A good understanding of the snowpack and thorough assessment of the conditions are needed before venturing out on this route.", recommended_time: "February-March", positive_elevation: 1396, negative_elevation: 2091, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
couloir_du_trappier.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/trappier_couloir.gpx")).call
couloir_du_trappier.save!


breche_de_puiseux = Trip.new(name: "Brêche de Puiseux", subtitle: "The classic ski-mountaineering trip of the area, taking in some mind-blowing scenery.", start_lat: 45.879817999999986, start_long: 6.8896203, end_lat: 45.930210100000004, end_long: 6.921955099999999, kilometers: 20.8, duration: "1 day", difficulty: 3, description: "Starting from the Aiguille du Midi cable car, exit the lift station and walk down the arête. Ski down the Vallée Blanche, crossing over to the Italian side. Continue skiing down the skier's right side of the Géant Icefall until just above the Salle à Manger. Transition here to skinning. Be aware of the La Noire serac now overhead which is sometimes active and has been known on occasion to reach the Salle à Manger, so this is no place to stop for a picnic. Skin up the Périades Glacier, continuing straight up (south-east) instead of towards the Col du Tacul. Once below the ridge line at an elevation of around 3400 meters, climb up the widest south-west facing couloir that comes down from the ridgeline. This couloir is 300 meters long and steepens to 50 degrees at the top. At the top of the approach couloir you reach a small col. To the left along the ridgeline is the outrageously positioned Périades bivi hut. From the small col, abseil for 30-40 meters until onto the Mont Mallet Glacier. Continue down the skier's left side of the glacier, taking care to watch out for some big crevasses. The slope steepens slightly before joining the Leshcaux Glacier. Continue down to the Mer de Glace and the final section of the Vallée Blanche.", recommended_time: "February-March", positive_elevation: 1286, negative_elevation: 3302, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Skins"])
breche_de_puiseux.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/breche_de_puiseux.gpx")).call
breche_de_puiseux.save!


mont_lachat_north_east_face = Trip.new(name: "Mont Lachat North-east Face", subtitle: "A fantastic and wild line which requires a large and stable snowpack.", start_lat: 45.8737659, start_long: 6.7790978, end_lat: 45.892338499999994, end_long: 6.8005596, kilometers: 5.2, duration: "2-3 hours", difficulty: 2, description: "Stable conditions are absolutely vital if you're thinking about skiing this route because it basically follows, and passes under, one big terrain trap after another. Getting avalanched here would be disastrous, so make sure that avalanche conditions are favourable before setting off. A further complication is added by the fact that a deep snowpack is required to make the main gully in the line negotiable. A deep, stable snowpack is not an easy thing to find but when the stars align, this is an incredible trip and given how short the approach to the line is, it is incredible how wild and remote this route feels.", recommended_time: "January-February", positive_elevation: 338, negative_elevation: 1128, equipments: ["Skis", "Arva", "Clothes", "Skins"])
mont_lachat_north_east_face.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/mont_lachat_north_east_face.gpx")).call
mont_lachat_north_east_face.save!


la_jonction = Trip.new(name: "La Jonction Exit", subtitle: "Scenic alternative exit from the West Face of the Midi", start_lat: 45.87269936688239, start_long: 6.87537853606045, end_lat: 45.90063247829683, end_long: 6.858024559915071, kilometers: 5.9, duration: "1-2 hours", difficulty: 4, description: "From the Rond or Cosmique Couloir exits, follow the skier's right side of the Bossons Glacier but instead of continuing down, cut hard skier's left and scoot out onto the large flat area, keeping your height. It's possible to sidestep but skins are recommended. Head towards the Jonction ridge, weaving between crevasses. Ski down the skier's right side of the ridge enjoying the wide open slopes. Near the bottom keep plenty of height and locate the exit couloir before dropping too low. Drop into the couloir and out onto the lower flat area of the Bossons Glacier, traversing the glacier and coming off the other side. From here re-join the normal Bossons descent route to the Mont-Blanc Tunnel.", recommended_time: "February-March-April", positive_elevation: 79, negative_elevation: 1673, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
la_jonction.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/la_jonction.gpx")).call
la_jonction.save!


col_du_tacul = Trip.new(name: "Col du Tacul", subtitle: "A mellow ski tour which often holds good snow.", start_lat: 45.86001000367098, start_long: 6.914162607863551, end_lat: 45.886367317289114, end_long: 6.938294190913439, kilometers: 7.5, duration: "3-4 hours", difficulty: 2, description: "Starting from the Aiguille du Midi cable car, exit the lift station and walk down the arête. Ski down the Vallée Blanche, crossing over to the Italian side. Continue skiing down the skier's right side of the Gèant Icefall until just above the Salle à Manger. Transition here to skinning. Be aware of the La Noire serac now overhead which is sometimes active and has been known on occasion to reach the Salle à Manger, so this is no place to stop for a picnic. Skin up the Périades Glacier towards the Col du Tacul until you reach the steeper slopes below the Col du Tacul. Turning around here, ski back down the same way before trending skier's right side in the lower half, descending 30 degree slopes on the moraine above the Mer de Glace. Continue down the rest of the classic Vallée Blanche route.", recommended_time: "February-March-April", positive_elevation: 797, negative_elevation: 1618, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Skins"])
col_du_tacul.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/col_du_tacul.gpx")).call
col_du_tacul.save!


couloir_spencer = Trip.new(name: "Couloir Spencer", subtitle: "An historical steep descent first made in 1967 by Sylvain Saudan, the original pioneer of extreme skiing.", start_lat: 45.908483565702895, start_long: 6.90632694974407, end_lat: 45.90848703017178, end_long: 6.813335940241811, kilometers: 2.6, duration: "3-4 hours", difficulty: 5, description: "From the mid-station of the Aiguille du Midi cable car (Plan d'Aiguille), follow signs for the Lac Bleu and start skinning eastward and under the Aiguille du Plan and the Blatière. Cross over several small moraine walls (might require a couple of very short boot packs) and head towards the Nantillons Glacier. Drop over one final short but steep moraine wall and onto the Nantillons Glacier. Skin up a little further until under the first rock wall you come to a steepening. Transition to boot packing and climb up a brief steep and rocky section often involving very faceted snow (tiring boot packing). The angle decreases before steepening again up to 45 degree in a small couloir. After the couloir it is normally possible to transition back to skinning before reaching another steeper (sometimes icy) slope. Then reach a small flat area which marks the entrance to the Spencer Couloir. The couloir is sustained at 45 degree before steepening to 50 at the top. Ski back down the same way, or it is possible to exit the upper section of the Nantillons Glacier skier's right. Ski back to the mid station or back to town if snow cover allows.", recommended_time: "April", positive_elevation: 982, negative_elevation: 982, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
couloir_spencer.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/spencer_couloir.gpx")).call
couloir_spencer.save!


col_du_passon = Trip.new(name: "Col du Passon", subtitle: "One of THE classic tours of the area taking in a variety of high quality ski terrain.", start_lat: 45.947937, start_long: 6.9602447, end_lat: 46.00144570000001, end_long: 6.947279299999999, kilometers: 9.1, duration: "3-4 hours", difficulty: 2, description: "One of the most popular tours in the Chamonix valley, the Col du Passon is a real crowd pleaser. A 700 meter skin gives access to a long descent of impeccable quality over a variety of terrain. While there isn’t much significant objective hazard on this route the lower slopes above Le Tour can be avalanche prone. The Col du Passon is also becoming an increasingly popular way to start the Haute Route instead of the Col du Chardonnet.", recommended_time: "February-March", positive_elevation: 684, negative_elevation: 3271, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
col_du_passon.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/col_du_passon.gpx")).call
col_du_passon.save!


aiguille_verte = Trip.new(name: "Aiguille Verte", subtitle: "The king line of the Argentiere Basin", start_lat: 45.94815570000001, start_long: 6.94558, end_lat: 45.95705549999999, end_long: 6.964754400000001, kilometers: 7.9, duration: "5-6 hours", difficulty: 5, description: "Starting from the summit of one of the most prestigious peaks in the Alps, this 1000 meter line reigns supreme in the Argentiere Basin and is a popular means of ascending the Aiguille Verte for alpinists.", recommended_time: "April", positive_elevation: 1562, negative_elevation: 1649, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
aiguille_verte.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/aiguille_verte.gpx")).call
aiguille_verte.save!


couloir_pissoir = Trip.new(name: "Couloir Pissoir", subtitle: "A big adventure through some huge terrain", start_lat: 46.02054560000002, start_long: 6.970731, end_lat: 46.04632359999999, end_long: 6.994817599999999, kilometers: 11.3, duration: "5-6 hours", difficulty: 4, description: "This is a fantastic adventure through some big, wild mountains which culminates with an exciting and remote ski descent. The majority of the terrain the adventure passes through (on both the way up and down) is extremely serious, and an avalanche at virtually any point along the route would be disastrous - save this one for when conditions are safe and you are confident that you can pass through steep terrain on all aspects in (relative) safety.", recommended_time: "March-April", positive_elevation: 1101, negative_elevation: 1905, equipments: ["Skis", "Ropes", "Arva", "Clothes", "Crampons", "Ice Axe", "Skins"])
couloir_pissoir.waypoints = ParseGpxWaypointsService.new(Rails.root.join("db/seeds/couloir_pissoir.gpx")).call
couloir_pissoir.save!


alex = User.create!(email: "alex@gmail.com", password: "123456", first_name: "Alex", last_name: "Snow", level: "Intermediate")
julia = User.create!(email: "julia@gmail.com", password: "123456", first_name: "Julia", last_name: "Evans", level: "Expert")
bobby = User.create!(email: "bobby@gmail.com", password: "123456", first_name: "Bobby", last_name: "Anderson", level: "Expert")
rico = User.create!(email: "rico@gmail.com", password: "123456", first_name: "Rico", last_name: "Lafleche", level: "Beginner")
andrea = User.create!(email: "martin@gmail.com", password: "123456", first_name: "Andrea", last_name: "Ferrari", level: "Intermediate")
chloe = User.create!(email: "chloe@gmail.com", password: "123456", first_name: "Chloe", last_name: "Kim", level: "Intermediate")
