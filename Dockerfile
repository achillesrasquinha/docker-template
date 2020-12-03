FROM docker/compose:debian-1.27.4

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y --no-install-recommends install git curl gnupg2 ca-certificates openssh-client && \
	curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get update && \
	apt-get install -y --no-install-recommends nodejs && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && \
	apt-get install -y --no-install-recommends yarn && \
	apt-get install -y --no-install-recommends libatk-bridge2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb && \
	update-alternatives --remove python /usr/bin/python2 && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
	curl -fsSL http://build.cellcollective.org/db-data.tar.gz -o /db-data.tar.gz