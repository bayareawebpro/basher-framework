#!/usr/bin/env bash

date:humanized; func:success && logger:success "Yay.";


echo "Humanized: $(date:humanized)"
echo "Timestamp: $(date:timestamp)"
echo "Filename: $(date:filename)"

