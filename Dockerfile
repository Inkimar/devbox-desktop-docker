FROM openjdk:latest

RUN apt-get update

WORKDIR /home/developer/ide/intellij

# 'Creating user: developer'
RUN mkdir -p /home/developer/ide/intellij && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group

RUN mkdir -p /home/developer/.IdeaIC2016.2/config/options && \
    mkdir -p /home/developer/.IdeaIC2016.2/config/plugins

RUN chown developer:developer -R /home/developer/.IdeaIC2016.2

# 'Downloading IntelliJ IDEA'
RUN wget https://download.jetbrains.com/idea/ideaIC-2016.2.2.tar.gz -O /tmp/intellij.tar.gz -q --show-progress && \
    echo 'Installing IntelliJ IDEA' && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /home/developer/ide/intellij && \
    rm /tmp/intellij.tar.gz

#CMD ["su","-","developer","-c","/home/developer/ide/intellij/bin/idea.sh"]
CMD ./bin/idea.sh
