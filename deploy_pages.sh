#!/usr/bin/env bash
set -Eeuo pipefail

# DEBUG helpers
log() { echo "[deploy_pages] $*"; }
die() { echo "[deploy_pages][ERROR] $*" >&2; exit 1; }

# Config
BASE_HREF=${BASE_HREF:-"/country_search/"}
BUILD_DIR="example/build/web"

# Ensure we are at repo root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

current_branch="$(git rev-parse --abbrev-ref HEAD)"
log "Current branch: $current_branch"

# Ensure clean working tree unless FORCE=1
if [[ "${FORCE:-0}" != "1" ]]; then
  if [[ -n "$(git status --porcelain)" ]]; then
    die "Working tree not clean. Commit or stash changes, or run with FORCE=1"
  fi
fi

log "Building web app with base-href: $BASE_HREF"
pushd example >/dev/null
  flutter clean
  rm -rf build .dart_tool
  flutter pub get
  flutter build web --release --base-href "$BASE_HREF"
popd >/dev/null

# Stash build into a temporary directory because switching branch will change files
TMP_DIR="$(mktemp -d)"
log "Copying build to temp: $TMP_DIR"
cp -R "$BUILD_DIR"/. "$TMP_DIR"/

log "Switching to gh-pages"
if git show-ref --verify --quiet refs/heads/gh-pages; then
  git checkout gh-pages
else
  git checkout -b gh-pages || die "Failed to create gh-pages"
fi
git pull --ff-only || true

log "Clearing gh-pages tracked files"
git ls-files -z | xargs -0 git rm -f -q || true

log "Copying fresh build to gh-pages root"
cp -R "$TMP_DIR"/. .

# SPA fallback for deep links
if [[ -f index.html ]]; then
  cp index.html 404.html
fi

log "Committing and pushing to origin/gh-pages"
git add -A
git commit -m "deploy(pages): fresh build" || log "Nothing to commit"
git push origin gh-pages

log "Returning to $current_branch"
git checkout "$current_branch"

log "Cleanup temp: $TMP_DIR"
rm -rf "$TMP_DIR"

log "Done. Visit: https://stanislavworldin.github.io/country_search/"


