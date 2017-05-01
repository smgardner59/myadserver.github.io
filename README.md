### [The myadserver static ad server](//myadserver.github.io/)

An ad server providing predictable VAST responses to static ad tags for testing and debugging purposes.

The sample VAST responses are ready-to-use at [myadserver.github.io](//myadserver.github.io/) and should JustWork(TM) straight from the page without modification.

#### Caveats
Please do not abuse this service, which is kindly hosted by Github
- Do not use in production environments
- Do not use for load-testing
- Do not link to any of the files other than [myadserver.github.io](//myadserver.github.io/).  Individual files are subject to change.
- Please do not use these in your documentation.

#### Sample VAST responses

These sample VAST responses are provided as-is and without warranty.

Ad Tag | | Google VSuite Validator
---|---|---
[VAST 2.0 Linear](vast2_linear.xml) | Simple, Linear VAST 2.0 | [Preview]( //developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_linear.xml)
[VAST 2.0 Wrapper (x1)](vast2_wrapper1.xml) | Single Wrapper VAST 2.0, redirecting to Linear VAST 2.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper1.xml)
[VAST 2.0 Wrapper (x2)](vast2_wrapper2.xml) | Double Wrapper VAST 2.0, redirecting to Single Wrapper VAST 2.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper2.xml)
[VAST 2.0 Wrapper (x3)](vast2_wrapper3.xml) | Treble Wrapper VAST 2.0, redirecting to Double Wrapper VAST 2.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper3.xml)
[VAST 2.0 Wrapper (x4)](vast2_wrapper4.xml) | Quadruple Wrapper VAST 2.0, redirecting to Treble Wrapper VAST 2.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper4.xml)
[VAST 2.0 Wrapper (x5)](vast2_wrapper5.xml) | It is likely that a VAST player will exceed the number of redirects | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper5.xml)
[VAST 2.0 No Ad](vast2_noad.xml) | Empty VAST 2.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_noad.xml)
[VAST 2.0 Wrapper to 404](vast2_wrapper_404.xml) | 404 File Not Found | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast2_wrapper_404.xml)
[VAST 3.0 Linear](vast3_linear.xml) | Simple, Linear VAST 3.0 | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast3_linear.xml)
[VAST 3.0 No Ad](vast3_noad.xml) | Empty VAST 3.0, with [ERRORCODE]| [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast3_noad.xml)
[VAST 3.0 Fallback](vast3_fallback.xml) | VAST 3.0 Video Fallback through 404 & Empty VAST | [Preview](//developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector?tag=https%253A%252F%252Fmyadserver.github.io%252Fvast3_fallback.xml)

#### Notes

The samples included in this project attempt to follow IAB & industry best practice.
- Care has been taken to ensure tags, pixels and creatives work in both HTTP and HTTPS
- Video creatives have been encoded following the latest IAB Digital Video Best Practices
- Relative URLs have been used where appropriate

#### Limitations - CORS

One limitation of using Github Pages is that it is not possible to control the CORS headers.

>ad servers must include a CORS header
in the http file that wraps the VAST response. The CORS header must be formatted as follows:"
```
Access-Control-Allow-Origin: <origin header value>
Access-Control-Allow-Credentials: true
```
These HTTP headers allow an ads player on any origin to read the VAST response from the ad server
origin.  The value of Access-Control-Allow-Origin should be the value of the Origin header sent
with the ad request."

On modern web-browsers, a wildcard no longer works if `Access-Control-Allow-Credentials: true`.
```
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
```
As Github Pages provides no control over the CORS headers, your mileage may vary depending on the browser and the player implementation.  Please be sure to check your browser logs.


#### FAQ

##### Explain yourself...

This project is a self-contained ad-server, hosted within Github Pages (Github.io).  By being hosted on Github Pages (rather than Github), URLs should work, MIME-types should be accurate.

##### What is all the //example.com all about?

Wherever possible, all ad tags in this project try to use the relative // schema notation rather than http:// or //
- If you call the ad tag via HTTPS, all media, pixels and URIs will be served over HTTPS.
- If you call the ad tag via HTTP, all media, pixels and URIs will be served over HTTP.


##### But isn't this project just a rip-off of the [IAB TechLabs Sample Pages](//github.com/InteractiveAdvertisingBureau/VAST_Samples)?

No. The excellent VAST 2.0/3.0/4.0 examples hosted by the IAB TechLabs Team are stored at GitHub.com, but are not usable as-is.  This project seeks to address this by hosting on Github Pages (aka github.io).

There many other repositories containing excellent VAST samples.  This project is unique in that it hosts the VAST Samples using Github Pages and relative URLs, rather than present a list of VAST XML files which cannot be used directly.

#### What is the [build-scripts/](build-scripts) folder?

These are scripts to create the video creatives and pixels from scratch using [FFmpeg](//ffmpeg.org/) and [ImageMagick](//www.imagemagick.org).  This avoids any complications over creative copyright.

The source code is [available on Github](//github.com/myadserver), however only [myadserver.github.io](//myadserver.github.io) is needed to use the service.
