## Introduction

This repository contains a reproduction for https://github.com/prisma/prisma/issues/4442


## Version used

```
Environment variables loaded from prisma/.env
@prisma/cli          : 2.13.0-dev.80
@prisma/client       : 2.13.0-dev.80
Current platform     : debian-openssl-1.1.x
Query Engine         : query-engine dfc9594ba25725d1eb319314b9cb6a229aa43573 (at node_modules/@prisma/engines/query-engine-debian-openssl-1.1.x)
Migration Engine     : migration-engine-cli dfc9594ba25725d1eb319314b9cb6a229aa43573 (at node_modules/@prisma/engines/migration-engine-debian-openssl-1.1.x)
Introspection Engine : introspection-core dfc9594ba25725d1eb319314b9cb6a229aa43573 (at node_modules/@prisma/engines/introspection-engine-debian-openssl-1.1.x)
Format Binary        : prisma-fmt dfc9594ba25725d1eb319314b9cb6a229aa43573 (at node_modules/@prisma/engines/prisma-fmt-debian-openssl-1.1.x)
Studio               : 0.327.0
Preview Features     : uncheckedScalarInputs
```


## Steps

1. Clone this repo and install the dependencies
2. Change your credentials in prisma/.env
3. Restore dump.sql file to get an initial seed data which is required for the reproduction
4. Run `yarn start` to reproduce
