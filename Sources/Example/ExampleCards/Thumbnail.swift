import Foundation
import TeamsKit

// https://docs.microsoft.com/en-us/microsoftteams/platform/task-modules-and-cards/cards/cards-reference#example-thumbnail-card
extension ThumbnailCard {
    static func example() -> ThumbnailCard {
        ThumbnailCard(
            title: "Bender",
            subtitle: "tale of a robot who dared to love",
            text: "Bender Bending Rodríguez is a main character in the animated television series Futurama. He was created by series creators Matt Groening and David X. Cohen, and is voiced by John DiMaggio",
            images: [
                .init(
                    url: URL(string: "https://upload.wikimedia.org/wikipedia/en/a/a6/Bender_Rodriguez.png")!,
                    alt: "Bender Rodríguez"
                )
            ],
            buttons: [
                .init(
                    type: .imBack,
                    value: "I like it",
                    title: "Thumbs Up",
                    image: URL(string: "http://moopz.com/assets_c/2012/06/emoji-thumbs-up-150-thumb-autox125-140616.jpg")!
                ),
                .init(
                    type: .imBack,
                    value: "I don't like it",
                    title: "Thumbs Down",
                    image: URL(string: "http://yourfaceisstupid.com/wp-content/uploads/2014/08/thumbs-down.png")!
                ),
                .init(
                    type: .openUrl,
                    value: "https://www.bing.com/images/search?q=bender&qpvt=bender&qpvt=bender&qpvt=bender&FORM=IGRE",
                    title: "I feel lucky",
                    image: URL(string: "http://thumb9.shutterstock.com/photos/thumb_large/683806/148441982.jpg")!
                )
            ],
            tap: .init(type: .imBack, value: "Tapped it!")
        )
    }
}
