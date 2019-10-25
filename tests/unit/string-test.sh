#!/usr/bin/env bash
(string:is:empty "" && logger:success "string:is:empty") || logger:failed  "string:is:empty"
(string:not:empty "not empty" && logger:success "string:not:empty") || logger:failed "string:not:empty"
(string:is:equal "my-string" "my-string" && logger:success "string:is:equal") || logger:failed  "string:is:equal"
(string:not:equal "my-string" "other-string" && logger:success "string:not:equal") || logger:failed "string:not:equal"
(string:matches:regex "123" '^[0-9]+$' && logger:success "string:matches:regex true") || logger:failed  "string:matches:regex true"
(string:matches:regex "asd" '^[0-9]+$' || logger:success "string:matches:regex false") || logger:failed "string:matches:regex false"
