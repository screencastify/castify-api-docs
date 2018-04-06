# ![](screencastify-logo-large.png)Overview
[**About**](README.md) / [Getting started](getting_started.md) / [API](API.md) / [Demos](demos.md) / [Pricing](pricing.md)


The Screencastify API allows users to share recordings with third-party Applications/Sites from
within Screencastify or (optionally) control recording from the site.

## Sharing from within Screencastify
___
Apps are shown as an additional upload target in Screencastify's share dialog.

Screencastify can also be configured to "Record for an App". This automatically shares
all new recordings with the configured App. It's the responsibility of the App to handle
and store such recordings.
[Record for App Flow Demo Video](https://www.youtube.com/watch?v=jQMSXJE8O_s)

This is a pure client-side API, recordings are passed to Apps as regular
[File](https://developer.mozilla.org/en/docs/Web/API/File) objects (like from
a file picker) locally.

## Controlling recording from the site
___
The recording API allows to initiate and control record from a site. To get an idea how this
works, try the
[In-Site Recorder Demo.](https://w69b.github.io/castify-api-docs/demos/in-site/in-site.html)

The resulting video is shared in the same way as recordings made with the "Record for an App"
feature.
