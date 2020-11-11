# Sweater Weather API

## Introduction

Sweater Weather is a backend API that could be used for a roadtrip planning app. It was based of off a set of [frontend requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements) and wireframes. It exposes 5 endpoints that aggregate data from multiple external APIs.

This API uses Facade/Service and MVC design patterns to keep code organized. It makes use of serializers to serve information. The API was built using Test Driven Design which resulted in 100% test coverage.

## Table of Contents

1. [Endpoints](#endpoints)
    - [Forecast](#forecast)
    - [Backgrounds](#backgrounds)
    - [Users](#users)
    - [Sessions](#sessions)
    - [Roadtrip](#roadtrip)
1. Local Setup
1. Versions



## Endpoints
### Forecast - ```GET /forecast``` - [Try it out](insert link) <a name="forecast"></a>

Returns a JSON object with weather information for a location. It includes: current weather, daily forecast (up to 5 days) and hourly forecast (up to 8 hours).

Parameters:
| `location`  | required  | String  |
|---|---|---|

Sample Request: `http://localhost:3000/api/v1/forecast?location=Calgary`
<details>
<summary>Sample Response</summary>

```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2020-11-11T10:42:18.000-08:00",
                "sunrise": "2020-11-11T06:47:01.000-08:00",
                "sunset": "2020-11-11T15:53:49.000-08:00",
                "temperature": 16.3,
                "feels_like": 4.03,
                "humidity": 72,
                "uvi": 0.83,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04d"
            },
            "daily_weather": [
                {
                    "date": "2020-11-11T11:00:00.000-08:00",
                    "sunrise": "2020-11-11T06:47:01.000-08:00",
                    "sunset": "2020-11-11T15:53:49.000-08:00",
                    "max_temp": 17.71,
                    "min_temp": 10.96,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2020-11-12T11:00:00.000-08:00",
                    "sunrise": "2020-11-12T06:48:45.000-08:00",
                    "sunset": "2020-11-12T15:52:23.000-08:00",
                    "max_temp": 31.42,
                    "min_temp": 14.77,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2020-11-13T11:00:00.000-08:00",
                    "sunrise": "2020-11-13T06:50:27.000-08:00",
                    "sunset": "2020-11-13T15:50:59.000-08:00",
                    "max_temp": 34.39,
                    "min_temp": 22.15,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2020-11-14T11:00:00.000-08:00",
                    "sunrise": "2020-11-14T06:52:09.000-08:00",
                    "sunset": "2020-11-14T15:49:37.000-08:00",
                    "max_temp": 29.8,
                    "min_temp": 23.11,
                    "conditions": "snow",
                    "icon": "13d"
                },
                {
                    "date": "2020-11-15T11:00:00.000-08:00",
                    "sunrise": "2020-11-15T06:53:51.000-08:00",
                    "sunset": "2020-11-15T15:48:18.000-08:00",
                    "max_temp": 29.59,
                    "min_temp": 18.37,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "10:00:00",
                    "predicted_temp": 16.3,
                    "wind_speed": 3.91,
                    "wind_direction": 342,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "11:00:00",
                    "predicted_temp": 16.65,
                    "wind_speed": 2.24,
                    "wind_direction": 328,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "12:00:00",
                    "predicted_temp": 17.98,
                    "wind_speed": 0.96,
                    "wind_direction": 186,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "13:00:00",
                    "predicted_temp": 19,
                    "wind_speed": 3.18,
                    "wind_direction": 149,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "14:00:00",
                    "predicted_temp": 19.09,
                    "wind_speed": 5.12,
                    "wind_direction": 144,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "15:00:00",
                    "predicted_temp": 16.99,
                    "wind_speed": 5.59,
                    "wind_direction": 142,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "16:00:00",
                    "predicted_temp": 13.69,
                    "wind_speed": 5.84,
                    "wind_direction": 149,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "17:00:00",
                    "predicted_temp": 12.61,
                    "wind_speed": 6.42,
                    "wind_direction": 164,
                    "conditions": "broken clouds",
                    "icon": "04n"
                }
            ]
        }
    }
}
```
</details>

### Backgrounds - ```GET /backgrounds``` - [Try it out](insert link) <a name="backgrounds"></a>

Returns a JSON object with a portrait image of the location provided.

Parameters
| `location`  | required  | String  |
|---|---|---|

Sample Request: `http://localhost:3000/api/v1/backgrounds?location=san%20francisco`
<details>
<summary>Sample Response</summary>
 
```json
  {
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "san francisco",
            "url": "https://images.pexels.com/photos/1141853/pexels-photo-1141853.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
            "credit": {
                "source": "pexels.com",
                "author": "Tae Fuller"
            }
        }
    }
}
```
</details>


### Users - ```POST /users``` - [Try it out](insert link) <a name="users"></a>

Used for user registration. Returns a JSON object user information and a unique API key required for authentication.

Request Body
| Keys  |  Requirement | Type  |
|---|---|---|
| `email`  | required  | String  |
| `password`  | required  | String  |
| `password_confirmation`  | required  | String  |

Sample Request: `http://localhost:3000/api/v1/users`
<details>
<summary>Sample Request Body</summary>
  
```json
{
  "email": "example@email.com",
  "password": "password",
  "password_confirmation": "password"
}
```
</details>

<details>
<summary>Sample Response</summary>
 
```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "example@email.com",
            "api_key": "WygBqWp7QBRxoiH22FkBRGaa"
        }
    }
}
```
</details>

### Sessions - ```POST /sessions``` - [Try it out](insert link) <a name="sessions"></a>

Used for user authentication. Returns a JSON object user information and a unique API key required for authentication.

Request Body
| Keys  |  Requirement | Type  |
|---|---|---|
| `email`  | required  | String  |
| `password`  | required  | String  |


Sample Request: `http://localhost:3000/api/v1/sessions`
<details>
<summary>Sample Request Body</summary>
  
```json
{
  "email": "example@email.com",
  "password": "password",
}
```
</details>

<details>
<summary>Sample Response</summary>
 
```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "example@email.com",
            "api_key": "WygBqWp7QBRxoiH22FkBRGaa"
        }
    }
}
```
</details>

### Roadtrip - ```POST /road_trip``` - [Try it out](insert link) <a name="roadtrip"></a>

Returns a JSON object roadtrip information such as travel time and predicted weather at destination.

Request Body
| Keys  |  Requirement | Type  |
|---|---|---|
| `origin`  | required  | String  |
| `destination`  | required  | String  |
| `api_key`  | required  | String  |


Sample Request: `http://localhost:3000/api/v1/road_trip`
<details>
<summary>Sample Request Body</summary>
  
```json
{
    "origin": "San Francisco",
    "destination": "Los Angeles",
    "api_key": "WygBqWp7QBRxoiH22FkBRGaa"
}
```
</details>

<details>
<summary>Sample Response</summary>
 
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "San Francisco",
            "end_city": "Los Angeles",
            "travel_time": "05:47",
            "weather_at_eta": {
                "temperature": 65.73,
                "conditions": "clear sky"
            }
        }
    }
}
```
</details>
