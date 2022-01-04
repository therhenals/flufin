import 'dart:convert';

import 'package:flufin/models/models.dart';
import 'package:flufin/utils.dart';

class Item {
  Item({
    this.name,
    this.originalTitle,
    this.serverId,
    required this.id,
    this.etag,
    this.sourceType,
    this.playlistItemId,
    this.dateCreated,
    this.dateLastMediaAdded,
    this.extraType,
    this.airsBeforeSeasonNumber,
    this.airsAfterSeasonNumber,
    this.airsBeforeEpisodeNumber,
    this.canDelete,
    this.canDownload,
    this.hasSubtitles,
    this.preferredMetadataLanguage,
    this.preferredMetadataCountryCode,
    this.supportsSync,
    this.container,
    this.sortName,
    this.forcedSortName,
    this.video3DFormat,
    this.premiereDate,
    this.externalUrls,
    this.mediaSources,
    this.criticRating,
    this.productionLocations,
    this.path,
    this.enableMediaSourceDisplay,
    this.officialRating,
    this.customRating,
    this.channelId,
    this.channelName,
    this.overview,
    this.taglines,
    this.genres,
    this.communityRating,
    this.cumulativeRunTimeTicks,
    this.runTimeTicks,
    this.playAccess,
    this.aspectRatio,
    this.productionYear,
    this.isPlaceHolder,
    this.number,
    this.channelNumber,
    this.indexNumber,
    this.indexNumberEnd,
    this.parentIndexNumber,
    this.remoteTrailers,
    this.isHd,
    this.isFolder,
    this.parentId,
    required this.type,
    this.people,
    this.studios,
    this.genreItems,
    this.parentLogoItemId,
    this.parentBackdropItemId,
    this.parentBackdropImageTags,
    this.localTrailerCount,
    this.userData,
    this.recursiveItemCount,
    this.childCount,
    this.seriesName,
    this.seriesId,
    this.seasonId,
    this.specialFeatureCount,
    this.displayPreferencesId,
    this.status,
    this.airTime,
    this.airDays,
    this.tags,
    this.primaryImageAspectRatio,
    this.artists,
    this.artistItems,
    this.album,
    this.collectionType,
    this.displayOrder,
    this.albumId,
    this.albumPrimaryImageTag,
    this.seriesPrimaryImageTag,
    this.albumArtist,
    this.albumArtists,
    this.seasonName,
    this.mediaStreams,
    this.videoType,
    this.partCount,
    this.mediaSourceCount,
    this.imageTags,
    this.backdropImageTags,
    this.screenshotImageTags,
    this.parentLogoImageTag,
    this.parentArtItemId,
    this.parentArtImageTag,
    this.seriesThumbImageTag,
    this.seriesStudio,
    this.parentThumbItemId,
    this.parentThumbImageTag,
    this.parentPrimaryImageItemId,
    this.parentPrimaryImageTag,
    this.chapters,
    this.locationType,
    this.isoType,
    this.mediaType,
    this.endDate,
    this.lockedFields,
    this.trailerCount,
    this.movieCount,
    this.seriesCount,
    this.programCount,
    this.episodeCount,
    this.songCount,
    this.albumCount,
    this.artistCount,
    this.musicVideoCount,
    this.lockData,
    this.width,
    this.height,
    this.cameraMake,
    this.cameraModel,
    this.software,
    this.exposureTime,
    this.focalLength,
    this.imageOrientation,
    this.aperture,
    this.shutterSpeed,
    this.latitude,
    this.longitude,
    this.altitude,
    this.isoSpeedRating,
    this.seriesTimerId,
    this.programId,
    this.channelPrimaryImageTag,
    this.startDate,
    this.completionPercentage,
    this.isRepeat,
    this.episodeTitle,
    this.channelType,
    this.audio,
    this.isMovie,
    this.isSports,
    this.isSeries,
    this.isLive,
    this.isNews,
    this.isKids,
    this.isPremiere,
    this.timerId,
  });

  String? name;
  String? originalTitle;
  String? serverId;
  String id;
  String? etag;
  String? sourceType;
  String? playlistItemId;
  DateTime? dateCreated;
  DateTime? dateLastMediaAdded;
  String? extraType;
  int? airsBeforeSeasonNumber;
  int? airsAfterSeasonNumber;
  int? airsBeforeEpisodeNumber;
  bool? canDelete;
  bool? canDownload;
  bool? hasSubtitles;
  String? preferredMetadataLanguage;
  String? preferredMetadataCountryCode;
  bool? supportsSync;
  String? container;
  String? sortName;
  String? forcedSortName;
  String? video3DFormat;
  DateTime? premiereDate;
  List<ExternalUrl>? externalUrls;
  List<MediaSource>? mediaSources;
  double? criticRating;
  List<String>? productionLocations;
  String? path;
  bool? enableMediaSourceDisplay;
  String? officialRating;
  String? customRating;
  String? channelId;
  String? channelName;
  String? overview;
  List<String>? taglines;
  List<String>? genres;
  double? communityRating;
  int? cumulativeRunTimeTicks;
  int? runTimeTicks;
  String? playAccess;
  String? aspectRatio;
  int? productionYear;
  bool? isPlaceHolder;
  String? number;
  String? channelNumber;
  int? indexNumber;
  int? indexNumberEnd;
  int? parentIndexNumber;
  List<MediaUrl>? remoteTrailers;
  bool? isHd;
  bool? isFolder;
  String? parentId;
  String type;
  List<Person>? people;
  List<NameGuidPair>? studios;
  List<NameGuidPair>? genreItems;
  String? parentLogoItemId;
  String? parentBackdropItemId;
  List<String>? parentBackdropImageTags;
  int? localTrailerCount;
  UserData? userData;
  int? recursiveItemCount;
  int? childCount;
  String? seriesName;
  String? seriesId;
  String? seasonId;
  int? specialFeatureCount;
  String? displayPreferencesId;
  String? status;
  String? airTime;
  List<String>? airDays;
  List<String>? tags;
  double? primaryImageAspectRatio;
  List<String>? artists;
  List<NameGuidPair>? artistItems;
  String? album;
  String? collectionType;
  String? displayOrder;
  String? albumId;
  String? albumPrimaryImageTag;
  String? seriesPrimaryImageTag;
  String? albumArtist;
  List<NameGuidPair>? albumArtists;
  String? seasonName;
  List<MediaStream>? mediaStreams;
  String? videoType;
  int? partCount;
  int? mediaSourceCount;
  ImageTags? imageTags;
  List<String>? backdropImageTags;
  List<String>? screenshotImageTags;
  String? parentLogoImageTag;
  String? parentArtItemId;
  String? parentArtImageTag;
  String? seriesThumbImageTag;
  String? seriesStudio;
  String? parentThumbItemId;
  String? parentThumbImageTag;
  String? parentPrimaryImageItemId;
  String? parentPrimaryImageTag;
  List<Chapter>? chapters;
  String? locationType;
  String? isoType;
  String? mediaType;
  DateTime? endDate;
  List<String>? lockedFields;
  int? trailerCount;
  int? movieCount;
  int? seriesCount;
  int? programCount;
  int? episodeCount;
  int? songCount;
  int? albumCount;
  int? artistCount;
  int? musicVideoCount;
  bool? lockData;
  int? width;
  int? height;
  String? cameraMake;
  String? cameraModel;
  String? software;
  double? exposureTime;
  double? focalLength;
  String? imageOrientation;
  double? aperture;
  double? shutterSpeed;
  double? latitude;
  double? longitude;
  double? altitude;
  int? isoSpeedRating;
  String? seriesTimerId;
  String? programId;
  String? channelPrimaryImageTag;
  DateTime? startDate;
  double? completionPercentage;
  bool? isRepeat;
  String? episodeTitle;
  String? channelType;
  String? audio;
  bool? isMovie;
  bool? isSports;
  bool? isSeries;
  bool? isLive;
  bool? isNews;
  bool? isKids;
  bool? isPremiere;
  String? timerId;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["Name"],
        originalTitle: json["OriginalTitle"],
        serverId: json["ServerId"],
        id: json["Id"],
        etag: json["Etag"],
        sourceType: json["SourceType"],
        playlistItemId: json["PlaylistItemId"],
        dateCreated: json["DateCreated"] != null
            ? DateTime.parse(json["DateCreated"])
            : null,
        dateLastMediaAdded: json["DateLastMediaAdded"] != null
            ? DateTime.parse(json["DateLastMediaAdded"])
            : null,
        extraType: json["ExtraType"],
        airsBeforeSeasonNumber: json["AirsBeforeSeasonNumber"],
        airsAfterSeasonNumber: json["AirsAfterSeasonNumber"],
        airsBeforeEpisodeNumber: json["AirsBeforeEpisodeNumber"],
        canDelete: json["CanDelete"],
        canDownload: json["CanDownload"],
        hasSubtitles: json["HasSubtitles"],
        preferredMetadataLanguage: json["PreferredMetadataLanguage"],
        preferredMetadataCountryCode: json["PreferredMetadataCountryCode"],
        supportsSync: json["SupportsSync"],
        container: json["Container"],
        sortName: json["SortName"],
        forcedSortName: json["ForcedSortName"],
        video3DFormat: json["Video3DFormat"],
        premiereDate: json["PremiereDate"] != null
            ? DateTime.parse(json["PremiereDate"])
            : null,
        externalUrls: json["ExternalUrls"] != null
            ? List<ExternalUrl>.from(
                json["ExternalUrls"].map((x) => ExternalUrl.fromMap(x)))
            : null,
        mediaSources: json["MediaSources"] != null
            ? List<MediaSource>.from(
                json["MediaSources"].map((x) => MediaSource.fromMap(x)))
            : null,
        criticRating: json["CriticRating"] != null
            ? Utils.checkDouble(json["CriticRating"])
            : null,
        productionLocations: json["ProductionLocations"] != null
            ? List<String>.from(json["ProductionLocations"].map((x) => x))
            : null,
        path: json["Path"],
        enableMediaSourceDisplay: json["EnableMediaSourceDisplay"],
        officialRating: json["OfficialRating"],
        customRating: json["CustomRating"],
        channelId: json["ChannelId"],
        channelName: json["ChannelName"],
        overview: json["Overview"],
        taglines: json["Taglines"] != null
            ? List<String>.from(json["Taglines"].map((x) => x))
            : null,
        genres: json["Genres"] != null
            ? List<String>.from(json["Genres"].map((x) => x))
            : null,
        communityRating: json["CommunityRating"] != null
            ? Utils.checkDouble(json["CommunityRating"])
            : null,
        cumulativeRunTimeTicks: json["CumulativeRunTimeTicks"],
        runTimeTicks: json["RunTimeTicks"],
        playAccess: json["PlayAccess"],
        aspectRatio: json["AspectRatio"],
        productionYear: json["ProductionYear"],
        isPlaceHolder: json["IsPlaceHolder"],
        number: json["Number"],
        channelNumber: json["ChannelNumber"],
        indexNumber: json["IndexNumber"],
        indexNumberEnd: json["IndexNumberEnd"],
        parentIndexNumber: json["ParentIndexNumber"],
        remoteTrailers: json["RemoteTrailers"] != null
            ? List<MediaUrl>.from(
                json["RemoteTrailers"].map((x) => MediaUrl.fromMap(x)))
            : null,
        isHd: json["IsHD"],
        isFolder: json["IsFolder"],
        parentId: json["ParentId"],
        type: json["Type"],
        people: json["People"] != null
            ? List<Person>.from(json["People"].map((x) => Person.fromMap(x)))
            : null,
        studios: json["Studios"] != null
            ? List<NameGuidPair>.from(
                json["Studios"].map((x) => NameGuidPair.fromMap(x)))
            : null,
        genreItems: json["GenreItems"] != null
            ? List<NameGuidPair>.from(
                json["GenreItems"].map((x) => NameGuidPair.fromMap(x)))
            : null,
        parentLogoItemId: json["ParentLogoItemId"],
        parentBackdropItemId: json["ParentBackdropItemId"],
        parentBackdropImageTags: json["ParentBackdropImageTags"] != null
            ? List<String>.from(json["ParentBackdropImageTags"].map((x) => x))
            : null,
        localTrailerCount: json["LocalTrailerCount"],
        userData: json["UserData"] != null
            ? UserData.fromMap(json["UserData"])
            : null,
        recursiveItemCount: json["RecursiveItemCount"],
        childCount: json["ChildCount"],
        seriesName: json["SeriesName"],
        seriesId: json["SeriesId"],
        seasonId: json["SeasonId"],
        specialFeatureCount: json["SpecialFeatureCount"],
        displayPreferencesId: json["DisplayPreferencesId"],
        status: json["Status"],
        airTime: json["AirTime"],
        airDays: json["AirDays"] != null
            ? List<String>.from(json["AirDays"].map((x) => x))
            : null,
        tags: json["Tags"] != null
            ? List<String>.from(json["Tags"].map((x) => x))
            : null,
        primaryImageAspectRatio: json["PrimaryImageAspectRatio"] != null
            ? Utils.checkDouble(json["PrimaryImageAspectRatio"])
            : null,
        artists: json["Artists"] != null
            ? List<String>.from(json["Artists"].map((x) => x))
            : null,
        artistItems: json["ArtistItems"] != null
            ? List<NameGuidPair>.from(
                json["ArtistItems"].map((x) => NameGuidPair.fromMap(x)))
            : null,
        album: json["Album"],
        collectionType: json["CollectionType"],
        displayOrder: json["DisplayOrder"],
        albumId: json["AlbumId"],
        albumPrimaryImageTag: json["AlbumPrimaryImageTag"],
        seriesPrimaryImageTag: json["SeriesPrimaryImageTag"],
        albumArtist: json["AlbumArtist"],
        albumArtists: json["AlbumArtists"] != null
            ? List<NameGuidPair>.from(
                json["AlbumArtists"].map((x) => NameGuidPair.fromMap(x)))
            : null,
        seasonName: json["SeasonName"],
        mediaStreams: json["MediaStreams"] != null
            ? List<MediaStream>.from(
                json["MediaStreams"].map((x) => MediaStream.fromMap(x)))
            : null,
        videoType: json["VideoType"],
        partCount: json["PartCount"],
        mediaSourceCount: json["MediaSourceCount"],
        imageTags: json["ImageTags"] != null
            ? ImageTags.fromMap(json["ImageTags"])
            : null,
        backdropImageTags:
            List<String>.from(json["BackdropImageTags"].map((x) => x)),
        screenshotImageTags: json["ScreenshotImageTags"] != null
            ? List<String>.from(json["ScreenshotImageTags"].map((x) => x))
            : null,
        parentLogoImageTag: json["ParentLogoImageTag"],
        parentArtItemId: json["ParentArtItemId"],
        parentArtImageTag: json["ParentArtImageTag"],
        seriesThumbImageTag: json["SeriesThumbImageTag"],
        seriesStudio: json["SeriesStudio"],
        parentThumbItemId: json["ParentThumbItemId"],
        parentThumbImageTag: json["ParentThumbImageTag"],
        parentPrimaryImageItemId: json["ParentPrimaryImageItemId"],
        parentPrimaryImageTag: json["ParentPrimaryImageTag"],
        chapters: json["Chapters"] != null
            ? List<Chapter>.from(
                json["Chapters"].map((x) => Chapter.fromMap(x)))
            : null,
        locationType: json["LocationType"],
        isoType: json["IsoType"],
        mediaType: json["MediaType"],
        endDate:
            json["EndDate"] != null ? DateTime.parse(json["EndDate"]) : null,
        lockedFields: json["LockedFields"] != null
            ? List<String>.from(json["LockedFields"].map((x) => x))
            : null,
        trailerCount: json["TrailerCount"],
        movieCount: json["MovieCount"],
        seriesCount: json["SeriesCount"],
        programCount: json["ProgramCount"],
        episodeCount: json["EpisodeCount"],
        songCount: json["SongCount"],
        albumCount: json["AlbumCount"],
        artistCount: json["ArtistCount"],
        musicVideoCount: json["MusicVideoCount"],
        lockData: json["LockData"],
        width: json["Width"],
        height: json["Height"],
        cameraMake: json["CameraMake"],
        cameraModel: json["CameraModel"],
        software: json["Software"],
        exposureTime: json["ExposureTime"],
        focalLength: json["FocalLength"],
        imageOrientation: json["ImageOrientation"],
        aperture: json["Aperture"],
        shutterSpeed: json["ShutterSpeed"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        altitude: json["Altitude"],
        isoSpeedRating: json["IsoSpeedRating"],
        seriesTimerId: json["SeriesTimerId"],
        programId: json["ProgramId"],
        channelPrimaryImageTag: json["ChannelPrimaryImageTag"],
        startDate: json["StartDate"] != null
            ? DateTime.parse(json["StartDate"])
            : null,
        completionPercentage: json["CompletionPercentage"],
        isRepeat: json["IsRepeat"],
        episodeTitle: json["EpisodeTitle"],
        channelType: json["ChannelType"],
        audio: json["Audio"],
        isMovie: json["IsMovie"],
        isSports: json["IsSports"],
        isSeries: json["IsSeries"],
        isLive: json["IsLive"],
        isNews: json["IsNews"],
        isKids: json["IsKids"],
        isPremiere: json["IsPremiere"],
        timerId: json["TimerId"],
      );
}
