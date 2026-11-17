// Testes de dados + i18n. O conteúdo vem de assets/frases/<lang>.json (carregado
// via VerseData.init). i18n é puro. O app completo roda no device.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salmo_do_dia/data/verses.dart';
import 'package:salmo_do_dia/l10n/strings.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await VerseData.init();
  });

  test('12 categorias; cada mensagem pertence a uma delas (pt)', () {
    expect(VerseData.categories.length, 12);
    final ids = VerseData.categories.map((c) => c.id).toSet();
    for (final v in VerseData.allFor('pt')) {
      expect(ids.contains(v.categoryId), isTrue);
    }
  });

  test('pelo menos 1200 mensagens por idioma (pt/en/es)', () {
    expect(VerseData.allFor('pt').length, greaterThanOrEqualTo(1200));
    expect(VerseData.allFor('en').length, greaterThanOrEqualTo(1200));
    expect(VerseData.allFor('es').length, greaterThanOrEqualTo(1200));
  });

  test('conteúdo pt/en/es paralelo (mesmo nº por categoria; ids estáveis)', () {
    for (final c in VerseData.categories) {
      final pt = VerseData.countFor('pt', c.id);
      expect(VerseData.countFor('en', c.id), pt, reason: c.id);
      expect(VerseData.countFor('es', c.id), pt, reason: c.id);
    }
  });

  test('byId resolve o mesmo slot em idiomas diferentes', () {
    final ptVerse = VerseData.allFor('pt').first;
    final enVerse = VerseData.byId('en', ptVerse.id);
    expect(enVerse, isNotNull);
    expect(enVerse!.id, ptVerse.id);
    expect(enVerse.text, isNot(ptVerse.text));
  });

  test('frase do dia determinística; idioma sem conteúdo cai no inglês', () {
    expect(VerseData.ofToday('pt').id, VerseData.ofToday('pt').id);
    expect(VerseData.hasContent('fr'), isFalse);
    expect(VerseData.allFor('fr').first.text, VerseData.allFor('en').first.text);
  });

  test('i18n: nome do app + categorias por idioma', () {
    const pt = T(Locale('pt'));
    const en = T(Locale('en'));
    const es = T(Locale('es'));
    expect(pt.appName, 'Salmo do Dia');
    expect(en.appName, 'Psalm of the Day');
    expect(es.appName, 'Salmo del Día');
    expect(pt.catName('protecao'), 'Proteção');
    expect(en.catName('louvor'), 'Praise');
    expect(es.catName('paz'), 'Paz');
  });

  test('i18n: TODA chave PT existe em EN e ES (menus, editor, loja...)', () {
    final pt = T.data['pt']!;
    final en = T.data['en']!;
    final es = T.data['es']!;
    // Única exceção: "Mais apps da Beggins" é só PT (diretriz i18n global).
    final ptOnly = pt.keys.where((k) => k.startsWith('moreApps.')).toSet();
    for (final key in pt.keys.where((k) => !ptOnly.contains(k))) {
      expect(en.containsKey(key), isTrue, reason: 'EN sem a chave "$key"');
      expect(es.containsKey(key), isTrue, reason: 'ES sem a chave "$key"');
      expect(en[key], isNotEmpty, reason: 'EN vazio em "$key"');
      expect(es[key], isNotEmpty, reason: 'ES vazio em "$key"');
    }
    // E nada sobrando em EN/ES que não exista em PT (chave morta/typo).
    for (final key in [...en.keys, ...es.keys]) {
      expect(pt.containsKey(key), isTrue, reason: 'PT sem a chave "$key"');
    }
  });
}
