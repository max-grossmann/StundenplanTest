import Foundation
import FoundationNetworking
import OpenCombine
import OpenCombineDispatch
import OpenCombineFoundation

let x = Just(1)

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Response: Codable {
    let version: Double
    let schedule: [Event]
}

struct Event: Codable {
    let label: String
    let docent: String
}


let url = URL(string: "https://app.hof-university.de/soap/client.php?f=Schedule&stg=Mc&sem=5&tt=WS")
var request = URLRequest(url: url!)

let passInfo = "soapuser:F%98z&12"
let passData = passInfo.data(using: .utf8)
let passCredential = passData?.base64EncodedString()
request.setValue("Basic \(passCredential!)", forHTTPHeaderField: "Authorization")

let publisher2 = URLSession.shared.dataTaskPublisher(for: request)
        .map {
            $0.data
        }
        .decode(type: Response.self, decoder: JSONDecoder())
        .replaceError(with: Response(version: -1, schedule: []))
        .eraseToAnyPublisher()

var cancellable: AnyCancellable = publisher2
        .sink(receiveCompletion: { _ in

    print("end")
}, receiveValue: { (response: Response) in

    for item in response.schedule {
        print("Item: \(item.docent)")
    }
})

sleep(4)