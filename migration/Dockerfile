FROM liquibase/liquibase:4.23.0-alpine

COPY liquibase.properties /liquibase/
COPY changelog-root.yml /liquibase/
COPY changelogs /liquibase/changelogs/

ENV SCHEMA_NAME = "public"
ENV DATABASE_URL = "host.docker.internal:5433/cryptopat"
ENV USERNAME = "pguser"
ENV PASSWORD = "pgpwd"
ENV COMMAND = ""

ENTRYPOINT liquibase --liquibase-schema-name=$SCHEMA_NAME --url=jdbc:postgresql://$DATABASE_URL --username=$USERNAME --password=$PASSWORD $COMMAND
