User.destroy_all
Event.destroy_all
Request.destroy_all

u1 = User.create!(
  email: 'steph@steph.com',
  name: 'Steph Robinson',
  password: 'password',
  password_confirmation: 'password',
  bar_location: 'Hoxton',
  bar_telephone: '07465324564',
  bar_image: 'string',
  bar_description: 'description of bar', bar_size: 200,
  is_bar: 'yes'
)

u2 = User.create!(
  email: 'the@who.com',
  name: 'The Who',
  password: 'password',
  password_confirmation: 'password',
  band_telephone: '07565554564',
  band_image: 'stringwho',
  is_bar: 'no'
)

# u3 = User.create!(email: 'the@the.com', first_name: 'The', last_name: 'Blas', password: 'password', password_confirmation: 'password',  band_telephone: '8574383837', artist_id: '86847383893shs', band_image: 'stringbla', is_bar: 'yes' )

e1 = u1.events.create!(
  date: Time.now + (60*60*24),
  description: "first event",
  slots_on_offer: 1
)

e2 = u1.events.create!(
  date: Time.now + (60*60*24*4),
  description: "second event",
  slots_on_offer: 4
)

e3 = u1.events.create!(
  date: Time.now + (60*60*24*5),
  description: "third event",
  slots_on_offer: 6
)

r1 = u2.requests.create!(
  event_id: e1.id
)

r2 = u2.requests.create!(
  event_id: e2.id,
  status: "rejected"
)

r3 = u2.requests.create!(
  event_id: e3.id
)
