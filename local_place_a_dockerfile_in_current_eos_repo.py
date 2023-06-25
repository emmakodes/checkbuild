import os
import sys
import requests
import shutil

model_id = sys.argv[1]
repo_url = sys.argv[2]

if os.path.exists("build_test_dockerfile"):
    shutil.move("build_test_dockerfile", "build_test_Dockerfile_legacy")


def download_file(url, filename):
    r = requests.get(url, allow_redirects=True)
    open(filename, "wb").write(r.content)


url = "https://raw.githubusercontent.com/emmakodes/checkbuild/main/build_test_dockerfile"
filename = "build_test_dockerfile"
download_file(url, filename)

with open("build_test_dockerfile", "r") as f:
    text = f.read()

text = text.replace("eos_identifier", model_id)
text = text.replace("eos_repo", repo_url)

with open("build_test_dockerfile", "w") as f:
    f.write(text)