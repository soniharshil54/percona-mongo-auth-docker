#!/bin/bash
set -e

echo "custom-user-v2 script run";

touch testfile.txt;

mongo <<EOF
use admin 

// Create an administrative user to manage database users:
db.createUser({ user: 'rootUser', pwd: 'z336!RW#6exk', roles: ['userAdminAnyDatabase'] })

// Authorize as that user to verify the password:
db.auth({ user: 'rootUser', pwd: 'z336!RW#6exk' })

// Create a service user for Repository (to be used in code):
db.createUser(
    {
        user: 'nexusUser',
        pwd: 'X3H4!4wQA8c$',
        roles: [
            { role: "dbOwner", db: "nexusDB" },
        ]
    }
)

// Create a read only user for reporting uses:
db.createUser(
    {
        user: 'nexusClient',
        pwd: 'f*57QJmj2Vm$',
        roles: [
            { role: "read", db: "nexusDB" },
        ]
    }
)

EOF