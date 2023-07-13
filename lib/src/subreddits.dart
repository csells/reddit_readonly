import 'dart:convert';

class Subreddits {
  final String? after;
  final List<Post>? posts;

  Subreddits({
    this.after,
    this.posts,
  });

  factory Subreddits.fromJson(String str) =>
      Subreddits.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subreddits.fromMap(Map<String, dynamic> json) => Subreddits(
        after: json["after"],
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "after": after,
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toMap())),
      };
}

class Post {
  final Kind? kind;
  final Data? data;

  Post({
    this.kind,
    this.data,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        kind: kindValues.map[json["kind"]],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kindValues.reverse[kind],
        "data": data?.toMap(),
      };
}

class Data {
  final dynamic userFlairBackgroundColor;
  final String? submitTextHtml;
  final bool? restrictPosting;
  final dynamic userIsBanned;
  final bool? freeFormReports;
  final bool? wikiEnabled;
  final dynamic userIsMuted;
  final dynamic userCanFlairInSr;
  final String? displayName;
  final String? headerImg;
  final String? title;
  final bool? allowGalleries;
  final List<int>? iconSize;
  final String? primaryColor;
  final dynamic activeUserCount;
  final String? iconImg;
  final String? displayNamePrefixed;
  final dynamic accountsActive;
  final bool? publicTraffic;
  final int? subscribers;
  final List<dynamic>? userFlairRichtext;
  final String? name;
  final bool? quarantine;
  final bool? hideAds;
  final PredictionLeaderboardEntryType? predictionLeaderboardEntryType;
  final bool? emojisEnabled;
  final String? advertiserCategory;
  final String? publicDescription;
  final int? commentScoreHideMins;
  final bool? allowPredictions;
  final dynamic userHasFavorited;
  final dynamic userFlairTemplateId;
  final String? communityIcon;
  final String? bannerBackgroundImage;
  final bool? originalContentTagEnabled;
  final bool? communityReviewed;
  final String? submitText;
  final String? descriptionHtml;
  final bool? spoilersEnabled;
  final CommentContributionSettings? commentContributionSettings;
  final bool? allowTalks;
  final List<int>? headerSize;
  final FlairPosition? userFlairPosition;
  final bool? allOriginalContent;
  final bool? hasMenuWidget;
  final dynamic isEnrolledInNewModmail;
  final String? keyColor;
  final bool? canAssignUserFlair;
  final double? created;
  final int? wls;
  final bool? showMediaPreview;
  final SubmissionType? submissionType;
  final dynamic userIsSubscriber;
  final List<AllowedMedia>? allowedMediaInComments;
  final bool? allowVideogifs;
  final bool? shouldArchivePosts;
  final UserFlairType? userFlairType;
  final bool? allowPolls;
  final bool? collapseDeletedComments;
  final List<int>? emojisCustomSize;
  final String? publicDescriptionHtml;
  final bool? allowVideos;
  final bool? isCrosspostableSubreddit;
  final String? suggestedCommentSort;
  final bool? shouldShowMediaInCommentsSetting;
  final bool? canAssignLinkFlair;
  final bool? accountsActiveIsFuzzed;
  final bool? allowPredictionContributors;
  final String? submitTextLabel;
  final FlairPosition? linkFlairPosition;
  final dynamic userSrFlairEnabled;
  final bool? userFlairEnabledInSr;
  final bool? allowChatPostCreation;
  final bool? allowDiscovery;
  final bool? acceptFollowers;
  final bool? userSrThemeEnabled;
  final bool? linkFlairEnabled;
  final bool? disableContributorRequests;
  final SubredditType? subredditType;
  final dynamic notificationLevel;
  final String? bannerImg;
  final dynamic userFlairText;
  final String? bannerBackgroundColor;
  final bool? showMedia;
  final String? id;
  final dynamic userIsContributor;
  final bool? over18;
  final String? headerTitle;
  final String? description;
  final bool? isChatPostFeatureEnabled;
  final String? submitLinkLabel;
  final dynamic userFlairTextColor;
  final bool? restrictCommenting;
  final dynamic userFlairCssClass;
  final bool? allowImages;
  final Lang? lang;
  final WhitelistStatus? whitelistStatus;
  final String? url;
  final double? createdUtc;
  final List<int>? bannerSize;
  final String? mobileBannerImage;
  final dynamic userIsModerator;
  final bool? allowPredictionsTournament;
  final int? videostreamLinksCount;
  final String? contentCategory;

  Data({
    this.userFlairBackgroundColor,
    this.submitTextHtml,
    this.restrictPosting,
    this.userIsBanned,
    this.freeFormReports,
    this.wikiEnabled,
    this.userIsMuted,
    this.userCanFlairInSr,
    this.displayName,
    this.headerImg,
    this.title,
    this.allowGalleries,
    this.iconSize,
    this.primaryColor,
    this.activeUserCount,
    this.iconImg,
    this.displayNamePrefixed,
    this.accountsActive,
    this.publicTraffic,
    this.subscribers,
    this.userFlairRichtext,
    this.name,
    this.quarantine,
    this.hideAds,
    this.predictionLeaderboardEntryType,
    this.emojisEnabled,
    this.advertiserCategory,
    this.publicDescription,
    this.commentScoreHideMins,
    this.allowPredictions,
    this.userHasFavorited,
    this.userFlairTemplateId,
    this.communityIcon,
    this.bannerBackgroundImage,
    this.originalContentTagEnabled,
    this.communityReviewed,
    this.submitText,
    this.descriptionHtml,
    this.spoilersEnabled,
    this.commentContributionSettings,
    this.allowTalks,
    this.headerSize,
    this.userFlairPosition,
    this.allOriginalContent,
    this.hasMenuWidget,
    this.isEnrolledInNewModmail,
    this.keyColor,
    this.canAssignUserFlair,
    this.created,
    this.wls,
    this.showMediaPreview,
    this.submissionType,
    this.userIsSubscriber,
    this.allowedMediaInComments,
    this.allowVideogifs,
    this.shouldArchivePosts,
    this.userFlairType,
    this.allowPolls,
    this.collapseDeletedComments,
    this.emojisCustomSize,
    this.publicDescriptionHtml,
    this.allowVideos,
    this.isCrosspostableSubreddit,
    this.suggestedCommentSort,
    this.shouldShowMediaInCommentsSetting,
    this.canAssignLinkFlair,
    this.accountsActiveIsFuzzed,
    this.allowPredictionContributors,
    this.submitTextLabel,
    this.linkFlairPosition,
    this.userSrFlairEnabled,
    this.userFlairEnabledInSr,
    this.allowChatPostCreation,
    this.allowDiscovery,
    this.acceptFollowers,
    this.userSrThemeEnabled,
    this.linkFlairEnabled,
    this.disableContributorRequests,
    this.subredditType,
    this.notificationLevel,
    this.bannerImg,
    this.userFlairText,
    this.bannerBackgroundColor,
    this.showMedia,
    this.id,
    this.userIsContributor,
    this.over18,
    this.headerTitle,
    this.description,
    this.isChatPostFeatureEnabled,
    this.submitLinkLabel,
    this.userFlairTextColor,
    this.restrictCommenting,
    this.userFlairCssClass,
    this.allowImages,
    this.lang,
    this.whitelistStatus,
    this.url,
    this.createdUtc,
    this.bannerSize,
    this.mobileBannerImage,
    this.userIsModerator,
    this.allowPredictionsTournament,
    this.videostreamLinksCount,
    this.contentCategory,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userFlairBackgroundColor: json["user_flair_background_color"],
        submitTextHtml: json["submit_text_html"],
        restrictPosting: json["restrict_posting"],
        userIsBanned: json["user_is_banned"],
        freeFormReports: json["free_form_reports"],
        wikiEnabled: json["wiki_enabled"],
        userIsMuted: json["user_is_muted"],
        userCanFlairInSr: json["user_can_flair_in_sr"],
        displayName: json["display_name"],
        headerImg: json["header_img"],
        title: json["title"],
        allowGalleries: json["allow_galleries"],
        iconSize: json["icon_size"] == null
            ? []
            : List<int>.from(json["icon_size"]!.map((x) => x)),
        primaryColor: json["primary_color"],
        activeUserCount: json["active_user_count"],
        iconImg: json["icon_img"],
        displayNamePrefixed: json["display_name_prefixed"],
        accountsActive: json["accounts_active"],
        publicTraffic: json["public_traffic"],
        subscribers: json["subscribers"],
        userFlairRichtext: json["user_flair_richtext"] == null
            ? []
            : List<dynamic>.from(json["user_flair_richtext"]!.map((x) => x)),
        name: json["name"],
        quarantine: json["quarantine"],
        hideAds: json["hide_ads"],
        predictionLeaderboardEntryType: predictionLeaderboardEntryTypeValues
            .map[json["prediction_leaderboard_entry_type"]],
        emojisEnabled: json["emojis_enabled"],
        advertiserCategory: json["advertiser_category"],
        publicDescription: json["public_description"],
        commentScoreHideMins: json["comment_score_hide_mins"],
        allowPredictions: json["allow_predictions"],
        userHasFavorited: json["user_has_favorited"],
        userFlairTemplateId: json["user_flair_template_id"],
        communityIcon: json["community_icon"],
        bannerBackgroundImage: json["banner_background_image"],
        originalContentTagEnabled: json["original_content_tag_enabled"],
        communityReviewed: json["community_reviewed"],
        submitText: json["submit_text"],
        descriptionHtml: json["description_html"],
        spoilersEnabled: json["spoilers_enabled"],
        commentContributionSettings:
            json["comment_contribution_settings"] == null
                ? null
                : CommentContributionSettings.fromMap(
                    json["comment_contribution_settings"]),
        allowTalks: json["allow_talks"],
        headerSize: json["header_size"] == null
            ? []
            : List<int>.from(json["header_size"]!.map((x) => x)),
        userFlairPosition: flairPositionValues.map[json["user_flair_position"]],
        allOriginalContent: json["all_original_content"],
        hasMenuWidget: json["has_menu_widget"],
        isEnrolledInNewModmail: json["is_enrolled_in_new_modmail"],
        keyColor: json["key_color"],
        canAssignUserFlair: json["can_assign_user_flair"],
        created: json["created"],
        wls: json["wls"],
        showMediaPreview: json["show_media_preview"],
        submissionType: submissionTypeValues.map[json["submission_type"]],
        userIsSubscriber: json["user_is_subscriber"],
        allowedMediaInComments: json["allowed_media_in_comments"] == null
            ? []
            : List<AllowedMedia>.from(json["allowed_media_in_comments"]!
                .map((x) => allowedMediaValues.map[x]!)),
        allowVideogifs: json["allow_videogifs"],
        shouldArchivePosts: json["should_archive_posts"],
        userFlairType: userFlairTypeValues.map[json["user_flair_type"]],
        allowPolls: json["allow_polls"],
        collapseDeletedComments: json["collapse_deleted_comments"],
        emojisCustomSize: json["emojis_custom_size"] == null
            ? []
            : List<int>.from(json["emojis_custom_size"]!.map((x) => x)),
        publicDescriptionHtml: json["public_description_html"],
        allowVideos: json["allow_videos"],
        isCrosspostableSubreddit: json["is_crosspostable_subreddit"],
        suggestedCommentSort: json["suggested_comment_sort"],
        shouldShowMediaInCommentsSetting:
            json["should_show_media_in_comments_setting"],
        canAssignLinkFlair: json["can_assign_link_flair"],
        accountsActiveIsFuzzed: json["accounts_active_is_fuzzed"],
        allowPredictionContributors: json["allow_prediction_contributors"],
        submitTextLabel: json["submit_text_label"],
        linkFlairPosition: flairPositionValues.map[json["link_flair_position"]],
        userSrFlairEnabled: json["user_sr_flair_enabled"],
        userFlairEnabledInSr: json["user_flair_enabled_in_sr"],
        allowChatPostCreation: json["allow_chat_post_creation"],
        allowDiscovery: json["allow_discovery"],
        acceptFollowers: json["accept_followers"],
        userSrThemeEnabled: json["user_sr_theme_enabled"],
        linkFlairEnabled: json["link_flair_enabled"],
        disableContributorRequests: json["disable_contributor_requests"],
        subredditType: subredditTypeValues.map[json["subreddit_type"]],
        notificationLevel: json["notification_level"],
        bannerImg: json["banner_img"],
        userFlairText: json["user_flair_text"],
        bannerBackgroundColor: json["banner_background_color"],
        showMedia: json["show_media"],
        id: json["id"],
        userIsContributor: json["user_is_contributor"],
        over18: json["over18"],
        headerTitle: json["header_title"],
        description: json["description"],
        isChatPostFeatureEnabled: json["is_chat_post_feature_enabled"],
        submitLinkLabel: json["submit_link_label"],
        userFlairTextColor: json["user_flair_text_color"],
        restrictCommenting: json["restrict_commenting"],
        userFlairCssClass: json["user_flair_css_class"],
        allowImages: json["allow_images"],
        lang: langValues.map[json["lang"]],
        whitelistStatus: whitelistStatusValues.map[json["whitelist_status"]],
        url: json["url"],
        createdUtc: json["created_utc"],
        bannerSize: json["banner_size"] == null
            ? []
            : List<int>.from(json["banner_size"]!.map((x) => x)),
        mobileBannerImage: json["mobile_banner_image"],
        userIsModerator: json["user_is_moderator"],
        allowPredictionsTournament: json["allow_predictions_tournament"],
        videostreamLinksCount: json["videostream_links_count"],
        contentCategory: json["content_category"],
      );

  Map<String, dynamic> toMap() => {
        "user_flair_background_color": userFlairBackgroundColor,
        "submit_text_html": submitTextHtml,
        "restrict_posting": restrictPosting,
        "user_is_banned": userIsBanned,
        "free_form_reports": freeFormReports,
        "wiki_enabled": wikiEnabled,
        "user_is_muted": userIsMuted,
        "user_can_flair_in_sr": userCanFlairInSr,
        "display_name": displayName,
        "header_img": headerImg,
        "title": title,
        "allow_galleries": allowGalleries,
        "icon_size":
            iconSize == null ? [] : List<dynamic>.from(iconSize!.map((x) => x)),
        "primary_color": primaryColor,
        "active_user_count": activeUserCount,
        "icon_img": iconImg,
        "display_name_prefixed": displayNamePrefixed,
        "accounts_active": accountsActive,
        "public_traffic": publicTraffic,
        "subscribers": subscribers,
        "user_flair_richtext": userFlairRichtext == null
            ? []
            : List<dynamic>.from(userFlairRichtext!.map((x) => x)),
        "name": name,
        "quarantine": quarantine,
        "hide_ads": hideAds,
        "prediction_leaderboard_entry_type":
            predictionLeaderboardEntryTypeValues
                .reverse[predictionLeaderboardEntryType],
        "emojis_enabled": emojisEnabled,
        "advertiser_category": advertiserCategory,
        "public_description": publicDescription,
        "comment_score_hide_mins": commentScoreHideMins,
        "allow_predictions": allowPredictions,
        "user_has_favorited": userHasFavorited,
        "user_flair_template_id": userFlairTemplateId,
        "community_icon": communityIcon,
        "banner_background_image": bannerBackgroundImage,
        "original_content_tag_enabled": originalContentTagEnabled,
        "community_reviewed": communityReviewed,
        "submit_text": submitText,
        "description_html": descriptionHtml,
        "spoilers_enabled": spoilersEnabled,
        "comment_contribution_settings": commentContributionSettings?.toMap(),
        "allow_talks": allowTalks,
        "header_size": headerSize == null
            ? []
            : List<dynamic>.from(headerSize!.map((x) => x)),
        "user_flair_position": flairPositionValues.reverse[userFlairPosition],
        "all_original_content": allOriginalContent,
        "has_menu_widget": hasMenuWidget,
        "is_enrolled_in_new_modmail": isEnrolledInNewModmail,
        "key_color": keyColor,
        "can_assign_user_flair": canAssignUserFlair,
        "created": created,
        "wls": wls,
        "show_media_preview": showMediaPreview,
        "submission_type": submissionTypeValues.reverse[submissionType],
        "user_is_subscriber": userIsSubscriber,
        "allowed_media_in_comments": allowedMediaInComments == null
            ? []
            : List<dynamic>.from(allowedMediaInComments!
                .map((x) => allowedMediaValues.reverse[x])),
        "allow_videogifs": allowVideogifs,
        "should_archive_posts": shouldArchivePosts,
        "user_flair_type": userFlairTypeValues.reverse[userFlairType],
        "allow_polls": allowPolls,
        "collapse_deleted_comments": collapseDeletedComments,
        "emojis_custom_size": emojisCustomSize == null
            ? []
            : List<dynamic>.from(emojisCustomSize!.map((x) => x)),
        "public_description_html": publicDescriptionHtml,
        "allow_videos": allowVideos,
        "is_crosspostable_subreddit": isCrosspostableSubreddit,
        "suggested_comment_sort": suggestedCommentSort,
        "should_show_media_in_comments_setting":
            shouldShowMediaInCommentsSetting,
        "can_assign_link_flair": canAssignLinkFlair,
        "accounts_active_is_fuzzed": accountsActiveIsFuzzed,
        "allow_prediction_contributors": allowPredictionContributors,
        "submit_text_label": submitTextLabel,
        "link_flair_position": flairPositionValues.reverse[linkFlairPosition],
        "user_sr_flair_enabled": userSrFlairEnabled,
        "user_flair_enabled_in_sr": userFlairEnabledInSr,
        "allow_chat_post_creation": allowChatPostCreation,
        "allow_discovery": allowDiscovery,
        "accept_followers": acceptFollowers,
        "user_sr_theme_enabled": userSrThemeEnabled,
        "link_flair_enabled": linkFlairEnabled,
        "disable_contributor_requests": disableContributorRequests,
        "subreddit_type": subredditTypeValues.reverse[subredditType],
        "notification_level": notificationLevel,
        "banner_img": bannerImg,
        "user_flair_text": userFlairText,
        "banner_background_color": bannerBackgroundColor,
        "show_media": showMedia,
        "id": id,
        "user_is_contributor": userIsContributor,
        "over18": over18,
        "header_title": headerTitle,
        "description": description,
        "is_chat_post_feature_enabled": isChatPostFeatureEnabled,
        "submit_link_label": submitLinkLabel,
        "user_flair_text_color": userFlairTextColor,
        "restrict_commenting": restrictCommenting,
        "user_flair_css_class": userFlairCssClass,
        "allow_images": allowImages,
        "lang": langValues.reverse[lang],
        "whitelist_status": whitelistStatusValues.reverse[whitelistStatus],
        "url": url,
        "created_utc": createdUtc,
        "banner_size": bannerSize == null
            ? []
            : List<dynamic>.from(bannerSize!.map((x) => x)),
        "mobile_banner_image": mobileBannerImage,
        "user_is_moderator": userIsModerator,
        "allow_predictions_tournament": allowPredictionsTournament,
        "videostream_links_count": videostreamLinksCount,
        "content_category": contentCategory,
      };
}

enum AllowedMedia { expression, giphy, static, animated }

final allowedMediaValues = EnumValues({
  "animated": AllowedMedia.animated,
  "expression": AllowedMedia.expression,
  "giphy": AllowedMedia.giphy,
  "static": AllowedMedia.static
});

class CommentContributionSettings {
  final List<AllowedMedia>? allowedMediaTypes;

  CommentContributionSettings({
    this.allowedMediaTypes,
  });

  factory CommentContributionSettings.fromJson(String str) =>
      CommentContributionSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentContributionSettings.fromMap(Map<String, dynamic> json) =>
      CommentContributionSettings(
        allowedMediaTypes: json["allowed_media_types"] == null
            ? []
            : List<AllowedMedia>.from(json["allowed_media_types"]!
                .map((x) => allowedMediaValues.map[x]!)),
      );

  Map<String, dynamic> toMap() => {
        "allowed_media_types": allowedMediaTypes == null
            ? []
            : List<dynamic>.from(
                allowedMediaTypes!.map((x) => allowedMediaValues.reverse[x])),
      };
}

enum Lang { en, es }

final langValues = EnumValues({"en": Lang.en, "es": Lang.es});

enum FlairPosition { right, left }

final flairPositionValues =
    EnumValues({"left": FlairPosition.left, "right": FlairPosition.right});

enum PredictionLeaderboardEntryType { subredditHeader, inFeed }

final predictionLeaderboardEntryTypeValues = EnumValues({
  "IN_FEED": PredictionLeaderboardEntryType.inFeed,
  "SUBREDDIT_HEADER": PredictionLeaderboardEntryType.subredditHeader
});

enum SubmissionType { link, any, self }

final submissionTypeValues = EnumValues({
  "any": SubmissionType.any,
  "link": SubmissionType.link,
  "self": SubmissionType.self
});

enum SubredditType { public, restricted, archived }

final subredditTypeValues = EnumValues({
  "archived": SubredditType.archived,
  "public": SubredditType.public,
  "restricted": SubredditType.restricted
});

enum UserFlairType { text }

final userFlairTypeValues = EnumValues({"text": UserFlairType.text});

enum WhitelistStatus { allAds }

final whitelistStatusValues = EnumValues({"all_ads": WhitelistStatus.allAds});

enum Kind { t5 }

final kindValues = EnumValues({"t5": Kind.t5});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
