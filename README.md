## Google Cloud TTS Rails Pro

**Be careful, this is only a concept. The application is under development.**

![Google Cloud TTS Rails Pro](https://github.com/cmirnow/Google-Cloud-Text-to-Speech-Pro/blob/master/public/images/main.jpg)

Extended version [Google-Cloud-TTS-Rails](https://github.com/cmirnow/Google-Cloud-TTS-Rails) (Ruby on Rails 6, Webpacker, Bootstrap 5, Ajax Flash Messages) allows some improvements: set the title of the sound file, upload and store audio files to Amazon S3, Google Cloud Storage or Microsoft Azure Storage, translate (API Google Translate) text on the fly... and something else.

You will need these environment variables:

```bash
#Gmail
GMAIL_USER_NAME: '**************'
GMAIL_PASSWORD: '***************'
# AWS
AWS_ACCESS_KEY_ID: '******************'
AWS_SECRET_ACCESS_KEY: '******************'
REGION: "us-east-2" #for example
BUCKET: "your_project_name"
# Use Google Cloud Translate API across RapidAPI (REST):
# RAPIDAPI_KEY: '**************************'
# or directly:
CLOUD_PROJECT_ID: '*******************'
GOOGLE_APPLICATION_CREDENTIALS: "key.json"
```

And Google JSON credentials (service account key) for access to Google Cloud Translate API and Google Cloud Text to Speech API.

![Google Cloud TTS Rails Pro](https://github.com/cmirnow/Google-Cloud-Text-to-Speech-Pro/blob/master/public/images/file_management.jpg)
