# System Patterns

## Architecture
The `universal_datastore` package will follow a modular, feature-driven architecture. Each datastore (e.g., "Articles", "Users") will be a self-contained module with its own models, repositories, and services. This will allow developers to import only the datastores they need, keeping the package lightweight and extensible.

## Core Components
- **UniversalDatastore:** The main entry point for the package. It will provide methods for initializing datastores and accessing them.
- **Datastore:** An interface that defines the common methods for all datastores (e.g., `getAll`, `getById`, `create`, `update`, `delete`).
- **IsarService:** A wrapper around the Isar database that handles all data storage and retrieval operations.
- **Models:** Dart classes that represent the data structures for each datastore.
- **JSON data files:** External JSON files that contain the mock data to be loaded into the datastores.
