FROM wordpress:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        less \
        wget \
        default-mysql-client \
    && curl -fsSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        -o /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY wp-content/themes/idotinfra-theme /usr/src/idotinfra-theme
COPY setup /usr/src/setup
COPY db-export.sql /usr/src/db-export.sql
COPY deploy/render/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
