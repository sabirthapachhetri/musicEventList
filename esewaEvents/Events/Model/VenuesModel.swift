import Foundation
import SwiftyJSON

struct VenuesModel {
    var embeddedVenues: EmbeddedVenues?
    
    init(json: JSON) {
        self.embeddedVenues = EmbeddedVenues(json: json["_embedded"])
    }
}

struct EmbeddedVenues {
    var venues: [VenuesData]?
    
    init(json: JSON) {
        self.venues = json["venues"].arrayValue.map {
            VenuesData(json: $0)
        }
    }
}

struct VenuesData {
    var name: String?
    var images: [Images]?
    var state: State?
    var address: Address?
    var upcomingEvents: UpcomingEvents?
    
    init(json: JSON) {
        self.name = json["name"].string
        self.images = json["images"].arrayValue.map { 
            Images(json: $0)
        }
        self.state = State(json: json["state"])
        self.address = Address(json: json["address"])
        self.upcomingEvents = UpcomingEvents(json: json["upcomingEvents"])
    }
}

struct Images {
    var url: String?
    
    init(json: JSON) {
        self.url = json["url"].string
    }
}

struct State {
    var name: String?
    
    init(json: JSON) {
        self.name = json["name"].string
    }
}

struct Address {
    var line1: String?
    
    init(json: JSON) {
        self.line1 = json["line1"].string
    }
}

struct UpcomingEvents {
    var total: Double?
    
    init(json: JSON) {
        self.total = json["_total"].double
    }
}
