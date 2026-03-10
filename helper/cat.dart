import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    return;
  }
  String subPath = '/lib/features';
  if (arguments.length > 1) {
    subPath = '/lib/features/${arguments[1]}';
  }
  final featurename = arguments[0];
  final basePath = '${Directory.current.path}/$subPath';
  final folders = [
    'presentation/bloc',
    'presentation/ui',
    'presentation/ui/widgets',
    'presentation/ui/screen',
    'data/services',
    'data/dataSource',
    'data/repo_imple',
    'data/models',
    'domain/entities',
    'domain/repo',
    'domain/usecase',
    'di',
  ];
  for (final folder in folders) {
    final dir = Directory('$basePath/$featurename/$folder');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }
  final files = [
    'presentation/bloc/${featurename}_bloc.dart',
    'presentation/bloc/${featurename}_event.dart',
    'presentation/bloc/${featurename}_state.dart',
    'presentation/ui/screen/${featurename}_screen.dart',
    'data/dataSource/${featurename}_data_source.dart',
    'data/repo_imple/${featurename}_repo_impe.dart',
    'data/models/${featurename}_models.dart',
    'domain/entities/${featurename}_entities.dart',
    'domain/repo/${featurename}_repo.dart',
    'di/${featurename}_injection.dart',
  ];
  for (final file in files) {
    final filepath = '$basePath/$featurename/$file';
    final fileObj = File(filepath);
    if (!fileObj.existsSync()) {
      fileObj.createSync(recursive: true);
    }
  }
}
// flutter pub run helper/cat.dart 