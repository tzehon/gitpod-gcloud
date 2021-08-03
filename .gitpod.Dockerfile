FROM gitpod/workspace-full

# Installing gcloud into our path, see: https://cloud.google.com/sdk/docs/install#deb
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

# Install gcloud and other tools
RUN sudo apt-get install google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-python-extras google-cloud-sdk-app-engine-java \
        google-cloud-sdk-app-engine-go google-cloud-sdk-bigtable-emulator google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local google-cloud-sdk-datalab \
        google-cloud-sdk-datastore-emulator google-cloud-sdk-firestore-emulator google-cloud-sdk-pubsub-emulator kubectl -y
