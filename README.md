# Sweater Weather
![enter image description here](https://i.ibb.co/L6DgvTM/giphy.gif)
## About this Project
Find weather data for the city you are traveling to. Know what the weather will be like whether you arrive three hours later or three days later. 

This application assumes that you are driving a vehicle. This means that you won't be able to calculate weather statistics for intercontinental travel. 

Because this application was designed as a back-end only application, views are not available. However, this application does offer API end-points which you can utilize for creating your own unique website with this service.
## Table of Contents
  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [DB Schema](#db-schema)
  - [API Services Used](#API-Services-Used)
  - [Endpoints](#endpoints)
  - [Technologies Used](#technologies-used)
  - [Versioning](#versioning)
  - [Visit a Live Version of this Web App](#Visit-a-Live-Version-of-this-App-on-Heroku)
  - [Authors](#authors)
## Getting Started
To run the web application on your local machine, you can fork and clone down the repo and follow the installation instructions below.
### Prerequisites
To run this application you will need Ruby 2.7.2 and Rails 5.2.6

### Installing
First you'll need to:
`bundle install` 

Next we install Figaro.
`bundle exec figaro install`

Figaro allows us to discretely place our API keys inside of our local files. Only you'll be able to see this file, which helps for keeping API keys secret.

Once you have Figaro installed, verify that you have an `application.yml` file in your `config` folder. The directory of the `application.yml` file should be `config/application.yml`.  For more documentation on Figaro, please see [here](https://github.com/laserlemon/figaro). 

Congratulations! Basic setup is now complete. 

This application utilizes three API services: OpenWeather, MapQuest, and Unsplash.

[Here's  the link to register for the OpenWeather API key](https://home.openweathermap.org/users/sign_up). Please be advised: Though you may receive your API key immediately, it may take a few hours for the key to be activated.

[Here's  the link to register for the MapQuest API key](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register). 

[Here's  the link to register for the Unsplash API key](https://unsplash.com/join). Please be advised: Unsplash rate limit is set to 50 an hour as of 2021AUG11. Recommend you utilize VCR or Webmock for testing purposes or go ahead and apply for an upgraded service. 

Once you have your key, go to your `config/application.yml` file and follow this convention:

`WEATHER_API_KEY: "copy_paste_your_api_key_here"`
`MAPQUEST_API: "copy_paste_your_api_key_here"`
`UNSPLASH_API: "copy_paste_your_api_key_here"`

That should take care of getting your API services!

Now we create the database by running the following command in your terminal
`rails db{:drop,:create,:migrate}`

And that should be all you need to finish installation!
## Running the tests
RSpec testing suite is utilized for testing this application.
 - Run the RSpec suite to ensure everything is passing as expected
`bundle exec rspec`
## DB Schema
![Find My City Schema](https://i.ibb.co/r45hYmf/Screen-Shot-2021-08-11-at-9-53-08-AM.png)
## API Services Used
[OpenWeather](https://openweathermap.org/) |
[Unsplash](https://unsplash.com/) |
[MapQuest](https://developer.mapquest.com/)
## API Endpoints
 - Weather Search - This returns a JSON object that includes 8 hours of hourly weather and 5 days of daily weather forecasts.
```
GET /api/v1/forecast?location=charlotte,nc
Content-Type: application/json
Accept: application/json

Results:
{
	"data": {
		"id": null,
		"type": "forecast",
		"attributes": {
		"current_weather": {
		"datetime": "2021-08-11 09:56:59 -0400",
		"sunrise": "2021-08-11 06:40:14 -0400",
		"sunset": "2021-08-11 20:16:57 -0400",
		"temp": 80.55,
		"feels_like": 85.41,
		"humidity": 80,
		"uvi": 3.47,
		"visibility": 10000,
		"conditions": "broken clouds",
		"icon": "04d"
		},
	"daily_weather": [
		{
			"datetime": "2021-08-11 13:00:00 -0400",
			"sunrise": "2021-08-11 06:40:14 -0400",
			"sunset": "2021-08-11 20:16:57 -0400",
			"max_temp": 96.01,
			"min_temp": 72.46,
			"conditions": "moderate rain",
			"icon": "10d"
			},
			{etc...}
			],
	"hourly_weather": [
		{
			"datetime": "2021-08-11 09:00:00 -0400",
			"temp": 79.84,
			"conditions": "broken clouds",
			"icon": "04d"
			},
			{etc...}
			]
		}
	}
}
```

 - Background Search - This returns a JSON object that includes a picture
   tagged with the relevant city as well as author credits.
```
GET /api/v1/backgrounds?location=auburn,al
Content-Type: application/json
Accept: application/json

Results:
{
	"data": {
	"id": null,
	"type": "image",
	"attributes": {
	"image": {
	"location": "auburn,al",
	"image_url": {
		"raw": "https://images.unsplash.com/photo-1579818276744-a8ce9771445c?ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxhdWJ1cm4lMkNhbHxlbnwwfHx8fDE2Mjg2OTA2NDY&ixlib=rb-1.2.1",
		"full": "https://images.unsplash.com/photo-1579818276744-a8ce9771445c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxhdWJ1cm4lMkNhbHxlbnwwfHx8fDE2Mjg2OTA2NDY&ixlib=rb-1.2.1&q=85",
		"regular": "https://images.unsplash.com/photo-1579818276744-a8ce9771445c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxhdWJ1cm4lMkNhbHxlbnwwfHx8fDE2Mjg2OTA2NDY&ixlib=rb-1.2.1&q=80&w=1080",
		"small": "https://images.unsplash.com/photo-1579818276744-a8ce9771445c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxhdWJ1cm4lMkNhbHxlbnwwfHx8fDE2Mjg2OTA2NDY&ixlib=rb-1.2.1&q=80&w=400",
		"thumb": "https://images.unsplash.com/photo-1579818276744-a8ce9771445c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxhdWJ1cm4lMkNhbHxlbnwwfHx8fDE2Mjg2OTA2NDY&ixlib=rb-1.2.1&q=80&w=200"
	},
	"credit": {
	"source": "unsplash.com",
	"author": "usgs",
	"logo": {
		"small": "https://images.unsplash.com/profile-1573490749269-be4ffb1ae39fimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
		"medium": "https://images.unsplash.com/profile-1573490749269-be4ffb1ae39fimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
		"large": "https://images.unsplash.com/profile-1573490749269-be4ffb1ae39fimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
					}
				}
			}
		}
	}
}
```
 - User Registration - Register a User. Requires password and confirmation. You get an API key in return for registering, which is needed to make route calls.
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "happyhappyjoyjoy@example.com",
  "password": "password",
  "password_confirmation": "password"
}

Results:
{
	"data": {
	"id": "521",
	"type": "users",
	"attributes": {
		"email": "happyhappyjoyjoy@example.com",
		"api_key": "eNskvxfvGnzJM3xtfRwXvxCY"
		}
	}
}
```

 - User Login - Login your user.
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "happyhappyjoyjoy@example.com",
  "password": "password"
}

Results:
{
	"data": {
	"id": "521",
	"type": "users",
	"attributes": {
		"email": "happyhappyjoyjoy@example.com",
		"api_key": "eNskvxfvGnzJM3xtfRwXvxCY"
		}
	}
}
```

 - Roadtrip - Plan a road trip with a starting city and ending city. Get
   weather conditions for that city dependent upon time of travel. Know
   the forecasts so that you can wear the appropriate weather gear.
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}

Results:
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```
## Technologies Used
- Ruby
- Rails
- RSpec
- PostgreSQL
## Gems Used
- factory_bot_rails
- faker
- faraday
- bcrypt
- bootstrap
- shoulda-matchers
- figaro
- capybara
- vcr
## Versioning
- Ruby 2.7.2
- Rails 5.2.6
## Authors
- **Kon Ham**
  [LinkedIn](https://www.linkedin.com/in/kon-ham) | 
  [GitHub](https://github.com/ignored-comment)
