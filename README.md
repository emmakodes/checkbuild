## checkbuild
This repository is designed to assist in testing whether a model can be fetched successfully and if the packages in the Dockerfile function correctly for both linux/amd64 and linux/arm64 architectures, all within the context of your forked version of the model. This allows you to test these functionalities without having open a PR or wait for your pull request to be merged.

## To utilize this repository, follow these steps:

- Copy the files "local-test-model.yml" and "local-test-build.yml" to your "github/workflows" directory.
- Run `git add .` on the terminal
- Use the command `git commit -m "local test"` to trigger the workflows defined in "local-test-model.yml" and "local-test-build.yml".
- `git push`
- Check the outcome of the workflow from your Actions tab on GitHub

<br><br>


## local-test-build.yml file
This YAML file defines a workflow named "Local model build Test for linux/amd64 and linux/arm64" that is triggered on a push event to the 'main' branch and can also be manually triggered using the workflow_dispatch event.

The workflow consists of a single job named "test_linux_amd64_and_amr64_build" that runs on the latest version of Ubuntu. The job is conditional and will only run if the commit message contains the string 'local test'.

Here's a breakdown of the steps performed in the job:

- Set up QEMU: This step uses the "docker/setup-qemu-action" action to set up QEMU. QEMU is a generic and open-source machine emulator and virtualizer.
- Set up Docker Buildx: This step uses the "docker/setup-buildx-action" action to set up Docker Buildx. Buildx is a CLI plugin for Docker that provides additional features for building multi-platform images.
- Checkout persist credentials: This step uses the "actions/checkout" action to checkout the source code of the repository. It disables persisting credentials and sets the fetch depth to 0.
- Generate the Dockerfile: This step utilizes the Python script local_place_a_dockerfile_in_current_eos_repo.py, located within this repository, to dynamically generate a Dockerfile. The script facilitates the download of build_test_dockerfile, which fetches your model from the repository while displaying the size of the checkpoints folder. Additionally, this step installs the 'requests' library via pip and proceeds to execute with the repository name and URL as arguments.
- Build: This step uses the "docker/build-push-action" action to build but not push Docker images. The action is configured with the current directory as the build context and specifies the target platforms as Linux on AMD64 and ARM64. The Dockerfile used for the build is named "build_test_dockerfile".

Overall, this workflow sets up the necessary environment, generates a Dockerfile, and builds Docker images for the specified platforms when triggered by a push event with a specific commit message or manually through the GitHub Actions interface.

