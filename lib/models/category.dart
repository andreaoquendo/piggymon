final String tableCategories = 'categories';

class CategoryFields {
  static final List<String> values = [
    accountId, id, name
  ];

  static final String accountId = '_accountId';
  static final String id = '_id';
  static final String name = 'name';
}
class Category{
  final int accountId;
  final int? id;
  final String name;

  const Category({
    required this.accountId,
    this.id,
    required this.name
  });

  Category copy({
    int? accountId,
    int? id,
    String? name,
  }) => Category(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    name: name ?? this.name
  );

  Map<String, Object?> toJson() => {
    CategoryFields.id: id,
    CategoryFields.accountId: accountId,
    CategoryFields.name: name
  };

  static Category fromJson(Map<String, Object?> json) => Category(
    id: json[CategoryFields.id] as int,
    accountId: json[CategoryFields.accountId] as int,
    name: json[CategoryFields.name] as String
  );
}