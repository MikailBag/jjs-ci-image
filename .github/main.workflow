workflow "New workflow" {
  on = "push"
  resolves = ["Docker:Upload"]
}

action "Docker:Login" {
  uses = "actions/docker/login@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker:Build" {
  uses = "docker:stable"
  needs = ["Docker:Login"]
  runs = "sh ./run-build.sh"
}

action "Docker:Upload" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "push mikailbag/jjs-dev:${GITHUB_COMMIT_SHA}"
  needs = ["Docker:Build"]
}
