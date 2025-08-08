# Product Requirements Prompt (PRP)

## 1\. Overview

  - **Feature Name:** Universal Datastore Dart Package

  - **Objective:** To create a robust, reusable, and easily manageable Dart package (`universal_datastore`) for generating and consuming mock data using Drift, accelerating frontend development and improving testability.

  - **Why:** This package solves the problem of UI development being blocked by unavailable backend APIs by providing a stable, controllable, and fast local data source. It enhances testability by offering consistent data for unit and integration tests and improves development flexibility by allowing easy simulation of various data states.

## 2\. Success Criteria

This feature will be considered complete when the following conditions are met. These must be specific and measurable.

  - [x] The code runs without errors.

  - [x] All new unit tests pass.

  - [x] The feature meets all functional requirements described below.

  - [x] The code adheres to the project standards defined in `GEMINI.md`.

  - [x] The `universal_datastore` package successfully integrates with Drift for efficient data storage and retrieval.

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

  - **Resource:** [https://drift.simonbinder.eu/docs/](https://drift.simonbinder.eu/docs/)

      - **Purpose:** Provides comprehensive documentation for the Drift database, which is the core persistence layer for the `universal_datastore` package. This resource will be critical for correct Drift integration, schema definition, and data operations.

### 💻 Internal Codebase Patterns:

  - **File:** N/A
  - **Reason:** This project is intended to establish the initial patterns and "Rules" for AI code editors and new Flutter package development within Very Good Ventures. There are no existing internal code snippets that serve as a direct pattern for this specific tool.

### ⚠️ Known Pitfalls:

  - Ensuring graceful handling of Drift schema migrations if data models evolve post-deployment.
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
│   │   ├── article_datastore/
│   │   │   ├── article_datastore.dart
│   │   │   ├── article_datastore_api.dart
│   │   │   ├── database.dart
│   │   │   ├── database.g.dart
│   │   │   ├── tables.dart
│   │   │   └── models/
│   │   │       ├── article_query_params.dart
│   │   │       ├── article.dart
│   │   │       ├── article.g.dart
│   │   │       ├── author.dart
│   │   │       ├── author.g.dart
│   │   │       ├── models.dart
│   │   │       ├── source.dart
│   │   │       └── source.g.dart
│   │   └── datastore.dart
│   └── universal_datastores.dart
├── test/
│   └── src/
│       └── article_datastore_test.dart
├── pubspec.yaml
└── README.md
```

### Task Breakdown:

**Task 1: Project Setup & Core Components**

  - Set up a new Dart package with the necessary dependencies, including `drift`, `path_provider`, `sqlite3_flutter_libs`, `json_annotation`, `drift_dev`, and `build_runner`.
  - Define the core `Datastore` class and the `ArticlesDatastoreApi` interface.
  - Implement the `Article` model and the `ArticleDatastore` class.

**Task 2: API Development and Testing**

  - Implement the `ArticlesDatastoreApi` with methods for CRUD operations.
  - Write unit tests for the `ArticleDatastore` and `ArticlesDatastoreApi`.
  - Create an example Flutter application to demonstrate the package's usage.

**Task 3: Documentation and Publishing**

  - Write comprehensive documentation for the package, including an example and a tutorial.
  - Publish the package to pub.dev.

## 5\. Validation Plan

How we will verify the implementation is correct.

### Unit Tests:

  - `test_article_datastore_crud_operations()`: Verify basic CRUD operations (create, read, update, delete) on articles.
  - `test_article_datastore_search_queries()`: Test various search queries, including filtering by source, text search, and sorting.
  - `test_article_datastore_pagination()`: Ensure pagination works correctly with offset and limit.
  - `test_article_datastore_error_handling()`: Verify error handling for cases like not found articles.
