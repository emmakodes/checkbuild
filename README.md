## checkbuild
This repository is designed to assist in testing whether a model can be fetched successfully and if the packages in the Dockerfile function correctly for both linux/amd64 and linux/arm64 architectures, all within the context of your forked version of the model. This allows you to test these functionalities without having to open a PR or wait for your pull request to be merged.

## To utilize this repository, follow these steps:

- Copy the files "local-test-model.yml" and "local-test-build.yml" to your model's "github/workflows" directory.
- Run `git add .` on the terminal to add latest changes in the working directory to the staging area
- Use the command `git commit -m "local test"` to trigger the workflows defined in "local-test-model.yml" and "local-test-build.yml".
- Run `git push` on the terminal to push your changes to GitHub
- Check the outcome of the workflow from your Actions tab on GitHub

<br><br><br><br>


## local-test-build.yml file
This YAML file defines a workflow named "Local model build Test for linux/amd64 and linux/arm64" that is triggered on a push event to the 'main' branch and can also be manually triggered using the workflow_dispatch event.

The workflow consists of a single job named "test_linux_amd64_and_amr64_build" that runs on the latest version of Ubuntu. The job is conditional and will only run if the commit message contains the string 'local test'.

Here's a breakdown of the steps performed in the job:

- Set up QEMU: This step uses the "docker/setup-qemu-action" action to set up QEMU. QEMU is a generic and open-source machine emulator and virtualizer.
- Set up Docker Buildx: This step uses the "docker/setup-buildx-action" action to set up Docker Buildx. Buildx is a CLI plugin for Docker that provides additional features for building multi-platform images.
- Checkout persist credentials: This step uses the "actions/checkout" action to checkout the source code of the repository. It disables persisting credentials and sets the fetch depth to 0.
- Generate the Dockerfile: This step utilizes the Python script local_place_a_dockerfile_in_current_eos_repo.py, located within this repository, to dynamically generate a Dockerfile. The script facilitates the download of build_test_dockerfile located on this repository, which fetches your model from the repository while displaying the size of the checkpoints folder. Additionally, this step installs the 'requests' library via pip and proceeds to execute with the repository name and URL as arguments.
- Build: This step uses the "docker/build-push-action" action to build but not push Docker images. The action is configured with the current directory as the build context and specifies the target platforms as Linux on AMD64 and ARM64. The Dockerfile used for the build is named "build_test_dockerfile".

Overall, this workflow sets up the necessary environment, generates a Dockerfile, and builds Docker images for the specified platforms when triggered by a push event with a specific commit message or manually through the GitHub Actions interface.



<br><br><br>
## local-test-model.yml file
This YAML file is a configuration file for a GitHub Actions workflow.

Let's break down the code:

- The name field specifies the name of the workflow.
- The on field specifies the events that trigger the workflow. In this case, the workflow is triggered on push events to the main branch and manual triggering using the workflow dispatch event.
- The jobs field defines one or more jobs that will be executed as part of the workflow. In this case, there is a single job named test.
- The if field within the test job specifies a conditional expression that determines whether the job should run or not. It checks if the repository is not equal to 'ersilia-os/eos-template' and if the commit message contains the string 'local test'.
- The runs-on field specifies the type of machine or environment on which the job will run. In this case, it runs on an Ubuntu latest environment.
- The steps field defines a sequence of steps to be executed within the job.
Each step has a name field that provides a description of the step.
- The run field contains the shell commands to be executed for that step.
- The uses field specifies an action to be used for that step. Actions are reusable units of code that can be executed as part of a workflow. They are defined by other users or organizations and can be referenced using their GitHub repository and version.
- The with field provides additional configuration or inputs for a step.



Here is a summary of what each step does:

- Checks out the repository cod
- Adds Conda (a package and environment manager) to the system's PATH.
- Sources Conda environment configurations.
- Installs dependencies like git-lfs and gh (GitHub CLI) using Conda.
- Installs the Ersilia from git+https://github.com/ersilia-os/ersilia.git using pip.
- Fetches, serves and predicts the output of a model identified by the repository name.
- Samples an input.csv file with a single input using ersilia.
- Measures the execution time to predict a single input using ersilia.
- Samples an input.csv file with 10 inputs using ersilia.
- Measures the execution time to predict 10 inputs using ersilia.
- Samples an input.csv file with 100 inputs using ersilia.
- Measures the execution time to predict 100 inputs using ersilia.
- Closes the ersilia process.
- Uploads the console.log file as an artifact for debugging purposes.
  
Overall, this YAML file sets up a workflow that performs various actions, such as installing dependencies, executing the ersilia package for model testing and prediction, and generating logs for debugging.
