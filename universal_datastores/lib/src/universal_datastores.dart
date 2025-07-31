// /// The main entry point for the universal datastores package.
// ///
// /// This class is responsible for managing the different datastores that are
// /// available in the application.
// class UniversalDatastore {
//   factory UniversalDatastore() => _instance;
//   UniversalDatastore._internal();
//   static final UniversalDatastore _instance = UniversalDatastore._internal();

//   late final Isar isar;

//   final Map<Type, IDatastore<dynamic>> _datastores =
//       <Type, IDatastore<dynamic>>{};

//   /// Initializes Isar and registers the given schemas.
//   Future<void> init(List<CollectionSchema<dynamic>> schemas) async {
//     final dir = await getApplicationDocumentsDirectory();
//     isar = await Isar.open(
//       schemas,
//       directory: dir.path,
//     );
//   }

//   /// Registers a datastore for the given type `T`.
//   void register<T>(IDatastore<T> datastore) {
//     _datastores[T] = datastore;
//   }

//   /// Returns the datastore for the given type `T`.
//   ///
//   /// Throws an exception if no datastore is registered for the given type.
//   IDatastore<T> get<T>() {
//     final datastore = _datastores[T];
//     if (datastore == null) {
//       throw Exception('No datastore registered for type $T');
//     }
//     return datastore as IDatastore<T>;
//   }

//   /// Returns an Isar-backed datastore for the given type `T`.
//   IsarDatastore<T> getIsarDatastore<T>() {
//     return IsarDatastore<T>(isar);
//   }
// }
