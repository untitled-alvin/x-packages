# Progress

## What Works
- The project has been successfully refactored to use Drift as the local database.
- The `ArticleDatastore` has been implemented with basic CRUD operations.
- The `README.md` and `projectbrief.md` have been updated.
- The code has been documented following VGV standards.

## What's Left to Build
- An example Flutter application demonstrating the package's usage.

## Current Status
The project is in a stable state, but the unit tests for the `ArticleDatastore` are currently failing.

## Known Issues
- The unit tests for `put`, `putAll`, and `put with source` in `article_datastore_test.dart` are failing due to issues with mocking `drift`'s `Batch` operations using `mocktail`. The `verify` calls are not matching the actual invocations.