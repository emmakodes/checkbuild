This repository is designed to assist in testing whether a model can be fetched successfully and if the packages in the Dockerfile function correctly for both linux/amd64 and linux/arm64 architectures, all within the context of your forked version of the model. This allows you to test these functionalities without having to wait for your pull request to be merged.

To utilize this repository, follow these steps:

- Copy the files "local-test-model.yml" and "local-test-build.yml" to your "github/workflows" directory.
- Use the command `git commit -m "local test"` to trigger the workflows defined in "local-test-model.yml" and "local-test-build.yml".
- `git push`
- Check the outcome of the workflow from your Actions tab on GitHub
