#!/bin/bash
function git:report() {
  logger:divider
  logger:info "Making Commit Report..."
  git log --after='last month' --date=short --pretty=format:'%h,%an,%ad,%s' > git-commit-log.csv
  logger:success "Commit Report Generated"
}