# Buildbook Spotifiy Coding Exercise

Thanks for taking the time to review my application. This is my attempt to tackle the Buildbook Spotify Coding Exercise.

To use the application, you must have a working installation of ruby. The script needs to have the correct permissions

`chmod +x ./spotify.rb`

To run the application, run the ruby script with options:

`./spotify.rb <source> <changes> <output>`

| Option  | Description                                                      | Example      |
| ------- | ---------------------------------------------------------------- | ------------ |
| source  | The file to source the initial data                              | spotify.json |
| changes | The file that holds the batch of changes to run against the data | changes.json |
| output  | The file to output the mutated data                              | output.json  |

I was able to put in an hour total of development time on this using inspiration from previous work. I treated this as a small ETL process, where you'd have one source of data and some transformations to that data, before loading it somewhere else. I tried to come up with a structure that would allow for something flexible, with inspiration from the Kiba gem on transformations, sources, etc. Keeping things isolated also allows for easier testing! ... Which this app has none of.

Some places were created in a flexible way, while others are hardcoded to a specific path (transformers and the data expected being json). This is done just to show how things could be built to support additional requirements etc and for timeboxing purposes.

Since this is a rudimentary first pass (or this app is MVP), there are a couple of different ways that we could scale this. Right now this application reads the json and puts all of the data into memory before manipulating that data. We could instead do things through batches, introduce background jobs, or leverage services like elasticsearch or redis while also horizontally / vertically scaling out the infrastructure as needed. However, there are really a lot of different scenarios and strategies on how to address scaling concerns, but most of that is dependent on requirements.
