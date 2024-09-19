import SwiftUI

struct DayDeal: Identifiable {
    var id = UUID()
    var day: String
    var deals: [String]
    var time: String
    var isSelected: Bool = false
}



struct HappyHourView: View {
    @State private var weekDeals: [DayDeal]
    
    init() {
        let currentDay = Calendar.current.component(.weekday, from: Date())
        let weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let today = weekDays[currentDay - 1] // Adjust for Calendar's 1-based indexing
        
        _weekDeals = State(initialValue: [
            DayDeal(day: "Mon", deals: ["$7 Vodka", "$7 Tequila", "$10 Beer"], time: "4pm - 10pm"),
            DayDeal(day: "Tue", deals: ["$5 Wine", "$8 Whiskey", "$12 Cocktail"], time: "5pm - 9pm"),
            DayDeal(day: "Wed", deals: ["$6 Gin", "$7 Rum", "$9 Lager"], time: "3pm - 11pm"),
            DayDeal(day: "Thu", deals: ["$4 Ale", "$8 Sake", "$11 Martini"], time: "6pm - 10pm"),
            DayDeal(day: "Fri", deals: ["$9 Cider", "$10 Brandy", "$12 Margarita"], time: "4pm - 12am"),
            DayDeal(day: "Sat", deals: ["$5 Stout", "$7 Champagne", "$10 Mojito"], time: "2pm - 2am"),
            DayDeal(day: "Sun", deals: ["$4 Pilsner", "$6 Scotch", "$8 Bourbon"], time: "1pm - 9pm")
        ].map { deal -> DayDeal in
                   var modifiedDeal = deal
                   if deal.day == today {
                       modifiedDeal.isSelected = true
                   }
                   return modifiedDeal
               })
           }
           
           var body: some View {
               VStack {
                   Spacer()
                   HStack(spacing: 10) { // Spacing between day buttons
                       ForEach(weekDeals.indices, id: \.self) { index in
                           Button(action: {
                               weekDeals.indices.forEach { weekDeals[$0].isSelected = false }
                               weekDeals[index].isSelected = true
                           }) {
                               VStack {
                                   Rectangle()
                                       .fill(weekDeals[index].isSelected ? Color.red : Color.clear)
                                       .frame(height: 5)
                                   
                                   Text(weekDeals[index].day)
                                       .fontWeight(.bold)
                                       .foregroundColor(weekDeals[index].isSelected ? Color.red : Color.gray)
                               }
                               .padding([.top, .bottom], 10)
                           }
                       }
                   }
                   .frame(maxWidth: .infinity)
                   
                   if let selectedDayDeal = weekDeals.first(where: { $0.isSelected }) {
                       VStack(alignment: .leading, spacing: 5) { // Aligns text to the left
                           Text(selectedDayDeal.time)
                               .fontWeight(.bold)
                               .font(.title3) // Smaller font size for the time
                               .padding(.leading)
                           
                           ForEach(selectedDayDeal.deals, id: \.self) { deal in
                               HStack {
                                   Image(determineImageName(for: deal))
                                       .resizable()
                                       .frame(width: 30, height: 30) // Adjust size as needed
                                   Text(deal)
                                       .foregroundColor(.black)
                               }
                               .padding(.leading)
                           }
                       }
                   }
                   Spacer()
               }
           }
           
           private func determineImageName(for deal: String) -> String {
               let lowercasedDeal = deal.lowercased()
               if lowercasedDeal.contains("beer") || lowercasedDeal.contains("cider") || lowercasedDeal.contains("ale") || lowercasedDeal.contains("stout") || lowercasedDeal.contains("lager") {
                   return "beer"
               } else if lowercasedDeal.contains("cocktail") || lowercasedDeal.contains("martini") || lowercasedDeal.contains("mojito") || lowercasedDeal.contains("margarita") {
                   return "cocktail"
               } else if lowercasedDeal.contains("wine") || lowercasedDeal.contains("champagne") {
                   return "wine"
               } else {
                   // Assuming any other drink type is considered a spirit and thus uses the "shot" image
                   return "shot"
               }
           }
       }
struct HappyHourView_Previews: PreviewProvider {
    static var previews: some View {
        HappyHourView()
    }
}
