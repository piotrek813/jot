// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_preview_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkPreviewImpl _$$LinkPreviewImplFromJson(Map<String, dynamic> json) =>
    _$LinkPreviewImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LinkPreviewImplToJson(_$LinkPreviewImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'url': instance.url,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$linkPreviewServiceHash() =>
    r'31b268e247242cb8b39c0c77e5d0b17ec9dbbcf0';

/// See also [linkPreviewService].
@ProviderFor(linkPreviewService)
final linkPreviewServiceProvider =
    AutoDisposeProvider<LinkPreviewService>.internal(
  linkPreviewService,
  name: r'linkPreviewServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$linkPreviewServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LinkPreviewServiceRef = AutoDisposeProviderRef<LinkPreviewService>;
String _$linkPreviewHash() => r'97d21cd4b46692f2a7d6a7149735dbb615620e7f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [linkPreview].
@ProviderFor(linkPreview)
const linkPreviewProvider = LinkPreviewFamily();

/// See also [linkPreview].
class LinkPreviewFamily extends Family<AsyncValue<LinkPreview>> {
  /// See also [linkPreview].
  const LinkPreviewFamily();

  /// See also [linkPreview].
  LinkPreviewProvider call(
    String url,
  ) {
    return LinkPreviewProvider(
      url,
    );
  }

  @override
  LinkPreviewProvider getProviderOverride(
    covariant LinkPreviewProvider provider,
  ) {
    return call(
      provider.url,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'linkPreviewProvider';
}

/// See also [linkPreview].
class LinkPreviewProvider extends AutoDisposeFutureProvider<LinkPreview> {
  /// See also [linkPreview].
  LinkPreviewProvider(
    String url,
  ) : this._internal(
          (ref) => linkPreview(
            ref as LinkPreviewRef,
            url,
          ),
          from: linkPreviewProvider,
          name: r'linkPreviewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$linkPreviewHash,
          dependencies: LinkPreviewFamily._dependencies,
          allTransitiveDependencies:
              LinkPreviewFamily._allTransitiveDependencies,
          url: url,
        );

  LinkPreviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<LinkPreview> Function(LinkPreviewRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LinkPreviewProvider._internal(
        (ref) => create(ref as LinkPreviewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LinkPreview> createElement() {
    return _LinkPreviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LinkPreviewProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LinkPreviewRef on AutoDisposeFutureProviderRef<LinkPreview> {
  /// The parameter `url` of this provider.
  String get url;
}

class _LinkPreviewProviderElement
    extends AutoDisposeFutureProviderElement<LinkPreview> with LinkPreviewRef {
  _LinkPreviewProviderElement(super.provider);

  @override
  String get url => (origin as LinkPreviewProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
