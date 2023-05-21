import Foundation
import SwiftyJSON

struct PerformersModel {
    var embeddedPerformers: EmbeddedPerformers?
    
    init(json: JSON) {
        self.embeddedPerformers = EmbeddedPerformers(json: json["_embedded"])
    }
}

struct EmbeddedPerformers {
    var attractions: [Attractions]?
    
    init(json: JSON) {
        self.attractions = json["attractions"].arrayValue.map {
            Attractions(json: $0)
        }
    }
}

struct Attractions {
    var name: String?
    var performersImages: [PerformersImages]?
    var upcomingEvents: PerformersUpcomingEvents?
    
    init(json: JSON) {
        self.name = json["name"].string
        self.performersImages = json["images"].arrayValue.map {
            PerformersImages(json: $0)
        }
        self.upcomingEvents = PerformersUpcomingEvents(json: json["upcomingEvents"])
    }
}

struct PerformersImages {
    var url: String?
    
    init(json: JSON) {
        self.url = json["url"].string
    }
}

struct PerformersUpcomingEvents {
    var total: Double?
    
    init(json: JSON) {
        self.total = json["_total"].double
    }
}

