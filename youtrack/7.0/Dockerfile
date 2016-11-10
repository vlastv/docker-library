FROM openjdk:jre

ENV YOUTRACK_VERSION 7.0.28110

RUN mkdir /usr/local/youtrack \
        && curl -L https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar > /usr/local/youtrack/youtrack.jar

EXPOSE 80

VOLUME ["/var/lib/youtrack"]

CMD ["java", \
     "-Xmx1g", \
     "-Djava.awt.headless=true", \
     "-Djetbrains.youtrack.disableBrowser=true", \
     "-Duser.home=/home/youtrack", \
     "-Ddatabase.location=/var/lib/youtrack/data", \
     "-Ddatabase.backup.location=/var/lib/youtrack/backup", \
     "-jar", \
     "/usr/local/youtrack/youtrack.jar", \
     "80" \
]
