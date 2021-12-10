import 'package:flufin/models/models.dart';

class _Image {
  _Image({
    required this.tag,
    this.type = 'Primary',
  });

  String tag;
  String? type;
}

class ImageService {
  static String getItemPath(Item item, {bool? backdrop = false}) {
    Uri uri = Uri(path: '/Items/${item.id}/Images', queryParameters: {
      'fillHeight': '315',
      'fillWidth': '560',
      'quality': '96'
    });
    final _Image? image;

    if (backdrop == true) {
      image = _getBackdropTag(item);
    } else {
      image = _getPrimaryTag(item);
    }

    if (image == null) {
      return '';
    } else {
      uri = uri.replace(
        path: '${uri.path}/${image.type!}',
        queryParameters: {
          ...uri.queryParameters,
          'tag': image.tag,
        },
      );
      return uri.toString();
    }
  }

  static _Image? _getPrimaryTag(Item item) {
    if (item.imageTags?.primary == null) {
      return null;
    } else {
      return _Image(tag: item.imageTags!.primary!);
    }
  }

  static _Image? _getBackdropTag(Item item) {
    if (item.backdropImageTags!.isEmpty || item.backdropImageTags?[0] == null) {
      return _getPrimaryTag(item);
    } else {
      return _Image(tag: item.backdropImageTags![0], type: 'Backdrop');
    }
  }

  static String getPersonPath(Person person) {
    if (person.primaryImageTag == null) {
      return '';
    } else {
      final url = Uri(
        path: '/Items/${person.id}/Images/Primary',
        queryParameters: {
          'fillHeight': '378',
          'fillWidth': '252',
          'quality': '96',
          'tag': person.primaryImageTag,
        },
      );
      return url.toString();
    }
  }
}
