# monorelease


GITHUB_TOKEN=$(gh auth token) goreleaser release -f foo-test/.goreleaser.yaml --verbose --clean --parallelism 1 --nightly
