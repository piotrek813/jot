// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chote_tile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentChoteHash() => r'3bf3ef955ab6637f334d08412a212c9097dca6ff';

/// See also [currentChote].
@ProviderFor(currentChote)
final currentChoteProvider = AutoDisposeProvider<Chote>.internal(
  currentChote,
  name: r'currentChoteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentChoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentChoteRef = AutoDisposeProviderRef<Chote>;
String _$areChotesSelectedHash() => r'a8207dd9c8d690d5dd9fe71c0854fae1c3853428';

/// See also [areChotesSelected].
@ProviderFor(areChotesSelected)
final areChotesSelectedProvider = AutoDisposeProvider<bool>.internal(
  areChotesSelected,
  name: r'areChotesSelectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$areChotesSelectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AreChotesSelectedRef = AutoDisposeProviderRef<bool>;
String _$selectedChotesHash() => r'd8e9afa182dde3a7eacf56a9eb6a8beea56a9188';

/// See also [SelectedChotes].
@ProviderFor(SelectedChotes)
final selectedChotesProvider =
    AutoDisposeNotifierProvider<SelectedChotes, List<Chote>>.internal(
  SelectedChotes.new,
  name: r'selectedChotesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedChotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedChotes = AutoDisposeNotifier<List<Chote>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
