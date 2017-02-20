User.destroy_all
Event.destroy_all
Request.destroy_all

u1 = User.create!(
  email: 'steph@steph.com',
  first_name: 'Steph',
  last_name: 'Robinson',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Hoxton',
  bar_telephone: '07465324564',
  bar_image: 'string',
  bar_description: 'description of bar', bar_size: 200,
  is_bar?: 'yes'
)

u2 = User.create!(
  email: 'the@who.com',
  first_name: 'The',
  last_name: 'Who',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07565554564',
  artist_id: '86847384747hhs',
  band_image: 'stringwho',
  is_bar?: 'no'
)

# u3 = User.create!(email: 'the@the.com', first_name: 'The', last_name: 'Blas', password: 'password', password_confirmation: 'password',  band_telephone: '8574383837', artist_id: '86847383893shs', band_image: 'stringbla', is_bar?: 'yes' )

e1 = Event.create!(
  user_id: ,
  date: 01/03/2017,
  slots_on_offer: 3,
  slots_taken: 1,
  is_active?: true
)

e2 = Event.create!(
  user_id: ,
  date: 02/03/2017,
  slots_on_offer: 4,
  slots_taken: 0,
  is_active?: true
)

r1 = Request.create!(
  user_id: u2.id,
  event_id: e1.id,
  status: "accepted"
)

r2 = Request.create!(
  user_id: u2.id,
  event_id: e2.id,
  status: "rejected"
)
