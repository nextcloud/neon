# Contributing

## Setup
This project uses an assortment of tools for the development.
Currently included are:
- [fvm](https://pub.dev/packages/fvm) for managing Flutter versions
- [melos](https://pub.dev/packages/melos) for managing packages in this monorepo
- [husky](https://pub.dev/packages/husky) for managing git hooks
- [commitlint_cli](https://pub.dev/packages/commitlint_cli) for validating commits according to the conventional commits specification

To set up all these tools run the `./tool/setup.sh` script.
Note that you need to have Dart installed and [`~/.pub-cache/bin/` needs to be in your PATH](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path) before running the script.

## Conventional commits
We use conventional commits to have meaningful commit messages and be able to generate changelogs.
A non-breaking feature contribution to `neon_notes` could look like this:
```bash
git commit -m "feat(neon_notes): Add a super cool feature."
```
You can read the full documentation at https://www.conventionalcommits.org.

## Tools
We maintain a collection of scripts in `./tool/`.
They range from setting up a local Nextcloud server (`./tool/dev.sh`) to generating assets.

## Monorepo
For easier development we use a monorepo structure.
This means that we have multiple packages in one git repository.
We use [melos](https://pub.dev/packages/melos) to manage the packages in this repository.

Take a look at our [melos.yaml](../melos.yaml) to find useful commands for running commands like build_runner or the analyzer in all packages.

## Linting
We use very strict static code analysis (also known as linting) rules.
This enables us to maintain and verify a consistent code style throughout the repository.
Please make sure your code passes linting.

You can read more about it on [dart.dev](https://dart.dev/tools/linter-rules).

## Testing
If you found a bug and are here to fix it, please make sure to also submit a test that validates that the bug is fixed.
This way we can make sure it will not be introduced again.

## Documentation
Whenever you are submitting new features make sure to also add documentation comments in the code.
Please adhere to the [effective-dart](https://dart.dev/effective-dart/documentation) documentation guidelines.
