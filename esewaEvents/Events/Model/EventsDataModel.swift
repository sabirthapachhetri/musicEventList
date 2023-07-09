import Foundation
import SwiftyJSON

protocol DataModel {
    init(json: JSON)
}

struct EventsDataModel: DataModel {
    var embedded: Embedded?
    
    init(json: JSON) {
        self.embedded = Embedded(json: json["_embedded"])
    }
}

struct Embedded {
    var events: [Events]?

    init(json: JSON) {
        self.events = json["events"].arrayValue.map { // for array
            Events(json: $0)
        }
    }
}

struct Events {
    var name: String?
    var images: [EventsImages]?
    var dates: Dates?
    var priceRanges: [PriceRanges]?
    var embedded: InnerEmbedded?
    var sales: Sales?
    

    init(json: JSON) {

        self.name = json["name"].string

        self.images = json["images"].arrayValue.map { // for array
            EventsImages(json: $0)
        }

        self.dates = Dates(json: json["dates"])  // for json

        self.priceRanges = json["priceRanges"].arrayValue.map {
            PriceRanges(json: $0)
        }
        
        self.embedded = InnerEmbedded(json: json["_embedded"])
        
        self.sales = Sales(json: json["sales"])        
    }
}

struct EventsImages {
    var ratio: String?
    var url: String?
    var width: Int?
    var height: Int?

    init(json: JSON) {
        self.ratio = json["ratio"].string  // for each properties
        self.url = json["url"].string
        self.width = json["width"].int
        self.height = json["height"].int
    }
}

struct Dates {
    var start: Start?
    init(json: JSON) {
        self.start = Start(json: json["start"])
    }
}

struct Start {
    var localDate: String?
    var localTime: String?
    var dateTime: String?

    init(json: JSON) {
        self.localDate = json["localDate"].string
        self.localTime = json["localTime"].string
        self.dateTime = json["localTime"].string
    }
}

struct PriceRanges {
    var type: String?
    var currency: String?
    var min: Double?
    var max: Double?

    init(json: JSON) {
        self.type = json["type"].string
        self.currency = json["currency"].string
        self.min = json["min"].double
        self.max = json["max"].double
    }
}

struct InnerEmbedded {
    var venues: [Venues]?
    
    init(json: JSON) {
        self.venues = json["venues"].arrayValue.map { // for array
            Venues(json: $0)
    }
  }
}

struct Venues {
    var name: String?
    
    init(json: JSON) {
        self.name = json["name"].string
    }
}


struct Sales {
    var publicSale: PublicSale?
    
    init(json: JSON) {
        self.publicSale = PublicSale(json: json["public"])
    }
}

struct PublicSale {
    var startDateTime: String?
    var endDateTime: String?
    
    init(json: JSON) {
        self.startDateTime = json["startDateTime"].string
        self.endDateTime = json["endDateTime"].string
    }
}
