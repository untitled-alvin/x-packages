// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_database.dart';

// ignore_for_file: type=lint
class $SourcesTable extends Sources with TableInfo<$SourcesTable, SourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, url, image, description, category, language, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(Insertable<SourceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class SourceData extends DataClass implements Insertable<SourceData> {
  final String? id;
  final String? name;
  final String? url;
  final String? image;
  final String? description;
  final String? category;
  final String? language;
  final String? country;
  const SourceData(
      {this.id,
      this.name,
      this.url,
      this.image,
      this.description,
      this.category,
      this.language,
      this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
    );
  }

  factory SourceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceData(
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      url: serializer.fromJson<String?>(json['url']),
      image: serializer.fromJson<String?>(json['image']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String?>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      country: serializer.fromJson<String?>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String?>(name),
      'url': serializer.toJson<String?>(url),
      'image': serializer.toJson<String?>(image),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String?>(category),
      'language': serializer.toJson<String?>(language),
      'country': serializer.toJson<String?>(country),
    };
  }

  SourceData copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> country = const Value.absent()}) =>
      SourceData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        url: url.present ? url.value : this.url,
        image: image.present ? image.value : this.image,
        description: description.present ? description.value : this.description,
        category: category.present ? category.value : this.category,
        language: language.present ? language.value : this.language,
        country: country.present ? country.value : this.country,
      );
  @override
  String toString() {
    return (StringBuffer('SourceData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, url, image, description, category, language, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceData &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url &&
          other.image == this.image &&
          other.description == this.description &&
          other.category == this.category &&
          other.language == this.language &&
          other.country == this.country);
}

class SourcesCompanion extends UpdateCompanion<SourceData> {
  final Value<String?> id;
  final Value<String?> name;
  final Value<String?> url;
  final Value<String?> image;
  final Value<String?> description;
  final Value<String?> category;
  final Value<String?> language;
  final Value<String?> country;
  final Value<int> rowid;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<SourceData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? url,
    Expression<String>? image,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? language,
    Expression<String>? country,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (image != null) 'image': image,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (country != null) 'country': country,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? name,
      Value<String?>? url,
      Value<String?>? image,
      Value<String?>? description,
      Value<String?>? category,
      Value<String?>? language,
      Value<String?>? country,
      Value<int>? rowid}) {
    return SourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      language: language ?? this.language,
      country: country ?? this.country,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('country: $country, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles
    with TableInfo<$ArticlesTable, ArticleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedIdMeta =
      const VerificationMeta('modifiedId');
  @override
  late final GeneratedColumn<String> modifiedId = GeneratedColumn<String>(
      'modified_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _apiArticleIdMeta =
      const VerificationMeta('apiArticleId');
  @override
  late final GeneratedColumn<String> apiArticleId = GeneratedColumn<String>(
      'api_article_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sources (id)'));
  static const VerificationMeta _authorNameMeta =
      const VerificationMeta('authorName');
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
      'author_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
      'published_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _ingestedAtMeta =
      const VerificationMeta('ingestedAt');
  @override
  late final GeneratedColumn<DateTime> ingestedAt = GeneratedColumn<DateTime>(
      'ingested_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isFeaturedMeta =
      const VerificationMeta('isFeatured');
  @override
  late final GeneratedColumn<bool> isFeatured = GeneratedColumn<bool>(
      'is_featured', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_featured" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        guid,
        createdAt,
        updatedAt,
        modifiedId,
        ownerId,
        apiArticleId,
        sourceId,
        authorName,
        title,
        slug,
        description,
        summary,
        content,
        imageUrl,
        videoUrl,
        publishedAt,
        ingestedAt,
        isFeatured
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('modified_id')) {
      context.handle(
          _modifiedIdMeta,
          modifiedId.isAcceptableOrUnknown(
              data['modified_id']!, _modifiedIdMeta));
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('api_article_id')) {
      context.handle(
          _apiArticleIdMeta,
          apiArticleId.isAcceptableOrUnknown(
              data['api_article_id']!, _apiArticleIdMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    if (data.containsKey('author_name')) {
      context.handle(
          _authorNameMeta,
          authorName.isAcceptableOrUnknown(
              data['author_name']!, _authorNameMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('ingested_at')) {
      context.handle(
          _ingestedAtMeta,
          ingestedAt.isAcceptableOrUnknown(
              data['ingested_at']!, _ingestedAtMeta));
    }
    if (data.containsKey('is_featured')) {
      context.handle(
          _isFeaturedMeta,
          isFeatured.isAcceptableOrUnknown(
              data['is_featured']!, _isFeaturedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  ArticleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleData(
      guid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      modifiedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified_id']),
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_id'])!,
      apiArticleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_article_id']),
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id']),
      authorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_name']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_at']),
      ingestedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ingested_at']),
      isFeatured: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_featured'])!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class ArticleData extends DataClass implements Insertable<ArticleData> {
  final String guid;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? modifiedId;
  final String ownerId;
  final String? apiArticleId;
  final String? sourceId;
  final String? authorName;
  final String? title;
  final String? slug;
  final String? description;
  final String? summary;
  final String? content;
  final String? imageUrl;
  final String? videoUrl;
  final DateTime? publishedAt;
  final DateTime? ingestedAt;
  final bool isFeatured;
  const ArticleData(
      {required this.guid,
      required this.createdAt,
      this.updatedAt,
      this.modifiedId,
      required this.ownerId,
      this.apiArticleId,
      this.sourceId,
      this.authorName,
      this.title,
      this.slug,
      this.description,
      this.summary,
      this.content,
      this.imageUrl,
      this.videoUrl,
      this.publishedAt,
      this.ingestedAt,
      required this.isFeatured});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guid'] = Variable<String>(guid);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || modifiedId != null) {
      map['modified_id'] = Variable<String>(modifiedId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    if (!nullToAbsent || apiArticleId != null) {
      map['api_article_id'] = Variable<String>(apiArticleId);
    }
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String>(authorName);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    if (!nullToAbsent || ingestedAt != null) {
      map['ingested_at'] = Variable<DateTime>(ingestedAt);
    }
    map['is_featured'] = Variable<bool>(isFeatured);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      guid: Value(guid),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      modifiedId: modifiedId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedId),
      ownerId: Value(ownerId),
      apiArticleId: apiArticleId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiArticleId),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      ingestedAt: ingestedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(ingestedAt),
      isFeatured: Value(isFeatured),
    );
  }

  factory ArticleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleData(
      guid: serializer.fromJson<String>(json['guid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      modifiedId: serializer.fromJson<String?>(json['modifiedId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      apiArticleId: serializer.fromJson<String?>(json['apiArticleId']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      authorName: serializer.fromJson<String?>(json['authorName']),
      title: serializer.fromJson<String?>(json['title']),
      slug: serializer.fromJson<String?>(json['slug']),
      description: serializer.fromJson<String?>(json['description']),
      summary: serializer.fromJson<String?>(json['summary']),
      content: serializer.fromJson<String?>(json['content']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      ingestedAt: serializer.fromJson<DateTime?>(json['ingestedAt']),
      isFeatured: serializer.fromJson<bool>(json['isFeatured']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'modifiedId': serializer.toJson<String?>(modifiedId),
      'ownerId': serializer.toJson<String>(ownerId),
      'apiArticleId': serializer.toJson<String?>(apiArticleId),
      'sourceId': serializer.toJson<String?>(sourceId),
      'authorName': serializer.toJson<String?>(authorName),
      'title': serializer.toJson<String?>(title),
      'slug': serializer.toJson<String?>(slug),
      'description': serializer.toJson<String?>(description),
      'summary': serializer.toJson<String?>(summary),
      'content': serializer.toJson<String?>(content),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'ingestedAt': serializer.toJson<DateTime?>(ingestedAt),
      'isFeatured': serializer.toJson<bool>(isFeatured),
    };
  }

  ArticleData copyWith(
          {String? guid,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<String?> modifiedId = const Value.absent(),
          String? ownerId,
          Value<String?> apiArticleId = const Value.absent(),
          Value<String?> sourceId = const Value.absent(),
          Value<String?> authorName = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> slug = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> summary = const Value.absent(),
          Value<String?> content = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> videoUrl = const Value.absent(),
          Value<DateTime?> publishedAt = const Value.absent(),
          Value<DateTime?> ingestedAt = const Value.absent(),
          bool? isFeatured}) =>
      ArticleData(
        guid: guid ?? this.guid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        modifiedId: modifiedId.present ? modifiedId.value : this.modifiedId,
        ownerId: ownerId ?? this.ownerId,
        apiArticleId:
            apiArticleId.present ? apiArticleId.value : this.apiArticleId,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
        authorName: authorName.present ? authorName.value : this.authorName,
        title: title.present ? title.value : this.title,
        slug: slug.present ? slug.value : this.slug,
        description: description.present ? description.value : this.description,
        summary: summary.present ? summary.value : this.summary,
        content: content.present ? content.value : this.content,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        ingestedAt: ingestedAt.present ? ingestedAt.value : this.ingestedAt,
        isFeatured: isFeatured ?? this.isFeatured,
      );
  @override
  String toString() {
    return (StringBuffer('ArticleData(')
          ..write('guid: $guid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('modifiedId: $modifiedId, ')
          ..write('ownerId: $ownerId, ')
          ..write('apiArticleId: $apiArticleId, ')
          ..write('sourceId: $sourceId, ')
          ..write('authorName: $authorName, ')
          ..write('title: $title, ')
          ..write('slug: $slug, ')
          ..write('description: $description, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('ingestedAt: $ingestedAt, ')
          ..write('isFeatured: $isFeatured')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      guid,
      createdAt,
      updatedAt,
      modifiedId,
      ownerId,
      apiArticleId,
      sourceId,
      authorName,
      title,
      slug,
      description,
      summary,
      content,
      imageUrl,
      videoUrl,
      publishedAt,
      ingestedAt,
      isFeatured);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleData &&
          other.guid == this.guid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.modifiedId == this.modifiedId &&
          other.ownerId == this.ownerId &&
          other.apiArticleId == this.apiArticleId &&
          other.sourceId == this.sourceId &&
          other.authorName == this.authorName &&
          other.title == this.title &&
          other.slug == this.slug &&
          other.description == this.description &&
          other.summary == this.summary &&
          other.content == this.content &&
          other.imageUrl == this.imageUrl &&
          other.videoUrl == this.videoUrl &&
          other.publishedAt == this.publishedAt &&
          other.ingestedAt == this.ingestedAt &&
          other.isFeatured == this.isFeatured);
}

class ArticlesCompanion extends UpdateCompanion<ArticleData> {
  final Value<String> guid;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> modifiedId;
  final Value<String> ownerId;
  final Value<String?> apiArticleId;
  final Value<String?> sourceId;
  final Value<String?> authorName;
  final Value<String?> title;
  final Value<String?> slug;
  final Value<String?> description;
  final Value<String?> summary;
  final Value<String?> content;
  final Value<String?> imageUrl;
  final Value<String?> videoUrl;
  final Value<DateTime?> publishedAt;
  final Value<DateTime?> ingestedAt;
  final Value<bool> isFeatured;
  final Value<int> rowid;
  const ArticlesCompanion({
    this.guid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.modifiedId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.apiArticleId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.title = const Value.absent(),
    this.slug = const Value.absent(),
    this.description = const Value.absent(),
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.ingestedAt = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String guid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.modifiedId = const Value.absent(),
    required String ownerId,
    this.apiArticleId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.title = const Value.absent(),
    this.slug = const Value.absent(),
    this.description = const Value.absent(),
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.ingestedAt = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : guid = Value(guid),
        ownerId = Value(ownerId);
  static Insertable<ArticleData> custom({
    Expression<String>? guid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? modifiedId,
    Expression<String>? ownerId,
    Expression<String>? apiArticleId,
    Expression<String>? sourceId,
    Expression<String>? authorName,
    Expression<String>? title,
    Expression<String>? slug,
    Expression<String>? description,
    Expression<String>? summary,
    Expression<String>? content,
    Expression<String>? imageUrl,
    Expression<String>? videoUrl,
    Expression<DateTime>? publishedAt,
    Expression<DateTime>? ingestedAt,
    Expression<bool>? isFeatured,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (modifiedId != null) 'modified_id': modifiedId,
      if (ownerId != null) 'owner_id': ownerId,
      if (apiArticleId != null) 'api_article_id': apiArticleId,
      if (sourceId != null) 'source_id': sourceId,
      if (authorName != null) 'author_name': authorName,
      if (title != null) 'title': title,
      if (slug != null) 'slug': slug,
      if (description != null) 'description': description,
      if (summary != null) 'summary': summary,
      if (content != null) 'content': content,
      if (imageUrl != null) 'image_url': imageUrl,
      if (videoUrl != null) 'video_url': videoUrl,
      if (publishedAt != null) 'published_at': publishedAt,
      if (ingestedAt != null) 'ingested_at': ingestedAt,
      if (isFeatured != null) 'is_featured': isFeatured,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesCompanion copyWith(
      {Value<String>? guid,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? modifiedId,
      Value<String>? ownerId,
      Value<String?>? apiArticleId,
      Value<String?>? sourceId,
      Value<String?>? authorName,
      Value<String?>? title,
      Value<String?>? slug,
      Value<String?>? description,
      Value<String?>? summary,
      Value<String?>? content,
      Value<String?>? imageUrl,
      Value<String?>? videoUrl,
      Value<DateTime?>? publishedAt,
      Value<DateTime?>? ingestedAt,
      Value<bool>? isFeatured,
      Value<int>? rowid}) {
    return ArticlesCompanion(
      guid: guid ?? this.guid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      modifiedId: modifiedId ?? this.modifiedId,
      ownerId: ownerId ?? this.ownerId,
      apiArticleId: apiArticleId ?? this.apiArticleId,
      sourceId: sourceId ?? this.sourceId,
      authorName: authorName ?? this.authorName,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      ingestedAt: ingestedAt ?? this.ingestedAt,
      isFeatured: isFeatured ?? this.isFeatured,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (modifiedId.present) {
      map['modified_id'] = Variable<String>(modifiedId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (apiArticleId.present) {
      map['api_article_id'] = Variable<String>(apiArticleId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (ingestedAt.present) {
      map['ingested_at'] = Variable<DateTime>(ingestedAt.value);
    }
    if (isFeatured.present) {
      map['is_featured'] = Variable<bool>(isFeatured.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('guid: $guid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('modifiedId: $modifiedId, ')
          ..write('ownerId: $ownerId, ')
          ..write('apiArticleId: $apiArticleId, ')
          ..write('sourceId: $sourceId, ')
          ..write('authorName: $authorName, ')
          ..write('title: $title, ')
          ..write('slug: $slug, ')
          ..write('description: $description, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('ingestedAt: $ingestedAt, ')
          ..write('isFeatured: $isFeatured, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ArticleDatabase extends GeneratedDatabase {
  _$ArticleDatabase(QueryExecutor e) : super(e);
  _$ArticleDatabaseManager get managers => _$ArticleDatabaseManager(this);
  late final $SourcesTable sources = $SourcesTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sources, articles];
}

typedef $$SourcesTableInsertCompanionBuilder = SourcesCompanion Function({
  Value<String?> id,
  Value<String?> name,
  Value<String?> url,
  Value<String?> image,
  Value<String?> description,
  Value<String?> category,
  Value<String?> language,
  Value<String?> country,
  Value<int> rowid,
});
typedef $$SourcesTableUpdateCompanionBuilder = SourcesCompanion Function({
  Value<String?> id,
  Value<String?> name,
  Value<String?> url,
  Value<String?> image,
  Value<String?> description,
  Value<String?> category,
  Value<String?> language,
  Value<String?> country,
  Value<int> rowid,
});

class $$SourcesTableTableManager extends RootTableManager<
    _$ArticleDatabase,
    $SourcesTable,
    SourceData,
    $$SourcesTableFilterComposer,
    $$SourcesTableOrderingComposer,
    $$SourcesTableProcessedTableManager,
    $$SourcesTableInsertCompanionBuilder,
    $$SourcesTableUpdateCompanionBuilder> {
  $$SourcesTableTableManager(_$ArticleDatabase db, $SourcesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SourcesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SourcesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$SourcesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SourcesCompanion(
            id: id,
            name: name,
            url: url,
            image: image,
            description: description,
            category: category,
            language: language,
            country: country,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SourcesCompanion.insert(
            id: id,
            name: name,
            url: url,
            image: image,
            description: description,
            category: category,
            language: language,
            country: country,
            rowid: rowid,
          ),
        ));
}

class $$SourcesTableProcessedTableManager extends ProcessedTableManager<
    _$ArticleDatabase,
    $SourcesTable,
    SourceData,
    $$SourcesTableFilterComposer,
    $$SourcesTableOrderingComposer,
    $$SourcesTableProcessedTableManager,
    $$SourcesTableInsertCompanionBuilder,
    $$SourcesTableUpdateCompanionBuilder> {
  $$SourcesTableProcessedTableManager(super.$state);
}

class $$SourcesTableFilterComposer
    extends FilterComposer<_$ArticleDatabase, $SourcesTable> {
  $$SourcesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get country => $state.composableBuilder(
      column: $state.table.country,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter articlesRefs(
      ComposableFilter Function($$ArticlesTableFilterComposer f) f) {
    final $$ArticlesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.articles,
        getReferencedColumn: (t) => t.sourceId,
        builder: (joinBuilder, parentComposers) =>
            $$ArticlesTableFilterComposer(ComposerState(
                $state.db, $state.db.articles, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SourcesTableOrderingComposer
    extends OrderingComposer<_$ArticleDatabase, $SourcesTable> {
  $$SourcesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get country => $state.composableBuilder(
      column: $state.table.country,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ArticlesTableInsertCompanionBuilder = ArticlesCompanion Function({
  required String guid,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> modifiedId,
  required String ownerId,
  Value<String?> apiArticleId,
  Value<String?> sourceId,
  Value<String?> authorName,
  Value<String?> title,
  Value<String?> slug,
  Value<String?> description,
  Value<String?> summary,
  Value<String?> content,
  Value<String?> imageUrl,
  Value<String?> videoUrl,
  Value<DateTime?> publishedAt,
  Value<DateTime?> ingestedAt,
  Value<bool> isFeatured,
  Value<int> rowid,
});
typedef $$ArticlesTableUpdateCompanionBuilder = ArticlesCompanion Function({
  Value<String> guid,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> modifiedId,
  Value<String> ownerId,
  Value<String?> apiArticleId,
  Value<String?> sourceId,
  Value<String?> authorName,
  Value<String?> title,
  Value<String?> slug,
  Value<String?> description,
  Value<String?> summary,
  Value<String?> content,
  Value<String?> imageUrl,
  Value<String?> videoUrl,
  Value<DateTime?> publishedAt,
  Value<DateTime?> ingestedAt,
  Value<bool> isFeatured,
  Value<int> rowid,
});

class $$ArticlesTableTableManager extends RootTableManager<
    _$ArticleDatabase,
    $ArticlesTable,
    ArticleData,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableProcessedTableManager,
    $$ArticlesTableInsertCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder> {
  $$ArticlesTableTableManager(_$ArticleDatabase db, $ArticlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ArticlesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ArticlesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ArticlesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> guid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> modifiedId = const Value.absent(),
            Value<String> ownerId = const Value.absent(),
            Value<String?> apiArticleId = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> authorName = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<DateTime?> publishedAt = const Value.absent(),
            Value<DateTime?> ingestedAt = const Value.absent(),
            Value<bool> isFeatured = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticlesCompanion(
            guid: guid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            modifiedId: modifiedId,
            ownerId: ownerId,
            apiArticleId: apiArticleId,
            sourceId: sourceId,
            authorName: authorName,
            title: title,
            slug: slug,
            description: description,
            summary: summary,
            content: content,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            publishedAt: publishedAt,
            ingestedAt: ingestedAt,
            isFeatured: isFeatured,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String guid,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> modifiedId = const Value.absent(),
            required String ownerId,
            Value<String?> apiArticleId = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> authorName = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<DateTime?> publishedAt = const Value.absent(),
            Value<DateTime?> ingestedAt = const Value.absent(),
            Value<bool> isFeatured = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticlesCompanion.insert(
            guid: guid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            modifiedId: modifiedId,
            ownerId: ownerId,
            apiArticleId: apiArticleId,
            sourceId: sourceId,
            authorName: authorName,
            title: title,
            slug: slug,
            description: description,
            summary: summary,
            content: content,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            publishedAt: publishedAt,
            ingestedAt: ingestedAt,
            isFeatured: isFeatured,
            rowid: rowid,
          ),
        ));
}

class $$ArticlesTableProcessedTableManager extends ProcessedTableManager<
    _$ArticleDatabase,
    $ArticlesTable,
    ArticleData,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableProcessedTableManager,
    $$ArticlesTableInsertCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder> {
  $$ArticlesTableProcessedTableManager(super.$state);
}

class $$ArticlesTableFilterComposer
    extends FilterComposer<_$ArticleDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer(super.$state);
  ColumnFilters<String> get guid => $state.composableBuilder(
      column: $state.table.guid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get modifiedId => $state.composableBuilder(
      column: $state.table.modifiedId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ownerId => $state.composableBuilder(
      column: $state.table.ownerId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get apiArticleId => $state.composableBuilder(
      column: $state.table.apiArticleId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get authorName => $state.composableBuilder(
      column: $state.table.authorName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get slug => $state.composableBuilder(
      column: $state.table.slug,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get summary => $state.composableBuilder(
      column: $state.table.summary,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get videoUrl => $state.composableBuilder(
      column: $state.table.videoUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get ingestedAt => $state.composableBuilder(
      column: $state.table.ingestedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFeatured => $state.composableBuilder(
      column: $state.table.isFeatured,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SourcesTableFilterComposer get sourceId {
    final $$SourcesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $state.db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SourcesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sources, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ArticlesTableOrderingComposer
    extends OrderingComposer<_$ArticleDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get guid => $state.composableBuilder(
      column: $state.table.guid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get modifiedId => $state.composableBuilder(
      column: $state.table.modifiedId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ownerId => $state.composableBuilder(
      column: $state.table.ownerId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get apiArticleId => $state.composableBuilder(
      column: $state.table.apiArticleId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get authorName => $state.composableBuilder(
      column: $state.table.authorName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get slug => $state.composableBuilder(
      column: $state.table.slug,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get summary => $state.composableBuilder(
      column: $state.table.summary,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get videoUrl => $state.composableBuilder(
      column: $state.table.videoUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get ingestedAt => $state.composableBuilder(
      column: $state.table.ingestedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFeatured => $state.composableBuilder(
      column: $state.table.isFeatured,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SourcesTableOrderingComposer get sourceId {
    final $$SourcesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $state.db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SourcesTableOrderingComposer(ComposerState(
                $state.db, $state.db.sources, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$ArticleDatabaseManager {
  final _$ArticleDatabase _db;
  _$ArticleDatabaseManager(this._db);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
}
