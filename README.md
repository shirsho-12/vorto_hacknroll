# Vorto

Ever wondered how many hours you could save TAing if Prof just gave you tutorial slides? Or maybe Zoom through the tedious presentation? That's precisely what we aim to do with Vorto.

## Pipeline

The model pipeline is as follows:
- The user selects a PDF from their phone. 
- The PDF is run through an OCR model to extract text.
- This text is then summarized using Text Summarization AI (MeaningCloud API)
- The summarized text is further processed with Rapid Automatic Keyword Extraction (RAKE). 
- These keywords are not only used as slide titles but are also passed into a pre-trained HuggingFace diffusion model to generate images.
The core app is built with Flutter. The GAN image generation is done in Python with a Flask backend.

![Model Pipeline](https://d112y698adiu2z.cloudfront.net/photos/production/software_photos/002/344/076/datas/original.png)

### Future To-Dos
- Further train our own generative models specifically tailored to creating presentations. 
- Provide users with the opportunity to select which pictures they'd like for their presentation from a selection of choices. We were constrained by generation time constraints in this area. 
- Creating multiple slide features

We strongly believe this project has a very strong, wide-ranging scope of use and would like to work further on it.
