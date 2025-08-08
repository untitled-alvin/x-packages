# System Patterns

## Architecture
The `universal_datastore` package will follow a modular, feature-driven architecture. Each datastore (e.g., "Articles", "Users") will be a self-contained module with its own models, repositories, and services. This will allow developers to import only the datastores they need, keeping the package lightweight and extensible.

## Core Components
- **Datastore:** An interface that defines the common methods for all datastores (e.g., `get`, `put`, `putAll`).
- **DriftDatabase:** A class that defines the Drift database and its tables.
- **Models:** Dart classes that represent the data structures for each datastore.
- **Tables:** Drift table definitions.
