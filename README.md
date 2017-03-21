wercker-step-to-sumologic
==========
Custom step made for uploading the steps logs from a pipeline to Sumologic

## Prerequisites

* Wercker token for getting the logs info from Wercker API
* HTTP collector in Sumologic

Both of them needs to be configured in Wercker as environment variables, WERCKER_TOKEN and SUMOLOGIC_COLLECTOR_URL

## Examples

* [HelloWorld] (https://github.com/peertransfer/wercker-hello-world) - A simple example which executes this step


## Built with

* [Ruby] (https://www.ruby-lang.org/) - Ruby language
* [HTTParty] (https://github.com/jnunemaker/httparty) - Gem used for http requests
* [Wercker] (http://www.wercker.com/) - The CI used

## Authors

* **David LLuna** - *Initial work* - [llunaplanet] (https://github.com/llunaplanet)
* **Paco Sanchez** - *Initial work* - [sanchezpacofw] (https://github.com/sanchezpacofw)
