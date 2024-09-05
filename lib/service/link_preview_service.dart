import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:jot_notes/drift/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'link_preview_service.g.dart';
part 'link_preview_service.freezed.dart';

@freezed
class LinkPreview with _$LinkPreview {
  const factory LinkPreview({
    required String title,
    required String description,
    required String image,
    required String url,
  }) = _LinkPreview;

  factory LinkPreview.fromJson(Map<String, Object?> json) =>
      _$LinkPreviewFromJson(json);
}

class LinkPreviewService {
  AppDatabase db;

  LinkPreviewService({required this.db});

  Future<LinkPreview> get(Uri url) async {
    if (!url.isScheme("HTTPS")) {
      url = Uri.parse("https://$url");
    }

    final linkPreview = (await db.managers.linkPreviewItems
        .filter((f) => f.url(url.toString()))
        .get()).elementAtOrNull(0);

    if (linkPreview != null) {
      return LinkPreview(
          title: linkPreview.title,
          description: linkPreview.description,
          url: linkPreview.url,
          image: linkPreview.image);
    }

    final res = await http.get(url);

    final document = parse(res.body);
    final description = document
            .querySelector("meta[name=description]")
            ?.attributes["content"] ??
        "";
    final title = document.querySelector("title")?.text ?? "";
    final image = document
            .querySelector("meta[property='og:image']")
            ?.attributes["content"] ??
        "";

    db.managers.linkPreviewItems.create((f) => f(
        url: url.toString(),
        title: title,
        description: description,
        image: image));

    return LinkPreview(
        title: title,
        description: description,
        url: url.toString(),
        image: image);
  }
}

@riverpod
LinkPreviewService linkPreviewService(LinkPreviewServiceRef ref) {
  final db = ref.watch(driftProvider);

  return LinkPreviewService(db: db);
}

@riverpod
Future<LinkPreview> linkPreview(LinkPreviewRef ref, String url) {
  final service = ref.watch(linkPreviewServiceProvider);
  print(url);
  print(service.get(Uri.parse(url)));

  return service.get(Uri.parse(url));
}
