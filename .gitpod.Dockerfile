FROM gitpod/workspace-full:latest

# Switch to the root user to install system wide tools
USER root

# Installing gcloud into our path, see: https://cloud.google.com/sdk/docs/install#deb
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

# Install other tools

RUN apt-get install google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-python-extras google-cloud-sdk-app-engine-java \
        google-cloud-sdk-app-engine-go google-cloud-sdk-bigtable-emulator google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local google-cloud-sdk-datalab \
        google-cloud-sdk-datastore-emulator google-cloud-sdk-firestore-emulator google-cloud-sdk-pubsub-emulator kubectl -y

# Set the zsh theme
ENV ZSH_THEME robbyrussell

# Rrun the installation script
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Start zsh
CMD [ "zsh" ]

USER gitpod