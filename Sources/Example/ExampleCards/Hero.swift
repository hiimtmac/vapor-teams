import Foundation
import TeamsKit

// https://docs.microsoft.com/en-us/microsoftteams/platform/task-modules-and-cards/cards/cards-reference#hero-card
extension HeroCard {
    static func example() -> HeroCard {
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Seattle_monorail01_2008-02-25.jpg/1024px-Seattle_monorail01_2008-02-25.jpg")!
        return HeroCard(
            image: .init(url: url),
            title: "Seattle Center Monorail",
            subtitle: "Seattle Center Monorail",
            text: "The Seattle Center Monorail is an elevated train line between Seattle Center (near the Space Needle) and downtown Seattle. It was built for the 1962 World's Fair. Its original two trains, completed in 1961, are still in service.",
            buttons: [
                .init(
                    type: .openUrl,
                    value: "https://www.seattlemonorail.com",
                    title: "Official website"
                ),
                .init(
                    type: .openUrl,
                    value: "https://en.wikipedia.org/wiki/Seattle_Center_Monorail",
                    title: "Wikipeda page"
                )
            ],
            tap: nil
        )
    }
}
