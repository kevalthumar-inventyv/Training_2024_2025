---
date created: 2025-02-12 17:56
date updated: 2025-02-13 10:50
---

## 1) OpenWeatherMap (GET)

```swift
//
//  main.swift
//  api_connect
//
//  Created by Keval Thumar on 12/02/25.
//

import Foundation

// MARK: - Models
struct Welcome: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

extension Welcome: CustomStringConvertible {
    var description: String {
        return """
        City: \(name) 
        Country: \(sys.country)
        Coordinates: (\(coord.lat), \(coord.lon))
        Temperature: \(main.temp)°K (Feels like: \(main.feelsLike)°K)
        Min/Max Temperature: \(main.tempMin)°K / \(main.tempMax)°K
        Pressure: \(main.pressure) hPa
        Humidity: \(main.humidity)%
        Weather: \(weather.first?.main ?? "N/A") - \(weather.first?.description ?? "N/A")
        Wind Speed: \(wind.speed) m/s at \(wind.deg)°
        Cloudiness: \(clouds.all)%
        Visibility: \(visibility) meters
        Sunrise: \(sys.sunrise)
        Sunset: \(sys.sunset)
        Timezone Offset: \(timezone) seconds
        """
    }
}


struct Clouds: Codable {
    let all: Int
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    let seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Sys: Codable {
    let type: Int?  // Made optional
    let id: Int?  // Made optional
    let country: String
    let sunrise, sunset: Int
}

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

/*
 1)
    i) URLSession.shared.dataTask(with:url,()->Void) // for downloading large file use with dispatch group for manual control (pause, resume, cancel).
   ii) var (data,response) = URLSession.shared.data(with:url) // for normal data fetching
 1) decoder.decode( PassStructure , from: su decode karvu 6e)
 */

// MARK: - API Call
var cityName = "London"
let apiKey = "009f44c36dc2ce64a15f28b80a1967c7"  // Replace with a valid API key
let urlString =
    "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"


// MARK: - API Call with async/await
func fetchData() async {
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        return
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Invalid Response Code")
            return
        }


        // Decode JSON
        let decoder = JSONDecoder()
        let result = try decoder.decode(Welcome.self, from: data)

        // Print formatted output
        print(result)

    } catch {
        print("Error fetching data: \(error)")
    }
}

    await fetchData()
```

```text

OUTPUT:-

City: London 

Country: GB

Coordinates: (51.5085, -0.1257)

Temperature: 277.86°K (Feels like: 276.12°K)

Min/Max Temperature: 277.1°K / 278.29°K

Pressure: 1020 hPa

Humidity: 88%

Weather: Clouds - overcast clouds

Wind Speed: 2.06 m/s at 340°

Cloudiness: 100%

Visibility: 10000 meters

Sunrise: 1739344806

Sunset: 1739380173

Timezone Offset: 0 seconds
```

## 2) USER POST (POST)

```swift
import Foundation

// MARK: - Welcome
struct User: Codable {
    var firstName, lastName, createdAt: String
    var address: Address
}

// MARK: - ResponseData
struct ResponseData: Codable {
    var args: Args?
    var data: DataClass?
    var files, form: Args?
    var headers: Headers?
    var responceDataJSON: DataClass?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case args, data, files, form, headers
        case responceDataJSON = "json"
        case url
    }
}

// MARK: - Args
struct Args: Codable {
}

// MARK: - DataClass
struct DataClass: Codable {
    var firstName, lastName, createdAt: String?
    var address: Address?
}

// MARK: - Address
struct Address: Codable {
    var line1, line2, country: String?
}

// MARK: - Headers
struct Headers: Codable {
    var host, xRequestStart, connection, contentLength: String?
    var xForwardedProto, xForwardedPort, xAmznTraceID, contentType: String?
    var userAgent, accept, cacheControl, postmanToken: String?
    var acceptEncoding: String?

    enum CodingKeys: String, CodingKey {
        case host
        case xRequestStart = "x-request-start"
        case connection
        case contentLength = "content-length"
        case xForwardedProto = "x-forwarded-proto"
        case xForwardedPort = "x-forwarded-port"
        case xAmznTraceID = "x-amzn-trace-id"
        case contentType = "content-type"
        case userAgent = "user-agent"
        case accept
        case cacheControl = "cache-control"
        case postmanToken = "postman-token"
        case acceptEncoding = "accept-encoding"
    }
}

func postData(user: User) async {
    guard let url = URL(string: "https://postman-echo.com/post") else { return }

    // 1. Create the request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // 2. Encode the data

    do {
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(user)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid response")
            return
        }
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponseData.self, from: data)

        print(
            """
                    Name:- \(result.data?.firstName ?? "No data") \(result.data?.lastName ?? "No data")
                    Address:- \(result.data?.address?.line1 ?? "No data"),\(result.data?.address?.line2 ?? "No data"),\(result.data?.address?.country ?? "No data")
            """
        )
    } catch {
        print("Encoding error: \(error)")
        return
    }
}

/*
         "firstName": "Alda",
         "lastName": "Hamill",
         "createdAt": "2025-02-12T11:27:57.500Z",
         "address": {
             "line1": "841 Joannie Rapids",
             "line2": "East Lavinia",
             "country": "EC"
         }
 */

let user = User(
    firstName: "Keval", lastName: "Thumar",
    createdAt: "2025-02-12T11:27:57.500Z",
    address: Address(
        line1:
            "Nr. Trade Bulls, 2nd Floor, Office 211-222 - Binori B Square, 3,",
        line2: "Sindhubhavan Marg, Bodakdev, Ahmedabad, Gujarat 380001",
        country: "India")
)

await postData(user: user)
```

```text
OUTPUT:-
        Name:- Keval Thumar

        Address:- Nr. Trade Bulls, 2nd Floor, Office 211-222 - Binori B Square, 3,Sindhubhavan Marg, Bodakdev, Ahmedabad, Gujarat 380001,India
```

## 3) Payment (POST)

```swift
import Foundation

// MARK: - InsertData
struct InsertData: Codable {
    var userID: String?
    var payment: Payment?
    var basket: [Basket]?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case payment, basket
    }
}

// MARK: - Basket
struct Basket: Codable {
    var id: String?
    var quantity: Int?
}

// MARK: - Payment
struct Payment: Codable {
    var cardNumber, currency: String?
    var amount: Int?
    var confirmed, confirmedAt: String?
}

// MARK: - ResponseData
struct ResponseData: Codable {
    var args: Args?
    var data: DataClass?
    var files, form: Args?
    var headers: Headers?
    var responseDataJSON: DataClass?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case args, data, files, form, headers
        case responseDataJSON = "json"
        case url
    }
}

// MARK: - Args
struct Args: Codable {
}

// MARK: - DataClass
struct DataClass: Codable {
    var userID: String?
    var payment: Payment?
    var basket: [Basket]?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case payment, basket
    }
}

// MARK: - Headers
struct Headers: Codable {
    var host, xRequestStart, connection, contentLength: String?
    var xForwardedProto, xForwardedPort, xAmznTraceID, contentType: String?
    var userAgent, accept, cacheControl, postmanToken: String?
    var acceptEncoding, cookie: String?

    enum CodingKeys: String, CodingKey {
        case host
        case xRequestStart = "x-request-start"
        case connection
        case contentLength = "content-length"
        case xForwardedProto = "x-forwarded-proto"
        case xForwardedPort = "x-forwarded-port"
        case xAmznTraceID = "x-amzn-trace-id"
        case contentType = "content-type"
        case userAgent = "user-agent"
        case accept
        case cacheControl = "cache-control"
        case postmanToken = "postman-token"
        case acceptEncoding = "accept-encoding"
        case cookie
    }
}

func postData(_ insertData: InsertData) async {
    guard let url = URL(string: "https://postman-echo.com/post") else { return }

    // 1. Create the request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // 2. Encode the data

    do {
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(insertData)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid response")
            return
        }
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponseData.self, from: data)

        print(
            result
        )
    } catch {
        print("Encoding error: \(error)")
        return
    }
}

let payment = Payment(
    cardNumber: "2214",
    currency: "DJF",
    amount: 449,
    confirmed: "true",
    confirmedAt: "2025-02-12T12:20:54.884Z"
)

let basketItems = [
    Basket(id: "7c93a852-17d1-4d9e-ba7b-99e7687b319f", quantity: 287),
    Basket(id: "e9309da3-c8ce-460a-8eff-d8f27ac7f8ad", quantity: 257),
]

let insertData = InsertData(
    userID: "e512cc4f-6ae0-4de5-847b-aecdbb10bd13",
    payment: payment,
    basket: basketItems
)

await postData(insertData)
```

```text
Output:-
ResponseData(args: Optional(api_connect.Args()), data: Optional(api_connect.DataClass(userID: Optional("e512cc4f-6ae0-4de5-847b-aecdbb10bd13"), payment: Optional(api_connect.Payment(cardNumber: Optional("2214"), currency: Optional("DJF"), amount: Optional(449), confirmed: Optional("true"), confirmedAt: Optional("2025-02-12T12:20:54.884Z"))), basket: Optional([api_connect.Basket(id: Optional("7c93a852-17d1-4d9e-ba7b-99e7687b319f"), quantity: Optional(287)), api_connect.Basket(id: Optional("e9309da3-c8ce-460a-8eff-d8f27ac7f8ad"), quantity: Optional(257))]))), files: Optional(api_connect.Args()), form: Optional(api_connect.Args()), headers: Optional(api_connect.Headers(host: Optional("postman-echo.com"), xRequestStart: Optional("t1739364151.992"), connection: Optional("close"), contentLength: Optional("304"), xForwardedProto: Optional("https"), xForwardedPort: Optional("443"), xAmznTraceID: Optional("Root=1-67ac9737-62259f7e436a97d31edc6037"), contentType: Optional("application/json"), userAgent: Optional("api_connect (unknown version) CFNetwork/3826.400.120 Darwin/24.3.0"), accept: Optional("*/*"), cacheControl: nil, postmanToken: nil, acceptEncoding: Optional("gzip, deflate, br"), cookie: nil)), responseDataJSON: Optional(api_connect.DataClass(userID: Optional("e512cc4f-6ae0-4de5-847b-aecdbb10bd13"), payment: Optional(api_connect.Payment(cardNumber: Optional("2214"), currency: Optional("DJF"), amount: Optional(449), confirmed: Optional("true"), confirmedAt: Optional("2025-02-12T12:20:54.884Z"))), basket: Optional([api_connect.Basket(id: Optional("7c93a852-17d1-4d9e-ba7b-99e7687b319f"), quantity: Optional(287)), api_connect.Basket(id: Optional("e9309da3-c8ce-460a-8eff-d8f27ac7f8ad"), quantity: Optional(257))]))), url: Optional("https://postman-echo.com/post"))


This Can be represented as:-

Response Data:
---------------
User ID: e512cc4f-6ae0-4de5-847b-aecdbb10bd13

Payment Details:
- Card Number: 2214
- Currency: DJF
- Amount: 449
- Confirmed: true
- Confirmed At: 2025-02-12T12:20:54.884Z

Basket Items:
1. ID: 7c93a852-17d1-4d9e-ba7b-99e7687b319f, Quantity: 287
2. ID: e9309da3-c8ce-460a-8eff-d8f27ac7f8ad, Quantity: 257

Request Headers:
- Host: postman-echo.com
- User Agent: api_connect (unknown version) CFNetwork/3826.400.120 Darwin/24.3.0
- Content Type: application/json
- Accept Encoding: gzip, deflate, br

Request URL:
https://postman-echo.com/post

```

## 4) JSON Schema v4 (GET)

```swift
import Foundation

// MARK: - ResponceData
struct ResponceData: Codable {
    var args: Args?
    var headers: Headers?
    var url: String?
}

// MARK: - Args
struct Args: Codable {
    var foo1, foo2: String?
}

// MARK: - Headers
struct Headers: Codable {
    var xForwardedProto, host, accept, acceptEncoding: String?
    var cacheControl, cookie, postmanToken, userAgent: String?
    var xForwardedPort: String?

    enum CodingKeys: String, CodingKey {
        case xForwardedProto = "x-forwarded-proto"
        case host, accept
        case acceptEncoding = "accept-encoding"
        case cacheControl = "cache-control"
        case cookie
        case postmanToken = "postman-token"
        case userAgent = "user-agent"
        case xForwardedPort = "x-forwarded-port"
    }
}
// MARK: - API Call with async/await
func fetchData() async {
    guard let url = URL(string: "https://postman-echo.com/get?foo1=bar1&foo2=bar2") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid Response Code")
            return
        }

        // Decode JSON
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponceData.self, from: data)

        // Print formatted output
        print(result)

    } catch {
        print("Error fetching data: \(error)")
    }
}

await fetchData()
```

```text
ResponceData(args: Optional(api_connect.Args(foo1: Optional("bar1"), foo2: Optional("bar2"))), headers: Optional(api_connect.Headers(xForwardedProto: Optional("https"), host: Optional("postman-echo.com"), accept: Optional("*/*"), acceptEncoding: Optional("gzip, deflate, br"), cacheControl: nil, cookie: nil, postmanToken: nil, userAgent: Optional("api_connect (unknown version) CFNetwork/3826.400.120 Darwin/24.3.0"), xForwardedPort: Optional("443"))), url: Optional("https://postman-echo.com/get?foo1=bar1&foo2=bar2"))

This can be the same as:-

Response Data:
-------------------
Arguments:
- foo1: bar1
- foo2: bar2

Headers:
- X-Forwarded-Proto: https
- Host: postman-echo.com
- Accept: */*
- Accept-Encoding: gzip, deflate, br
- User-Agent: api_connect (unknown version) CFNetwork/3826.400.120 Darwin/24.3.0
- X-Forwarded-Port: 443

Request URL:
https://postman-echo.com/get?foo1=bar1&foo2=bar2

```

## 5) Large Query Params (GET)

```swift
import Foundation

struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
    
    var description: String {
        return """
        Response Data:
        -------------------
        Status Code: \(statusCode ?? 0)
        Success: \(success ?? false)
        Message: \(message ?? "No message available")
        
        Data:
        \(data?.description ?? "No data available")
        """
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var page, limit, totalPages: Int?
    var previousPage, nextPage: Bool?
    var totalItems, currentPageItems: Int?
    var data: [Datum]?
    
    var description: String {
        return """
        Pagination:
        - Page: \(page ?? 0) / \(totalPages ?? 0)
        - Limit: \(limit ?? 0)
        - Total Items: \(totalItems ?? 0)
        - Current Page Items: \(currentPageItems ?? 0)
        - Previous Page: \(previousPage ?? false)
        - Next Page: \(nextPage ?? false)
        
        Items:
        \(data?.map { $0.description }.joined(separator: "\n") ?? "No items available")
        """
    }
}

// MARK: - Datum
struct Datum: Codable {
    var symbol, name, marketCap, currentPrice: String?

    enum CodingKeys: String, CodingKey {
        case symbol = "Symbol"
        case name = "Name"
        case marketCap = "MarketCap"
        case currentPrice = "CurrentPrice"
    }
    
    var description: String {
        return """
        - Symbol: \(symbol ?? "N/A")
        - Name: \(name ?? "N/A")
        - Market Cap: \(marketCap ?? "N/A")
        - Current Price: \(currentPrice ?? "N/A")
        """
    }
}

// MARK: - API Call with async/await
func fetchData() async {
    guard let url = URL(string: "https://api.freeapi.app/api/v1/public/stocks?page=1&limit=2&inc=Symbol%252CName%252CMarketCap%252CCurrentPrice&query=tata") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid Response Code")
            return
        }

        // Decode JSON
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponceData.self, from: data)

        // Print formatted output
        print(result.description)
        print(result.data?.description ?? "Default Data")

    } catch {
        print("Error fetching data: \(error)")
    }
}

await fetchData()
```

```text

Response Data:

-------------------

Status Code: 200

Success: true

Message: Stocks fetched successfully

  

Data:

Pagination:

- Page: 1 / 7

- Limit: 2

- Total Items: 14

- Current Page Items: 2

- Previous Page: false

- Next Page: true

  

Items:

- Symbol: TATACHEM

- Name: Tata Chemicals Limited

- Market Cap: ₹ 28,355 Cr.

- Current Price: ₹ 1,113

- Symbol: TATACOFFEE

- Name: Tata Coffee Limited

- Market Cap: ₹ 5,993 Cr.

- Current Price: ₹ 321

Pagination:

- Page: 1 / 7

- Limit: 2

- Total Items: 14

- Current Page Items: 2

- Previous Page: false

- Next Page: true

  

Items:

- Symbol: TATACHEM

- Name: Tata Chemicals Limited

- Market Cap: ₹ 28,355 Cr.

- Current Price: ₹ 1,113

- Symbol: TATACOFFEE

- Name: Tata Coffee Limited

- Market Cap: ₹ 5,993 Cr.

- Current Price: ₹ 321
```

## 6) Get path variable (GET)

```swift
import Foundation

// MARK: - ResponceData
struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
}

// MARK: - DataClass
struct DataClass: Codable {
    var pathVariable: String?
}
// MARK: - API Call with async/await
func fetchData() async {
    guard let url = URL(string: "https://api.freeapi.app/api/v1/kitchen-sink/request/path-variable/123") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid Response Code")
            return
        }

        // Decode JSON
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponceData.self, from: data)

        // Print formatted output
        print(result)

    } catch {
        print("Error fetching data: \(error)")
    }
}

await fetchData()
```

```text
ResponceData(statusCode: Optional(200), data: Optional(api_connect.DataClass(pathVariable: Optional("123"))), message: Optional("Path variables caught successfully"), success: Optional(true))

This can be represented as:-

Response Data:
-------------------
Status Code: 200
Success: true
Message: Path variables caught successfully

Data:
- Path Variable: 123

```

## 7) Random Product (GET)

```swift
import Foundation

// MARK: - ResponceData
struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
}

// MARK: - DataClass
struct DataClass: Codable {
    var id: Int?
    var title, description: String?
    var price: Int?
    var discountPercentage, rating: Double?
    var stock: Int?
    var brand, category: String?
    var thumbnail: String?
    var images: [String]?
}

// MARK: - API Call with async/await
func fetchData() async {
    guard let url = URL(string: "https://api.freeapi.app/api/v1/public/randomproducts/product/random") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid Response Code")
            return
        }

        // Decode JSON
        let decoder = JSONDecoder()
        let result = try decoder.decode(ResponceData.self, from: data)

        // Print formatted output
        print(result)

    } catch {
        print("Error fetching data: \(error)")
    }
}

await fetchData()
```

```text

Response Data:
-------------------
Status Code: 200
Success: true
Message: Random product fetched successfully

Product Details:
- ID: 86
- Title: Bluetooth Aux
- Description: Bluetooth Aux Bluetooth Car Aux Car Bluetooth Transmitter Aux Audio Receiver Handfree Car Bluetooth Music Receiver Universal 3.5mm Streaming A2DP Wireless Auto AUX Audio Adapter With Mic For Phone MP3
- Price: $25
- Discount: 10.56%
- Rating: 4.57 ⭐
- Stock: 22 units
- Brand: Car Aux
- Category: Automotive

Thumbnail: https://cdn.dummyjson.com/product-images/86/thumbnail.jpg

Images:
1. https://cdn.dummyjson.com/product-images/86/1.jpg
2. https://cdn.dummyjson.com/product-images/86/2.webp
3. https://cdn.dummyjson.com/product-images/86/3.jpg
4. https://cdn.dummyjson.com/product-images/86/4.jpg
5. https://cdn.dummyjson.com/product-images/86/thumbnail.jpg
```

## 8) LOGIN(POST)

```swift
import Foundation

// MARK: - User Model
struct User: Codable {
    var password, username: String?
}

// MARK: - ResponceData
struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
}

// MARK: - DataClass
struct DataClass: Codable {
    var user: UserResponce?
    var accessToken, refreshToken: String?
}

// MARK: - User
struct UserResponce: Codable {
    var id: String?
    var avatar: Avatar?
    var username, email, role, loginType: String?
    var isEmailVerified: Bool?
    var createdAt, updatedAt: String?
    var v: Int?
}

// MARK: - Avatar
struct Avatar: Codable {
    var url: String?
    var localPath, id: String?
}

// MARK: - API Call
func registerUser(user: User) async {
    guard let url = URL(string: "https://api.freeapi.app/api/v1/users/login")
    else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    do {
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(user)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid response: \(response)")
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(ResponceData.self, from: data)

        print(
            """
            Registration Status: \(result.success ?? false)
            Message: \(result.message ?? "No message")
            """)
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

// Example User Data
let newUser = User(
    password: "test@123", username: "doejohn"
)

await registerUser(user: newUser)
```

```text
Registration Status: true

Message: User logged in successfully
```

## 9) ItemDelete(DELETE)

```swift
import Foundation

// MARK: - ResponceData
struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
}

// MARK: - DataClass
struct DataClass: Codable {
    var method: String?
    var headers: Headers?
    var origin: String?
    var url: String?
}

// MARK: - Headers
struct Headers: Codable {
    var connection, host, xRealIP, xForwardedFor: String?
    var secChUaPlatform, userAgent, accept, secChUa: String?
    var secChUaMobile, secGpc, acceptLanguage: String?
    var origin: String?
    var secFetchSite, secFetchMode, secFetchDest: String?
    var referer: String?
    var acceptEncoding: String?
}


// MARK: - API Call
func deleteRequest() async {
    guard let url = URL(string: "https://api.freeapi.app/api/v1/kitchen-sink/http-methods/delete")
    else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    do {

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid response: \(response)")
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(ResponceData.self, from: data)

        print(
            """
            Success Status: \(result.success ?? false)
            Message: \(result.message ?? "No message")
            Method: \(result.data?.method ?? "No Method Found" )
            """)
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

// Example User Data
await deleteRequest()

```

```text
Success Status: true

Message: DELETE request

Method: DELETE
```

## 10) (GET)

```swift
import Foundation

// MARK: InsertData
struct InsertData: Codable {
    var description, title: String?
}

// MARK: - ResponceData
struct ResponceData: Codable {
    var statusCode: Int?
    var data: DataClass?
    var message: String?
    var success: Bool?
}

// MARK: - DataClass
struct DataClass: Codable {
    var method: String?
    var headers: Headers?
    var origin: String?
    var url: String?
}

// MARK: - Headers
struct Headers: Codable {
    var connection, host, xRealIP, xForwardedFor: String?
    var secChUaPlatform, userAgent, accept, secChUa: String?
    var secChUaMobile, secGpc, acceptLanguage: String?
    var origin: String?
    var secFetchSite, secFetchMode, secFetchDest: String?
    var referer: String?
    var acceptEncoding: String?
}

// MARK: - API Call
func PatchRequest(_ insrtData: InsertData) async {
    guard
        let url = URL(
            string:
                "https://api.freeapi.app/api/v1/todos/67ad7fc20c0dcbd83eb97dcb"
        )
    else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    do {
        let encodedData = try JSONEncoder().encode(insrtData)
        request.httpBody = encodedData
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            print("Invalid response: \(response)")
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(ResponceData.self, from: data)

        print(
            """
            Success Status: \(result.success ?? false)
            Message: \(result.message ?? "No message")
            Method: \(result.data?.method ?? "No Method Found" )
            """)
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

// Example User Data
let insertTodo = InsertData(
    description: "MY DESCRIPTION", title: "MY TITLE"
)
await PatchRequest(insertTodo)
	
```

```text
Success Status: true

Message: Todo updated successfully

Method: No Method Found
```
