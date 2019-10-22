# Bash Profile Framework

## Create Repo in CWD
```
git:setup
```

## Set Origin to Master
CWD name must match repo name
```
git:connect
```

## Ignore & ReadMe
Created if doesn't exist.
```
git:ignore
git:readme
```

## Save (push)
```
git:save "custom message"
git:save (uses "wip" when no argument specified)
```

## Sync (pull)
```
git:sync
```


## Branch
Full
```
git:branch dev
```
Fresh
```
git:branch gh-pages fresh
```
Switching
```
git:switch master
```
Deleting
```
git:branch:delete dev
```

## Reset
Revert to Head (Hard)
```
git:reset
```

#### Logger
```
logger:divider
===================================================================================================
```

```
logger:success "Cool!"
✅ Cool! (green text)
```

```
logger:info "Testing ready to start."
🤖 Testing ready to start. (blue text)
```

```
logger:warning "Tests failing..."
⚠️ Tests failing... (yellow text)
```

```
logger:warning "Testing failed!"
🤬 Testing failed! (red text)
```

```
logger:debug "Hmmm..."
Hmmm... (grey text)
```

```
logger:blank
(empty line)
```
