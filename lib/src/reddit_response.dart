import 'dart:convert';

class RedditResponse {
  final String? after;
  final List<Post>? posts;

  RedditResponse({
    this.after,
    this.posts,
  });

  factory RedditResponse.fromJson(String str) =>
      RedditResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedditResponse.fromMap(Map<String, dynamic> json) => RedditResponse(
        after: json["after"],
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        if (after != null) "after": after,
        if (posts != null)
          "posts": List<dynamic>.from(posts!.map((x) => x.toMap())),
      };

  static final pp = JsonEncoder.withIndent('  ');

  @override
  String toString() => pp.convert(toMap());
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
        if (data != null) "data": data?.toMap(),
      };
}

class Data {
  final dynamic approvedAtUtc;
  final String? subreddit;
  final String? selftext;
  final String? authorFullname;
  final bool? saved;
  final dynamic modReasonTitle;
  final int? gilded;
  final bool? clicked;
  final String? title;
  final List<FlairRichtext>? linkFlairRichtext;
  final String? subredditNamePrefixed;
  final bool? hidden;
  final int? pwls;
  final String? linkFlairCssClass;
  final int? downs;
  final int? thumbnailHeight;
  final String? topAwardedType;
  final bool? hideScore;
  final String? name;
  final bool? quarantine;
  final FlairTextColor? linkFlairTextColor;
  final double? upvoteRatio;
  final String? authorFlairBackgroundColor;
  final SubredditType? subredditType;
  final int? ups;
  final int? totalAwardsReceived;
  final MediaEmbed? mediaEmbed;
  final int? thumbnailWidth;
  final String? authorFlairTemplateId;
  final bool? isOriginalContent;
  final List<dynamic>? userReports;
  final Media? secureMedia;
  final bool? isRedditMediaDomain;
  final bool? isMeta;
  final dynamic category;
  final MediaEmbed? secureMediaEmbed;
  final String? linkFlairText;
  final bool? canModPost;
  final int? score;
  final dynamic approvedBy;
  final bool? isCreatedFromAdsUi;
  final bool? authorPremium;
  final String? thumbnail;
  final bool? authorCakeday;
  final dynamic edited;
  final dynamic authorFlairCssClass;
  final List<FlairRichtext>? authorFlairRichtext;
  final Gildings? gildings;
  final dynamic contentCategories;
  final bool? isSelf;
  final dynamic modNote;
  final double? created;
  final FlairType? linkFlairType;
  final int? wls;
  final dynamic removedByCategory;
  final dynamic bannedBy;
  final FlairType? authorFlairType;
  final String? domain;
  final bool? allowLiveComments;
  final String? selftextHtml;
  final dynamic likes;
  final String? suggestedSort;
  final dynamic bannedAtUtc;
  final dynamic viewCount;
  final bool? archived;
  final bool? noFollow;
  final bool? isCrosspostable;
  final bool? pinned;
  final bool? over18;
  final List<AllAwarding>? allAwardings;
  final List<dynamic>? awarders;
  final bool? mediaOnly;
  final bool? canGild;
  final bool? spoiler;
  final bool? locked;
  final String? authorFlairText;
  final List<dynamic>? treatmentTags;
  final bool? visited;
  final dynamic removedBy;
  final dynamic numReports;
  final String? distinguished;
  final String? subredditId;
  final bool? authorIsBlocked;
  final dynamic modReasonBy;
  final dynamic removalReason;
  final String? linkFlairBackgroundColor;
  final String? id;
  final bool? isRobotIndexable;
  final dynamic reportReasons;
  final String? author;
  final dynamic discussionType;
  final int? numComments;
  final bool? sendReplies;
  final WhitelistStatus? whitelistStatus;
  final bool? contestMode;
  final List<dynamic>? modReports;
  final bool? authorPatreonFlair;
  final FlairTextColor? authorFlairTextColor;
  final String? permalink;
  final WhitelistStatus? parentWhitelistStatus;
  final bool? stickied;
  final String? url;
  final int? subredditSubscribers;
  final double? createdUtc;
  final int? numCrossposts;
  final Media? media;
  final bool? isVideo;
  final PostHint? postHint;
  final String? urlOverriddenByDest;
  final Preview? preview;
  final String? linkFlairTemplateId;
  final bool? isGallery;
  final Map<String, MediaMetadatum>? mediaMetadata;
  final GalleryData? galleryData;

  Data({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.authorCakeday,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.authorIsBlocked,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
    this.postHint,
    this.urlOverriddenByDest,
    this.preview,
    this.linkFlairTemplateId,
    this.isGallery,
    this.mediaMetadata,
    this.galleryData,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairRichtext: json["link_flair_richtext"] == null
            ? []
            : List<FlairRichtext>.from(json["link_flair_richtext"]!
                .map((x) => FlairRichtext.fromMap(x))),
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"],
        topAwardedType: json["top_awarded_type"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor:
            flairTextColorValues.map[json["link_flair_text_color"]],
        upvoteRatio: json["upvote_ratio"]?.toDouble(),
        authorFlairBackgroundColor: json["author_flair_background_color"],
        subredditType: subredditTypeValues.map[json["subreddit_type"]],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: json["media_embed"] == null
            ? null
            : MediaEmbed.fromMap(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: json["user_reports"] == null
            ? []
            : List<dynamic>.from(json["user_reports"]!.map((x) => x)),
        secureMedia: json["secure_media"] == null
            ? null
            : Media.fromMap(json["secure_media"]),
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: json["secure_media_embed"] == null
            ? null
            : MediaEmbed.fromMap(json["secure_media_embed"]),
        linkFlairText: json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        authorCakeday: json["author_cakeday"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"],
        authorFlairRichtext: json["author_flair_richtext"] == null
            ? []
            : List<FlairRichtext>.from(json["author_flair_richtext"]!
                .map((x) => FlairRichtext.fromMap(x))),
        gildings: json["gildings"] == null
            ? null
            : Gildings.fromMap(json["gildings"]),
        contentCategories: json["content_categories"],
        isSelf: json["is_self"],
        modNote: json["mod_note"],
        created: json["created"],
        linkFlairType: flairTypeValues.map[json["link_flair_type"]],
        wls: json["wls"],
        removedByCategory: json["removed_by_category"],
        bannedBy: json["banned_by"],
        authorFlairType: flairTypeValues.map[json["author_flair_type"]],
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml: json["selftext_html"],
        likes: json["likes"],
        suggestedSort: json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        allAwardings: json["all_awardings"] == null
            ? []
            : List<AllAwarding>.from(
                json["all_awardings"]!.map((x) => AllAwarding.fromMap(x))),
        awarders: json["awarders"] == null
            ? []
            : List<dynamic>.from(json["awarders"]!.map((x) => x)),
        mediaOnly: json["media_only"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"],
        treatmentTags: json["treatment_tags"] == null
            ? []
            : List<dynamic>.from(json["treatment_tags"]!.map((x) => x)),
        visited: json["visited"],
        removedBy: json["removed_by"],
        numReports: json["num_reports"],
        distinguished: json["distinguished"],
        subredditId: json["subreddit_id"],
        authorIsBlocked: json["author_is_blocked"],
        modReasonBy: json["mod_reason_by"],
        removalReason: json["removal_reason"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        discussionType: json["discussion_type"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: whitelistStatusValues.map[json["whitelist_status"]],
        contestMode: json["contest_mode"],
        modReports: json["mod_reports"] == null
            ? []
            : List<dynamic>.from(json["mod_reports"]!.map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor:
            flairTextColorValues.map[json["author_flair_text_color"]],
        permalink: json["permalink"],
        parentWhitelistStatus:
            whitelistStatusValues.map[json["parent_whitelist_status"]],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"] == null ? null : Media.fromMap(json["media"]),
        isVideo: json["is_video"],
        postHint: postHintValues.map[json["post_hint"]],
        urlOverriddenByDest: json["url_overridden_by_dest"],
        preview:
            json["preview"] == null ? null : Preview.fromMap(json["preview"]),
        linkFlairTemplateId: json["link_flair_template_id"],
        isGallery: json["is_gallery"],
        mediaMetadata: Map.from(json["media_metadata"] ?? {}).map((k, v) =>
            MapEntry<String, MediaMetadatum>(k, MediaMetadatum.fromMap(v))),
        galleryData: json["gallery_data"] == null
            ? null
            : GalleryData.fromMap(json["gallery_data"]),
      );

  Map<String, dynamic> toMap() => {
        if (approvedAtUtc != null) "approved_at_utc": approvedAtUtc,
        if (subreddit != null) "subreddit": subreddit,
        if (selftext != null) "selftext": selftext,
        if (authorFullname != null) "author_fullname": authorFullname,
        if (saved != null) "saved": saved,
        if (modReasonTitle != null) "mod_reason_title": modReasonTitle,
        if (gilded != null) "gilded": gilded,
        if (clicked != null) "clicked": clicked,
        if (title != null) "title": title,
        if (linkFlairRichtext != null)
          "link_flair_richtext":
              linkFlairRichtext!.map((x) => x.toMap()).toList(),
        "subreddit_name_prefixed": subredditNamePrefixed,
        "hidden": hidden,
        "pwls": pwls,
        "link_flair_css_class": linkFlairCssClass,
        "downs": downs,
        "thumbnail_height": thumbnailHeight,
        "top_awarded_type": topAwardedType,
        "hide_score": hideScore,
        "name": name,
        "quarantine": quarantine,
        "link_flair_text_color":
            flairTextColorValues.reverse[linkFlairTextColor],
        "upvote_ratio": upvoteRatio,
        "author_flair_background_color": authorFlairBackgroundColor,
        "subreddit_type": subredditTypeValues.reverse[subredditType],
        "ups": ups,
        "total_awards_received": totalAwardsReceived,
        "media_embed": mediaEmbed?.toMap(),
        "thumbnail_width": thumbnailWidth,
        "author_flair_template_id": authorFlairTemplateId,
        "is_original_content": isOriginalContent,
        "user_reports": userReports == null
            ? []
            : List<dynamic>.from(userReports!.map((x) => x)),
        "secure_media": secureMedia?.toMap(),
        "is_reddit_media_domain": isRedditMediaDomain,
        "is_meta": isMeta,
        "category": category,
        "secure_media_embed": secureMediaEmbed?.toMap(),
        "link_flair_text": linkFlairText,
        "can_mod_post": canModPost,
        "score": score,
        "approved_by": approvedBy,
        "is_created_from_ads_ui": isCreatedFromAdsUi,
        "author_premium": authorPremium,
        if (thumbnail != null) "thumbnail": thumbnail,
        if (authorCakeday != null) "author_cakeday": authorCakeday,
        if (edited != null) "edited": edited,
        "author_flair_css_class": authorFlairCssClass,
        "author_flair_richtext": authorFlairRichtext == null
            ? []
            : List<dynamic>.from(authorFlairRichtext!.map((x) => x.toMap())),
        "gildings": gildings?.toMap(),
        "content_categories": contentCategories,
        "is_self": isSelf,
        "mod_note": modNote,
        "created": created,
        "link_flair_type": flairTypeValues.reverse[linkFlairType],
        "wls": wls,
        "removed_by_category": removedByCategory,
        "banned_by": bannedBy,
        "author_flair_type": flairTypeValues.reverse[authorFlairType],
        "domain": domain,
        "allow_live_comments": allowLiveComments,
        "selftext_html": selftextHtml,
        "likes": likes,
        "suggested_sort": suggestedSort,
        "banned_at_utc": bannedAtUtc,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "all_awardings": allAwardings == null
            ? []
            : List<dynamic>.from(allAwardings!.map((x) => x.toMap())),
        "awarders":
            awarders == null ? [] : List<dynamic>.from(awarders!.map((x) => x)),
        "media_only": mediaOnly,
        "can_gild": canGild,
        "spoiler": spoiler,
        "locked": locked,
        "author_flair_text": authorFlairText,
        "treatment_tags": treatmentTags == null
            ? []
            : List<dynamic>.from(treatmentTags!.map((x) => x)),
        "visited": visited,
        "removed_by": removedBy,
        "num_reports": numReports,
        "distinguished": distinguished,
        "subreddit_id": subredditId,
        "author_is_blocked": authorIsBlocked,
        "mod_reason_by": modReasonBy,
        if (removalReason != null) "removal_reason": removalReason,
        if (linkFlairBackgroundColor != null)
          "link_flair_background_color": linkFlairBackgroundColor,
        if (id != null) "id": id,
        "is_robot_indexable": isRobotIndexable,
        "report_reasons": reportReasons,
        "author": author,
        "discussion_type": discussionType,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "whitelist_status": whitelistStatusValues.reverse[whitelistStatus],
        "contest_mode": contestMode,
        "mod_reports": modReports == null
            ? []
            : List<dynamic>.from(modReports!.map((x) => x)),
        "author_patreon_flair": authorPatreonFlair,
        "author_flair_text_color":
            flairTextColorValues.reverse[authorFlairTextColor],
        "permalink": permalink,
        "parent_whitelist_status":
            whitelistStatusValues.reverse[parentWhitelistStatus],
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "num_crossposts": numCrossposts,
        "media": media?.toMap(),
        "is_video": isVideo,
        "post_hint": postHintValues.reverse[postHint],
        "url_overridden_by_dest": urlOverriddenByDest,
        "preview": preview?.toMap(),
        "link_flair_template_id": linkFlairTemplateId,
        "is_gallery": isGallery,
        "media_metadata": Map.from(mediaMetadata!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "gallery_data": galleryData?.toMap(),
      };
}

class AllAwarding {
  final dynamic giverCoinReward;
  final dynamic subredditId;
  final bool? isNew;
  final dynamic daysOfDripExtension;
  final int? coinPrice;
  final String? id;
  final dynamic pennyDonate;
  final AwardSubType? awardSubType;
  final int? coinReward;
  final String? iconUrl;
  final int? daysOfPremium;
  final dynamic tiersByRequiredAwardings;
  final List<ResizedIcon>? resizedIcons;
  final int? iconWidth;
  final int? staticIconWidth;
  final dynamic startDate;
  final bool? isEnabled;
  final dynamic awardingsRequiredToGrantBenefits;
  final String? description;
  final dynamic endDate;
  final dynamic stickyDurationSeconds;
  final int? subredditCoinReward;
  final int? count;
  final int? staticIconHeight;
  final String? name;
  final List<ResizedIcon>? resizedStaticIcons;
  final IconFormat? iconFormat;
  final int? iconHeight;
  final int? pennyPrice;
  final AwardType? awardType;
  final String? staticIconUrl;

  AllAwarding({
    this.giverCoinReward,
    this.subredditId,
    this.isNew,
    this.daysOfDripExtension,
    this.coinPrice,
    this.id,
    this.pennyDonate,
    this.awardSubType,
    this.coinReward,
    this.iconUrl,
    this.daysOfPremium,
    this.tiersByRequiredAwardings,
    this.resizedIcons,
    this.iconWidth,
    this.staticIconWidth,
    this.startDate,
    this.isEnabled,
    this.awardingsRequiredToGrantBenefits,
    this.description,
    this.endDate,
    this.stickyDurationSeconds,
    this.subredditCoinReward,
    this.count,
    this.staticIconHeight,
    this.name,
    this.resizedStaticIcons,
    this.iconFormat,
    this.iconHeight,
    this.pennyPrice,
    this.awardType,
    this.staticIconUrl,
  });

  factory AllAwarding.fromJson(String str) =>
      AllAwarding.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllAwarding.fromMap(Map<String, dynamic> json) => AllAwarding(
        giverCoinReward: json["giver_coin_reward"],
        subredditId: json["subreddit_id"],
        isNew: json["is_new"],
        daysOfDripExtension: json["days_of_drip_extension"],
        coinPrice: json["coin_price"],
        id: json["id"],
        pennyDonate: json["penny_donate"],
        awardSubType: awardSubTypeValues.map[json["award_sub_type"]],
        coinReward: json["coin_reward"],
        iconUrl: json["icon_url"],
        daysOfPremium: json["days_of_premium"],
        tiersByRequiredAwardings: json["tiers_by_required_awardings"],
        resizedIcons: json["resized_icons"] == null
            ? []
            : List<ResizedIcon>.from(
                json["resized_icons"]!.map((x) => ResizedIcon.fromMap(x))),
        iconWidth: json["icon_width"],
        staticIconWidth: json["static_icon_width"],
        startDate: json["start_date"],
        isEnabled: json["is_enabled"],
        awardingsRequiredToGrantBenefits:
            json["awardings_required_to_grant_benefits"],
        description: json["description"],
        endDate: json["end_date"],
        stickyDurationSeconds: json["sticky_duration_seconds"],
        subredditCoinReward: json["subreddit_coin_reward"],
        count: json["count"],
        staticIconHeight: json["static_icon_height"],
        name: json["name"],
        resizedStaticIcons: json["resized_static_icons"] == null
            ? []
            : List<ResizedIcon>.from(json["resized_static_icons"]!
                .map((x) => ResizedIcon.fromMap(x))),
        iconFormat: iconFormatValues.map[json["icon_format"]],
        iconHeight: json["icon_height"],
        pennyPrice: json["penny_price"],
        awardType: awardTypeValues.map[json["award_type"]],
        staticIconUrl: json["static_icon_url"],
      );

  Map<String, dynamic> toMap() => {
        "giver_coin_reward": giverCoinReward,
        "subreddit_id": subredditId,
        "is_new": isNew,
        "days_of_drip_extension": daysOfDripExtension,
        "coin_price": coinPrice,
        "id": id,
        "penny_donate": pennyDonate,
        "award_sub_type": awardSubTypeValues.reverse[awardSubType],
        "coin_reward": coinReward,
        "icon_url": iconUrl,
        "days_of_premium": daysOfPremium,
        "tiers_by_required_awardings": tiersByRequiredAwardings,
        "resized_icons": resizedIcons == null
            ? []
            : List<dynamic>.from(resizedIcons!.map((x) => x.toMap())),
        "icon_width": iconWidth,
        "static_icon_width": staticIconWidth,
        "start_date": startDate,
        "is_enabled": isEnabled,
        "awardings_required_to_grant_benefits":
            awardingsRequiredToGrantBenefits,
        "description": description,
        "end_date": endDate,
        "sticky_duration_seconds": stickyDurationSeconds,
        "subreddit_coin_reward": subredditCoinReward,
        "count": count,
        "static_icon_height": staticIconHeight,
        "name": name,
        "resized_static_icons": resizedStaticIcons == null
            ? []
            : List<dynamic>.from(resizedStaticIcons!.map((x) => x.toMap())),
        "icon_format": iconFormatValues.reverse[iconFormat],
        "icon_height": iconHeight,
        "penny_price": pennyPrice,
        "award_type": awardTypeValues.reverse[awardType],
        "static_icon_url": staticIconUrl,
      };
}

enum AwardSubType { appreciation, global, premium }

final awardSubTypeValues = EnumValues({
  "APPRECIATION": AwardSubType.appreciation,
  "GLOBAL": AwardSubType.global,
  "PREMIUM": AwardSubType.premium
});

enum AwardType { global }

final awardTypeValues = EnumValues({"global": AwardType.global});

enum IconFormat { apng, png }

final iconFormatValues =
    EnumValues({"APNG": IconFormat.apng, "PNG": IconFormat.png});

class ResizedIcon {
  final String? url;
  final int? width;
  final int? height;

  ResizedIcon({
    this.url,
    this.width,
    this.height,
  });

  factory ResizedIcon.fromJson(String str) =>
      ResizedIcon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResizedIcon.fromMap(Map<String, dynamic> json) => ResizedIcon(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class FlairRichtext {
  final String? a;
  final String? e;
  final String? u;
  final String? t;

  FlairRichtext({
    this.a,
    this.e,
    this.u,
    this.t,
  });

  factory FlairRichtext.fromJson(String str) =>
      FlairRichtext.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlairRichtext.fromMap(Map<String, dynamic> json) => FlairRichtext(
        a: json["a"],
        e: json["e"],
        u: json["u"],
        t: json["t"],
      );

  Map<String, dynamic> toMap() => {
        "a": a,
        "e": e,
        "u": u,
        "t": t,
      };
}

enum FlairTextColor { dark, light }

final flairTextColorValues =
    EnumValues({"dark": FlairTextColor.dark, "light": FlairTextColor.light});

enum FlairType { text, richtext }

final flairTypeValues =
    EnumValues({"richtext": FlairType.richtext, "text": FlairType.text});

class GalleryData {
  final List<Item>? items;

  GalleryData({
    this.items,
  });

  factory GalleryData.fromJson(String str) =>
      GalleryData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GalleryData.fromMap(Map<String, dynamic> json) => GalleryData(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  final String? mediaId;
  final int? id;

  Item({
    this.mediaId,
    this.id,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        mediaId: json["media_id"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "media_id": mediaId,
        "id": id,
      };
}

class Gildings {
  final int? gid2;

  Gildings({
    this.gid2,
  });

  factory Gildings.fromJson(String str) => Gildings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gildings.fromMap(Map<String, dynamic> json) => Gildings(
        gid2: json["gid_2"],
      );

  Map<String, dynamic> toMap() => {
        "gid_2": gid2,
      };
}

class Media {
  final RedditVideo? redditVideo;

  Media({
    this.redditVideo,
  });

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        redditVideo: json["reddit_video"] == null
            ? null
            : RedditVideo.fromMap(json["reddit_video"]),
      );

  Map<String, dynamic> toMap() => {
        "reddit_video": redditVideo?.toMap(),
      };
}

class RedditVideo {
  final int? bitrateKbps;
  final String? fallbackUrl;
  final bool? hasAudio;
  final int? height;
  final int? width;
  final String? scrubberMediaUrl;
  final String? dashUrl;
  final int? duration;
  final String? hlsUrl;
  final bool? isGif;
  final TranscodingStatus? transcodingStatus;

  RedditVideo({
    this.bitrateKbps,
    this.fallbackUrl,
    this.hasAudio,
    this.height,
    this.width,
    this.scrubberMediaUrl,
    this.dashUrl,
    this.duration,
    this.hlsUrl,
    this.isGif,
    this.transcodingStatus,
  });

  factory RedditVideo.fromJson(String str) =>
      RedditVideo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedditVideo.fromMap(Map<String, dynamic> json) => RedditVideo(
        bitrateKbps: json["bitrate_kbps"],
        fallbackUrl: json["fallback_url"],
        hasAudio: json["has_audio"],
        height: json["height"],
        width: json["width"],
        scrubberMediaUrl: json["scrubber_media_url"],
        dashUrl: json["dash_url"],
        duration: json["duration"],
        hlsUrl: json["hls_url"],
        isGif: json["is_gif"],
        transcodingStatus:
            transcodingStatusValues.map[json["transcoding_status"]],
      );

  Map<String, dynamic> toMap() => {
        "bitrate_kbps": bitrateKbps,
        "fallback_url": fallbackUrl,
        "has_audio": hasAudio,
        "height": height,
        "width": width,
        "scrubber_media_url": scrubberMediaUrl,
        "dash_url": dashUrl,
        "duration": duration,
        "hls_url": hlsUrl,
        "is_gif": isGif,
        "transcoding_status":
            transcodingStatusValues.reverse[transcodingStatus],
      };
}

enum TranscodingStatus { completed }

final transcodingStatusValues =
    EnumValues({"completed": TranscodingStatus.completed});

class MediaEmbed {
  MediaEmbed();

  factory MediaEmbed.fromJson(String str) =>
      MediaEmbed.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaEmbed.fromMap(Map<String, dynamic> json) => MediaEmbed();

  Map<String, dynamic> toMap() => {};
}

class MediaMetadatum {
  final String? status;
  final String? e;
  final String? m;
  final List<S>? p;
  final S? s;
  final String? id;

  MediaMetadatum({
    this.status,
    this.e,
    this.m,
    this.p,
    this.s,
    this.id,
  });

  factory MediaMetadatum.fromJson(String str) =>
      MediaMetadatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaMetadatum.fromMap(Map<String, dynamic> json) => MediaMetadatum(
        status: json["status"],
        e: json["e"],
        m: json["m"],
        p: json["p"] == null
            ? []
            : List<S>.from(json["p"]!.map((x) => S.fromMap(x))),
        s: json["s"] == null ? null : S.fromMap(json["s"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "e": e,
        "m": m,
        "p": p == null ? [] : List<dynamic>.from(p!.map((x) => x.toMap())),
        "s": s?.toMap(),
        "id": id,
      };
}

class S {
  final int? y;
  final int? x;
  final String? u;

  S({
    this.y,
    this.x,
    this.u,
  });

  factory S.fromJson(String str) => S.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory S.fromMap(Map<String, dynamic> json) => S(
        y: json["y"],
        x: json["x"],
        u: json["u"],
      );

  Map<String, dynamic> toMap() => {
        "y": y,
        "x": x,
        "u": u,
      };
}

enum WhitelistStatus { allAds, someAds }

final whitelistStatusValues = EnumValues(
    {"all_ads": WhitelistStatus.allAds, "some_ads": WhitelistStatus.someAds});

enum PostHint { image, hostedVideo, link }

final postHintValues = EnumValues({
  "hosted:video": PostHint.hostedVideo,
  "image": PostHint.image,
  "link": PostHint.link
});

class Preview {
  final List<Image>? images;
  final bool? enabled;

  Preview({
    this.images,
    this.enabled,
  });

  factory Preview.fromJson(String str) => Preview.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Preview.fromMap(Map<String, dynamic> json) => Preview(
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromMap(x))),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toMap() => {
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toMap())),
        "enabled": enabled,
      };
}

class Image {
  final ResizedIcon? source;
  final List<ResizedIcon>? resolutions;
  final MediaEmbed? variants;
  final String? id;

  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        source:
            json["source"] == null ? null : ResizedIcon.fromMap(json["source"]),
        resolutions: json["resolutions"] == null
            ? []
            : List<ResizedIcon>.from(
                json["resolutions"]!.map((x) => ResizedIcon.fromMap(x))),
        variants: json["variants"] == null
            ? null
            : MediaEmbed.fromMap(json["variants"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "source": source?.toMap(),
        "resolutions": resolutions == null
            ? []
            : List<dynamic>.from(resolutions!.map((x) => x.toMap())),
        "variants": variants?.toMap(),
        "id": id,
      };
}

enum SubredditType { public }

final subredditTypeValues = EnumValues({"public": SubredditType.public});

enum Kind { t3 }

final kindValues = EnumValues({"t3": Kind.t3});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
