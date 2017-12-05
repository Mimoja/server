FROM node:latest

MAINTAINER Mimoja <git@mimoja.de>

WORKDIR /opt
RUN git clone https://github.com/ircanywhere/ircanywhere.git -b development --depth 1
WORKDIR ircanywhere

RUN git_version=$(git describe --always 2>/dev/null); \
    if [ -n "$git_version" ]; then \
        sed -i "s#Issue tracker</a>#Issue tracker</a> \&middot; $git_version#" client/templates/sidebar.hbs; \
    fi;

RUN npm install
RUN node_modules/gulp/bin/gulp.js

ADD config.js config.js

EXPOSE 113
EXPOSE 3000
EXPOSE 6667
EXPOSE 6697

CMD ["node", ".", "run"]
