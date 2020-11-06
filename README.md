# pokedex-sapper

A project for testing out [Sapper](https://github.com/sveltejs/sapper) on Google Cloud Run.

```
gcloud builds submit --tag eu.gcr.io/<project>/pokedex-sapper
gcloud run deploy pokedex-sapper --image eu.gcr.io/<project>/pokedex-sapper --platform managed --region europe-west3
```
