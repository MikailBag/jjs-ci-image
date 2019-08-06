workflow "JJS Docker image" {
  on = "push"
  resolves = ["Docker:Upload"]
}

action "Docker:Login" {
  uses = "actions/docker/login@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker:Build" {
  uses = "docker://docker:stable"
  needs = ["Docker:Login"]
  runs = "sh ./run-build.sh"
}

action "Docker:Upload" {
  uses = "docker://docker:stable"
  runs = "sh run-upload.sh"
  needs = ["Docker:Build"]
}
