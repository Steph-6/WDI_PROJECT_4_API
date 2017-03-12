# Project 4 - Ruby on Rails

###Overview
For my intial concept I knew I wanted to explore the relationships that can be created with Ruby on Rails - so at least three models. I wanted to create a social network between bars and musicians to make small venues and bars more accessible to unsigined artists.
  
The application can be used here: [VeNew](https://client-thingy.herokuapp.com/)

Model relationship:
![image](http://i.imgur.com/MhFHfsY.png) 


As a Venue Manager the user can add an Event with a number of slots available. Each slot can then be requested by a registered Musician. The Venue Manager can then accept or reject that pending request.  

##MVP - Database Creation
###Migration
I decided to create the three models with 
```rails g model``` and ```rails g controller``` for each model.  
Once the three migration files were created they were migrated to the schema.  

###Model  
At first with the three models I used a few atrributes for each model which could then be built upon and migrated again. 

*** 
####User - has many :requests, has many :events
An important decision I made for the User model was or not to create one for the Bars and another for the Musicians. However since this would mean setting user authentication for each type of user I decided to use an is_bar boolean throughout the application.  
Then within the User model I also had name, location, contact details etc.  
 
```
  validates_presence_of :is_bar
  validates_presence_of :bar_size, :bar_location, :bar_image, :bar_telephone, :website :if =>  lambda {|o| o.is_bar == 'yes' }
  validates_presence_of :band_telephone, :band_location, :if => lambda {|o| o.is_bar == 'no' }

  private
  def user_is_bar
    is_bar == 'yes'
  end

  def user_is_band
    is_bar == 'no'
  end
```  


#####User Serializer
Within the serializer I could use the attributes created to make more attributes that wold be helpful down the line:  
  
* my pending requests  

```
  def my_pending_requests
    object.requests.where(status: "pending")
  end
```  
 
* my accepted requests
* my rejected requests


***
####Event - belongs to :user, has many requests
The Event model was important to have date and the number of slots on offer. The idea was that each 'slot' would represent a period of time on that date that could be booked later - something that I knew further down the line would be easy to implement, but for MVP purposes remained as 'slots on offer'.  
Also seeing as each event would be assinged a date I used an update_expired_events method in the application_controller that would be run before_action.  

```
def update_expired_events
	events = Event.where(is_expired: "no").select { |event| event.date < Time.now }
	events.each do |event|
   event.update(is_expired: "yes")
   		p "#{event.user.name}'s event has expired"
   end
end
```

#####Event Serializer
Like the User model I created methods to create more attributes I knew would be useful such as updating the slots_remaining  

```
def slots_remaining
    object.slots_on_offer - object.requests.where(status: "accepted").length
  end
```  
So musicians would not be requesting events that had reached capacity.  

***
####Request
Although each request belonged to a single user (the musician) and a single event, it was important to then be able to link that event back to the user who had created the event. I think this relationship was the one I struggled with the most. To do so in the model I set up methods that would be run before each request was created - such as:   

```
def set_band_name
    self.band_name = User.find(self.user_id).name
  end
  
def set_bar_name
  self.bar_name = Event.find(self.event_id).user.name
end  
```
Because it was important to me for the website to have a very easy user journey I made sure to also include the id's of each attribute so that links to those show pages could be implemented.  
In this model after each request was made I also ran the method to check whether the event was at capacity or not. 

*** 

For further details on the site please read [Client-side VeNew](https://github.com/Steph-6/WDI_PROJECT_4_CLIENT/blob/master/README.md)


