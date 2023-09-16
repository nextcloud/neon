# Workflows

## Adding a new package to the Neon project

If you need to add a new package to the Neon project pleae make sure to execute all the following steps:
1. Use the according template by running `fvm dart create -t package package_name` or `fvm flutter create -t package package_name`.
2. Make sure to activate our strict linting by adding it to the package.
3. Regenerate the dependency overrides by executing `melos bootstrap`.
4. Add a Symlink to our main [license](../LICENSE).
5. Update [commitlint.yaml](../commitlint.yaml) and [tool/build-app.sh](../tool/build-app.sh) by adding the new package name.