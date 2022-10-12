#!/bin/bash
set -e;

# a default non-root role
MONGO_NON_ROOT_ROLE="readWrite"

"${mongo[@]}" "admin" <<-EOJS
    db.createUser({
        user: $(_js_escape "$MONGO_NON_ROOT_USERNAME"),
        pwd: $(_js_escape "$MONGO_NON_ROOT_PASSWORD"),
        roles: [ { role: $(_js_escape "$MONGO_NON_ROOT_ROLE"), db: "admin" } ]
        })
EOJS