import Foundation
import TeamsKit

// https://docs.microsoft.com/en-us/microsoftteams/platform/task-modules-and-cards/cards/cards-reference#example-office-365-connector-card
extension O365ConnectorCard {
    static func example() -> O365ConnectorCard {
        O365ConnectorCard(
            correlationId: nil,
            expectedActors: nil,
            originator: nil,
            summary: "John Doe commented on Trello",
            themeColor: nil,
            hideOriginalBody: nil,
            title: "Project Tango",
            text: nil,
            sections: [
                .init(
                    activityImage: URL(string: "http://connectorsdemo.azurewebsites.net/images/MSC12_Oscar_002.jpg"),
                    activityTitle: "John Doe commented",
                    activitySubtitle: "On Project Tango",
                    activityText: "\"Here are the designs\""
                ),
                .init(
                    title: "Details",
                    facts: [
                        .init(name: "Labels", value: "Designs, redlines"),
                        .init(name: "Due date", value: "Dec 7, 2016"),
                        .init(name: "Attachments", value: "[final.jpg](http://connectorsdemo.azurewebsites.net/images/WIN14_Jan_04.jpg)")
                    ]
                ),
                .init(
                    title: "Images",
                    images: [
                        .init(image: URL(string: "http://connectorsdemo.azurewebsites.net/images/MicrosoftSurface_024_Cafe_OH-06315_VS_R1c.jpg")!),
                        .init(image: URL(string: "http://connectorsdemo.azurewebsites.net/images/WIN12_Scene_01.jpg")!),
                        .init(image: URL(string: "http://connectorsdemo.azurewebsites.net/images/WIN12_Anthony_02.jpg")!)
                    ]
                )
            ],
            potentialAction: [
                .view(
                    name: "View in Trello",
                    target: [URL(string: "https://trello.com/c/1101/")!]
                )
            ])
    }
}
