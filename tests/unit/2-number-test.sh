#!/usr/bin/env bash
(num:is:equal 1 1 && logger:success "num:is:equal") || logger:failed "num:is:equal"
(num:not:equal 1 2 && logger:success "num:not:equal") || logger:failed "num:not:equal"
(num:less:than 0 1 && logger:success "num:less:than") || logger:failed "num:less:than"
(num:greater:than 3 2 && logger:success "num:greater:than") || logger:failed "num:greater:than"
(num:less:than:or:equal 1 2 && logger:success "num:less:than:or:equal") || logger:failed "num:less:than:or:equal"
(num:greater:than:or:equal 3 2 && logger:success "num:greater:than:or:equal") || logger:failed "num:greater:than:or:equal"