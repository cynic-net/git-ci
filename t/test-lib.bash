load 'bats-assert/load'
load 'bats-support/load'

# utilities/settings
# ------------------

testing_harness='tmp/test'

init_repo() {
    local repo_num="$1"
    local test_repo="$testing_harness/repo$repo_num"
    rm -rf "$test_repo"
    git clone --quiet t/fixtures/repo$repo_num.git "$test_repo"
    cd "$test_repo"
    git config --local remote.origin.fetch '+refs/ci/*:refs/ci/*'
    git fetch --quiet
}