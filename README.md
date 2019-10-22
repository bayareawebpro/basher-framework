# Bash Profile Framework

# Logger

https://devhints.io/bash

```
#logger:divider
#logger:success "WorkingPath: $TEST_DIR"
#logger:info "Testing ready to start."
#logger:warning "Testing failing..."
#logger:error "Testing failed!"
#logger:debug "Hmmm..."
#logger:blank
```


```
echo "# git-test-output" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:bayareawebpro/git-test-output.git
git push -u origin master

…or push an existing repository from the command line

git remote add origin git@github.com:bayareawebpro/git-test-output.git
git push -u origin master
```