import 'dart:convert';

class Domains {
  final dynamic after;
  final List<Post>? posts;

  Domains({
    this.after,
    this.posts,
  });

  factory Domains.fromJson(String str) => Domains.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Domains.fromMap(Map<String, dynamic> json) => Domains(
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
  final dynamic approvedAtUtc;
  final String? subreddit;
  final String? selftext;
  final String? authorFullname;
  final bool? saved;
  final dynamic modReasonTitle;
  final int? gilded;
  final bool? clicked;
  final String? title;
  final List<dynamic>? linkFlairRichtext;
  final String? subredditNamePrefixed;
  final bool? hidden;
  final int? pwls;
  final dynamic linkFlairCssClass;
  final int? downs;
  final int? thumbnailHeight;
  final dynamic topAwardedType;
  final bool? hideScore;
  final String? name;
  final bool? quarantine;
  final FlairTextColor? linkFlairTextColor;
  final double? upvoteRatio;
  final String? authorFlairBackgroundColor;
  final SubredditType? subredditType;
  final int? ups;
  final int? totalAwardsReceived;
  final Gildings? mediaEmbed;
  final int? thumbnailWidth;
  final dynamic authorFlairTemplateId;
  final bool? isOriginalContent;
  final List<dynamic>? userReports;
  final dynamic secureMedia;
  final bool? isRedditMediaDomain;
  final bool? isMeta;
  final dynamic category;
  final Gildings? secureMediaEmbed;
  final dynamic linkFlairText;
  final bool? canModPost;
  final int? score;
  final dynamic approvedBy;
  final bool? isCreatedFromAdsUi;
  final bool? authorPremium;
  final String? thumbnail;
  final bool? edited;
  final dynamic authorFlairCssClass;
  final List<dynamic>? authorFlairRichtext;
  final Gildings? gildings;
  final String? postHint;
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
  final dynamic selftextHtml;
  final dynamic likes;
  final dynamic suggestedSort;
  final dynamic bannedAtUtc;
  final String? urlOverriddenByDest;
  final dynamic viewCount;
  final bool? archived;
  final bool? noFollow;
  final bool? isCrosspostable;
  final bool? pinned;
  final bool? over18;
  final Preview? preview;
  final List<dynamic>? allAwardings;
  final List<dynamic>? awarders;
  final bool? mediaOnly;
  final bool? canGild;
  final bool? spoiler;
  final bool? locked;
  final dynamic authorFlairText;
  final List<dynamic>? treatmentTags;
  final bool? visited;
  final dynamic removedBy;
  final dynamic numReports;
  final dynamic distinguished;
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
  final String? whitelistStatus;
  final bool? contestMode;
  final List<dynamic>? modReports;
  final bool? authorPatreonFlair;
  final FlairTextColor? authorFlairTextColor;
  final String? permalink;
  final String? parentWhitelistStatus;
  final bool? stickied;
  final String? url;
  final int? subredditSubscribers;
  final double? createdUtc;
  final int? numCrossposts;
  final dynamic media;
  final bool? isVideo;
  final List<Data>? crosspostParentList;
  final String? crosspostParent;

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
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.postHint,
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
    this.urlOverriddenByDest,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
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
    this.crosspostParentList,
    this.crosspostParent,
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
            : List<dynamic>.from(json["link_flair_richtext"]!.map((x) => x)),
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
            : Gildings.fromMap(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: json["user_reports"] == null
            ? []
            : List<dynamic>.from(json["user_reports"]!.map((x) => x)),
        secureMedia: json["secure_media"],
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: json["secure_media_embed"] == null
            ? null
            : Gildings.fromMap(json["secure_media_embed"]),
        linkFlairText: json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"],
        authorFlairRichtext: json["author_flair_richtext"] == null
            ? []
            : List<dynamic>.from(json["author_flair_richtext"]!.map((x) => x)),
        gildings: json["gildings"] == null
            ? null
            : Gildings.fromMap(json["gildings"]),
        postHint: json["post_hint"],
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
        urlOverriddenByDest: json["url_overridden_by_dest"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview:
            json["preview"] == null ? null : Preview.fromMap(json["preview"]),
        allAwardings: json["all_awardings"] == null
            ? []
            : List<dynamic>.from(json["all_awardings"]!.map((x) => x)),
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
        whitelistStatus: json["whitelist_status"],
        contestMode: json["contest_mode"],
        modReports: json["mod_reports"] == null
            ? []
            : List<dynamic>.from(json["mod_reports"]!.map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor:
            flairTextColorValues.map[json["author_flair_text_color"]],
        permalink: json["permalink"],
        parentWhitelistStatus: json["parent_whitelist_status"],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"],
        isVideo: json["is_video"],
        crosspostParentList: json["crosspost_parent_list"] == null
            ? []
            : List<Data>.from(
                json["crosspost_parent_list"]!.map((x) => Data.fromMap(x))),
        crosspostParent: json["crosspost_parent"],
      );

  Map<String, dynamic> toMap() => {
        "approved_at_utc": approvedAtUtc,
        "subreddit": subreddit,
        "selftext": selftext,
        "author_fullname": authorFullname,
        "saved": saved,
        "mod_reason_title": modReasonTitle,
        "gilded": gilded,
        "clicked": clicked,
        "title": title,
        "link_flair_richtext": linkFlairRichtext == null
            ? []
            : List<dynamic>.from(linkFlairRichtext!.map((x) => x)),
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
        "secure_media": secureMedia,
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
        "thumbnail": thumbnail,
        "edited": edited,
        "author_flair_css_class": authorFlairCssClass,
        "author_flair_richtext": authorFlairRichtext == null
            ? []
            : List<dynamic>.from(authorFlairRichtext!.map((x) => x)),
        "gildings": gildings?.toMap(),
        "post_hint": postHint,
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
        "url_overridden_by_dest": urlOverriddenByDest,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "preview": preview?.toMap(),
        "all_awardings": allAwardings == null
            ? []
            : List<dynamic>.from(allAwardings!.map((x) => x)),
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
        "removal_reason": removalReason,
        "link_flair_background_color": linkFlairBackgroundColor,
        "id": id,
        "is_robot_indexable": isRobotIndexable,
        "report_reasons": reportReasons,
        "author": author,
        "discussion_type": discussionType,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "whitelist_status": whitelistStatus,
        "contest_mode": contestMode,
        "mod_reports": modReports == null
            ? []
            : List<dynamic>.from(modReports!.map((x) => x)),
        "author_patreon_flair": authorPatreonFlair,
        "author_flair_text_color":
            flairTextColorValues.reverse[authorFlairTextColor],
        "permalink": permalink,
        "parent_whitelist_status": parentWhitelistStatus,
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "num_crossposts": numCrossposts,
        "media": media,
        "is_video": isVideo,
        "crosspost_parent_list": crosspostParentList == null
            ? []
            : List<dynamic>.from(crosspostParentList!.map((x) => x.toMap())),
        "crosspost_parent": crosspostParent,
      };
}

enum FlairTextColor { dark }

final flairTextColorValues = EnumValues({"dark": FlairTextColor.dark});

enum FlairType { text }

final flairTypeValues = EnumValues({"text": FlairType.text});

class Gildings {
  Gildings();

  factory Gildings.fromJson(String str) => Gildings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gildings.fromMap(Map<String, dynamic> json) => Gildings();

  Map<String, dynamic> toMap() => {};
}

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
  final Source? source;
  final List<Source>? resolutions;
  final Gildings? variants;
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
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        resolutions: json["resolutions"] == null
            ? []
            : List<Source>.from(
                json["resolutions"]!.map((x) => Source.fromMap(x))),
        variants: json["variants"] == null
            ? null
            : Gildings.fromMap(json["variants"]),
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

class Source {
  final String? url;
  final int? width;
  final int? height;

  Source({
    this.url,
    this.width,
    this.height,
  });

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => Source(
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

enum SubredditType { restricted, public, archived }

final subredditTypeValues = EnumValues({
  "archived": SubredditType.archived,
  "public": SubredditType.public,
  "restricted": SubredditType.restricted
});

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
