FROM debian:10.1

LABEL "version"="0.0.1"
LABEL "com.github.actions.name"="Release APK"
LABEL "com.github.actions.description"="Build & Publish Release APK on Github or https://www.pgyer.com/"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/ShowMeThe/github_action_release"
LABEL "maintainer"="ShowMeThe"

RUN apt update \
	&& apt -y upgrade \
	&& apt install -y hub \
	&& apt install -y curl\
	&& apt autoremove \
	&& apt autoclean \
	&& apt clean

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
