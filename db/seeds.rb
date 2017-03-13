User.destroy_all
Event.destroy_all
Request.destroy_all

u1 = User.create!(
  email: 'chotto@matte.com',
  name: 'Chotto Matte',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Soho, London, United Kingdom',
  bar_telephone: ' 020 7042 7171',
  bar_image: 'https://www.countryandtownhouse.co.uk/wp-content/uploads/2015/02/Chotto-Matte-interior-London.jpg',
  bar_description: 'The Nikkei cuisine is at the heart of the Chotto-Matte experience. It embraces the very best of Nikkei (Japanese – Peruvian) dishes, with bold eye-catching natural colors and mouth-watering taste sensations. We have an extensive menu, so anyone who wants to find something to eat, will find it here',
  website: "https://www.Chotto-Matte.com",
  bar_size: 200,
  is_bar: 'yes',
  lat: 51.5138347,
  lng: -0.1312904
)

u3 = User.create!(
  email: 'maddox@club.com',
  name: 'Maddox',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Mayfair, London, United Kingdom',
  bar_telephone: '020 7629 8877',
  bar_image: 'https://www.londonnightguide.com/wp-content/uploads/2014/06/maddox-club-london-england.jpeg',
  bar_description: 'Since opening in 2007, Maddox Private Members Club has offered London a boutique sanctuary in which to party.',
  bar_size: 100,
  is_bar: 'yes',
  website: 'https://www.maddoxclub.com',
  lat: 51.51267745,
  lng: -0.1424233
)

u4 = User.create!(
  email: 'ronnie@scotts.com',
  name: 'Ronnie Scotts',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Soho, London, United Kingdom',
  bar_telephone: '020 7829 8577',
  bar_image: 'http://www.urbanjunkies.com/oakley-london-guide/img/bg/ronnie-scotts.jpg',
  bar_description: 'European vanguard for jazz and blues from world\'s top musicians, in basement club with late bar.',
  bar_size: 120,
  is_bar: 'yes',
  website: 'https://www.ronniescotts.co.uk/',
  lat: 51.5133057,
  lng: -0.1315010
)

u5 = User.create!(
  email: 'golden@bee.com',
  name: 'Golden Bee',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Shoreditch, London, United Kingdom',
  bar_telephone: '020 7253 1110',
  bar_image: 'https://media.timeout.com/images/102063847/320/210/image.jpg',
  bar_description: 'Stylish, mirror-ceilinged DJ bar with a colourfully lit roof terrace and a lengthy cocktail menu.',
  bar_size: 180,
  is_bar: 'yes',
  website: 'https://www.goldenbee.co.uk',
  lat: 51.525933,
  lng: -0.085417
)

u6 = User.create!(
  email: 'magic@roundabout.com',
  name: 'The Magic Roundabout',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Old Street, London, United Kingdom',
  bar_telephone: '020 7253 1110',
  bar_image: 'https://www.residentadvisor.net/images/events/flyer/2015/11/uk-1128-772221-0-front.jpg',
  bar_description: 'Urban hangout turning out burgers with creative toppings, plus craft beers and cocktails.',
  bar_size: 100,
  is_bar: 'yes',
  website: 'https://www.magicroundabout.co.uk',
  lat: 51.525470,
  lng: -0.087526
)

u2 = User.create!(
  email: 'the@who.com',
  name: 'The Who',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07565554564',
  band_location: 'somewhere',
  is_bar: 'no'
)

u7 = User.create!(
  email: 'queen@queen.com',
  name: 'Queen',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07098054564',
  band_location: 'somewhere',
  is_bar: 'no'
)

u8 = User.create!(
  email: 'ed@sheeran.com',
  name: 'Ed Sheeran',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07568923934',
  band_location: 'somewhere',
  is_bar: 'no'
)

u9 = User.create!(
  email: 'frank@ocean.com',
  name: 'Frank Ocean',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '075655849324',
  band_location: 'somewhere',
  is_bar: 'no'
)

u10 = User.create!(
  email: 'bon@iver.com',
  name: 'Bon Iver',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07345554564',
  band_location: 'somewhere',
  is_bar: 'no'
)

e1 = u1.events.create!(
  date: Time.now - (70*60*24),
  slots_on_offer: 1
)

e2 = u1.events.create!(
  date: Time.now + (60*50*24*4),
  slots_on_offer: 4
)

e3 = u2.events.create!(
  date: Time.now + (80*60*24*10),
  slots_on_offer: 3
)

e4 = u3.events.create!(
  date: Time.now + (20*60*24*7),
  slots_on_offer: 4
)
e5 = u4.events.create!(
  date: Time.now + (34*60*24*2),
  slots_on_offer: 3
)
e6 = u5.events.create!(
  date: Time.now + (12*60*24*3),
  slots_on_offer: 3
)
e7 = u5.events.create!(
  date: Time.now - (70*60*24*7),
  slots_on_offer: 1
)
e8 = u5.events.create!(
  date: Time.now + (60*60*24*9),
  slots_on_offer: 2
)
e7 = u6.events.create!(
  date: Time.now + (37*60*24*12),
  slots_on_offer: 1
)
e8 = u6.events.create!(
  date: Time.now + (104*60*24*3),
  slots_on_offer: 2
)

r1 = u2.requests.create!(
  event_id: e1.id
)

r2 = u7.requests.create!(
  event_id: e2.id,
  status: "rejected"
)

r3 = u7.requests.create!(
  event_id: e3.id
)

r4 = u8.requests.create!(
  event_id: e2.id,
  status: "rejected"
)
r5 = u10.requests.create!(
  event_id: e2.id,
  status: "accepted"
)
r6 = u2.requests.create!(
  event_id: e4.id,
  status: "accepted"
)
r7 = u2.requests.create!(
  event_id: e8.id,
  status: "rejected"
)
