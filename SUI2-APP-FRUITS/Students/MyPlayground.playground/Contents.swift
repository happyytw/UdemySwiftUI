import WeatherKit
import CoreLocation

let weatherService = WeatherService()
let sanFrancisco = CLLocation(latitude: 37.7749, longitude: 122.4194)
let weather = try await service.weather(for: sanFrancisco)

func getWeather() async {
    do {
        
        let weather = try await service.weather(for: currentLocation)
        print(weather.)
        
    } catch {
        assertionFailure(error.localizedDescription)
    }
}

