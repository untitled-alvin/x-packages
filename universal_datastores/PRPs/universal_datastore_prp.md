# Product Requirements Prompt (PRP)

## 1\. Overview

  - **Feature Name:** Universal Datastore Dart Package

  - **Objective:** To create a robust, reusable, and easily manageable Dart package (`universal_datastore`) for generating and consuming mock data using Isar, accelerating frontend development and improving testability.

  - **Why:** This package solves the problem of UI development being blocked by unavailable backend APIs by providing a stable, controllable, and fast local data source. It enhances testability by offering consistent data for unit and integration tests and improves development flexibility by allowing easy simulation of various data states.

## 2\. Success Criteria

This feature will be considered complete when the following conditions are met. These must be specific and measurable.

  - [x] The code runs without errors.

  - [x] All new unit tests pass.

  - [x] The feature meets all functional requirements described below.

  - [x] The code adheres to the project standards defined in `GEMINI.md`.

  - [x] The `universal_datastore` package successfully integrates with Isar for efficient data storage and retrieval.

  - [x] The package supports generating and populating datastores from external JSON mock data files.

  - [x] A clear, intuitive, and interactive API is provided for standard CRUD (Create, Read, Update, Delete) operations on datastores.

  - [x] The package includes pre-built datastores for at least "Articles" and "Notifications" with their respective models and APIs.

  - [x] The package demonstrates a modular design, allowing developers to include only necessary datastore components.

  - [x] An example Flutter application is provided, demonstrating the package's usage for mock data generation and consumption.

  - [x] The package is ready for internal or public publishing (e.g., to pub.dev).

## 3\. Context & Resources

This section contains all the information needed to implement the feature correctly.

### 📚 External Documentation:

  - **Resource:** [https://engineering.verygood.ventures/](https://engineering.verygood.ventures/)

      - **Purpose:** Provides general Very Good Ventures (VGV) engineering standards, best practices, and conventions that the package should adhere to for code quality and maintainability.

  - **Resource:** [https://context7.com/vgventures/very\_good\_engineering/llms.txt](https://context7.com/vgventures/very_good_engineering/llms.txt)

      - **Purpose:** Contains up-to-date VGV documentation specifically relevant to LLMs and AI code editors, guiding the structure and principles of "The Rules" for AI code editors, which this package supports.

  - **Resource:** [https://context7.com/isar/isar/llms.txt](https://context7.com/isar/isar/llms.txt)

      - **Purpose:** Provides comprehensive documentation for the Isar database, which is the core persistence layer for the `universal_datastore` package. This resource will be critical for correct Isar integration, schema definition, and data operations.

### 💻 Internal Codebase Patterns:

  - **File:** N/A
  - **Reason:** This project is intended to establish the initial patterns and "Rules" for AI code editors and new Flutter package development within Very Good Ventures. There are no existing internal code snippets that serve as a direct pattern for this specific tool.

### ⚠️ Known Pitfalls:

  - Ensuring graceful handling of Isar schema migrations if data models evolve post-deployment.
  - Designing a highly reusable and intuitive API that balances flexibility with ease of use across various datastore types.
  - Optimizing performance for bulk mock data generation and retrieval, especially with large datasets.
  - Preventing naming collisions or architectural complexities as more specialized datastores are added to the package.

## 4\. Implementation Blueprint

This is the step-by-step plan for building the feature.

### Proposed File Structure:

```
universal_datastore/
├── lib/
│   ├── src/
│   │   ├── database/                          (new: Isar collections/schemas for common datastores)
│   │   │   ├── database_operations.dart    (new: An interface for standardized database operations.)
│   │   │   ├── isar_database.dart          (new: Handles Isar instance, open/close, collection access, global datastore management,  operations handling with    metrics and logging.)
│   │   │   └── record.dart                  (new: Base model for all Isar collections)
│   │   ├── datastores/                      (new: Specific datastore implementations)
│   │   │   ├── article/                      (new: For articles domain)
│   │   │   │   ├── article.dart              (new: Isar schema for articles)
│   │   │   │   └── article_datastore.dart    (new: Specific datastore for articles)
│   │   │   ├── notification/                  (new: For notification domain)
│   │   │   │   ├── notification.dart          (new: Isar schema for notifications)
│   │   │   │   └── notification_datastore.dart     (new: Specific datastore for notifications)
│   │   │   └── datastores.dart               (new: Barrel file for all datastores)
│   │   ├── generators/                      (new: Mock data generation utilities)
│   │   │   └── mock_data_generator.dart     (new: Logic to load JSON into Isar)
│   │   ├── exception.dart                    (new: Exception handling for the package)
│   │   └── universal_datastore.dart         (modified: Package entry point, exports)
│   └── universal_datastore.dart              (modified: Top-level library export)
├── test/
│   ├── src/
│   │   ├── datastores/
│   │   │   ├── article/                      (new)
│   │   │   │   ├── article_test.dart              (new)
│   │   │   │   └── article_datastore_test.dart    (new)
│   │   └── generators/                      (new)
│   │       └── mock_data_generator_test.dart(new)
│   └── universal_datastore_test.dart        (new)
├── pubspec.yaml                             (modified)
└── README.md                                (modified)
```

### Task Breakdown:

**Task 1: Project Setup & Core Dependencies**

  - Initialize a new Flutter package project: `very_good create dart_package universal_datastores`.
  - Add necessary dependencies to `pubspec.yaml`: `isar`, `isar_flutter_libs`, `path_provider`, `json_annotation`, `json_serializable`, `build_runner`.
  - Configure `build.yaml` for `json_serializable` and Isar code generation.

**Task 2: Isar Service & Base Model Implementation**

  - Define `Record` as a base abstract class or mixin for all Isar collections, potentially including a common `id`, `modified_id`,
    `owner_id`, `created_at`, `updated_at` field.
  - Define `Exception` have common error `internal_error`, `unexpected`, `internal_error`, `bad_request`, `not_found`, `invalid_argument`.
  - Implement `IsarDatabase` in `lib/src/database/isar_database.dart` responsible for:
      - Initializing and opening the Isar database.
      - Managing database instances (e.g., singleton or dependency injection).
      - Exposing access to registered Isar collections.
      - define generic read, write, ..., operations with common metrics and logging, handle errors gracefully.
      - Handling database closing.

**Task 4: Mock Data Generation Logic**

  - Implement `MockDataGenerator` in `lib/src/generators/mock_data_generator.dart`.
  - This utility should:
      - Take a JSON string or file path as input.
      - Parse the JSON into a list of Dart objects (using `json_serializable` for model conversion).
      - Use the `IsarDatabase`'s to bulk insert the parsed data into the relevant Isar collection.

<!-- end list -->

```dart
// Pseudocode for MockDataGenerator
class MockDataGenerator {
  final Isar isar; // Injected Isar instance

  MockDataGenerator(this.isar);

  Future<void> populateCollection<T extends Record>(
    String jsonString,
    CollectionSchema<T> schema, // Isar schema for the collection
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final List<T> items = jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();

    await isar.writeTxn(() async {
      await isar.collection<T>(schema.name).putAll(items);
    });
  }
}
```

**Task 5: Specific Articlestore Implementations for Article Domain**

  - Create `Article` in `lib/src/datastore/article/` using `@[collection]` and `@[Id()]` annotations for Isar, and `@[JsonSerializable()]` for mock data generation.
  - Implement `Articlestore` in `lib/src/datastore/article/`.
  - Add any domain-specific query methods or business logic to these specific datastores (e.g., `getArticles({ArticleQueryParams? params})`, ...).

**Task 6: Documentation**

  - Update `README.md` with package overview, installation instructions, and basic usage examples.

## 5\. Validation Plan

How we will verify the implementation is correct.

### Unit Tests:

  - `test_isar_database()`: Verify Isar database operations, opens and closes without errors, and collections are accessible.
  - `test_mock_data_generator_from_json()`: Ensure mock data from a JSON string is correctly parsed and inserted into an Isar collection.
  - `test_article_datastore_specific_queries()`: Test domain-specific methods on `Articlestore` (e.g., filtering, custom queries).
  - `test_datastore_modularity_and_independence()`: Confirm that individual datastores can be initialized and used independently without affecting others.
