/// Paisagens sagradas para o Salmo do Dia (offline).
/// Fotos do Picsum Photos — uso livre, domínio público.
class Landscapes {
  Landscapes._();

  static const _p = 'assets/landscapes/';

  static const hero = '${_p}hero_sunrise.jpg';
  static const onboarding = '${_p}onboarding.jpg';

  static const inspiration = <String>[
    '${_p}insp_peak.jpg',
    '${_p}insp_coast.jpg',
    '${_p}insp_lake.jpg',
  ];

  static String inspThumb(int i) => inspiration[i % inspiration.length];

  /// Fundos agrupados por TEMA (a chave é só organizacional; o editor usa a
  /// lista achatada [editorBackgrounds]).
  static const themes = <String, List<String>>{
    'morning': [
      '${_p}cat_bom_dia.jpg',
      '${_p}editor_bg01.jpg',
      '${_p}editor_bg05.jpg',
      hero,
    ],
    'faith': [
      '${_p}cat_fe.jpg',
      '${_p}cat_louvor.jpg',
      '${_p}editor_bg02.jpg',
      onboarding,
    ],
    'nature': [
      '${_p}insp_peak.jpg',
      '${_p}insp_lake.jpg',
      '${_p}insp_coast.jpg',
      '${_p}editor_bg03.jpg',
      '${_p}editor_bg04.jpg',
    ],
    'strength': [
      '${_p}cat_protecao.jpg',
      '${_p}cat_forca.jpg',
      '${_p}cat_vitoria.jpg',
      '${_p}editor_bg06.jpg',
    ],
    'peace': [
      '${_p}cat_paz.jpg',
      '${_p}cat_cura.jpg',
      '${_p}cat_perdon.jpg',
      '${_p}editor_bg07.jpg',
      '${_p}editor_bg08.jpg',
    ],
    'love': [
      '${_p}cat_amor_familia.jpg',
      '${_p}cat_gratidao.jpg',
      '${_p}cat_boa_noite.jpg',
    ],
  };

  /// Todos os fundos do EDITOR, na ordem dos temas (achatado).
  static final List<String> editorBackgrounds = [
    for (final list in themes.values) ...list,
  ];

  /// Índice (em [editorBackgrounds]) de um fundo que combina com a categoria.
  static int editorIndexForCategory(String categoryId) {
    final asset = '${_p}cat_$categoryId.jpg';
    final i = editorBackgrounds.indexOf(asset);
    return i < 0 ? 0 : i;
  }
}
