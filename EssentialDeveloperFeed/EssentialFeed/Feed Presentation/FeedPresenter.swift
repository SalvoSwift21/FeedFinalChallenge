//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 21/11/22.
//

public final class FeedPresenter {
   
    public static var title: String {
        NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
}
