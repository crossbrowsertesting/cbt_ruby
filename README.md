# CBTRUBY

This is a Ruby gem for using the CrossBrowserTesting.com API to perform operations from Ruby quickly and easily.

## Using CBTRUBY
### Installing

### Importing

### Creating an object
After you have imported the gem, create a CbtClient object using ````CBTRUBY::CbtClient.new("you@yourDomain.com", "yourActualAuthKey")````

## CbtClient Methods
### Screenshot methods
#### CbtClient.screenshotBrowsers

Returns a hash table containing all the browser combinations supported by CrossBrowserTesting.  Likely doesn't have much use on its own, but can be processed easily with built-in Ruby methods.

#### CbtClient.screenshotHistory

Returns a hash table containing your screenshot history data from CrossBrowserTesting.

##### Parameters

The screenshotHistory method takes a single parameter, a hash table passed in as a named parameter ````params````.

###### params
* **num** -- *integer* The number of results to return.  API defaults to 10.
* **start** -- *integer* The index to start from.
* **active** -- *boolean* Show only active or inactive tests.  API defaults to no value.
* **url** -- *string* URL to filter by.
* **start_date** -- *string* Date to begin results from.  Format is "YYYY-MM-DD".
* **end_date** -- *string* Date to end results at.  Format is "YYYY-MM-DD".
* **archived** -- *boolean* Show only archived or non-archived results.  API defaults to no value.

#### CbtClient.screenshotTest

The screenshotTest method will initiate a screenshot test using the CrossBrowserTesting API and return the results.

##### Parameters

The screenshotTest method takes two parameters, a required ````params```` hash table and an optional boolean, ````blocking````.

###### params
* **url** -- **REQUIRED** *string* URL to initiate a screenshot test of.
* **browsers** -- **REQUIRED if no browser_list_name** *array of hashes* An array containing hashes for the desired browser and platform combinations.  Array should contain hashes with the following keys:
    - **browser** - **REQUIRED** The api_name version of the browser (Chrome, Firefox, etc)
    - **version** - **REQUIRED** The version number for the browser (60, 60x64)
    - **platform** - The operating system to use for testing.
    - **resolution** - Screen resolution to use for screenshot testing
* **browser_list_name** - **REQUIRED if no browsers** *string* The name of the browser list profile saved on CrossBrowserTesting.
* **login** -- *string* login profile name to use
* **basic_username** & **basic_password** -- *string* The username and password, respectively, to use for basic HTTP authentication systems
* **delay** -- *integer* The time, in seconds, to wait after loading before taking a screenshot
* **hide_fixed_elements** -- *boolean* Hide fixed elements.  API defaults to *true*
* **check_url** -- *boolean* Check URL.  API defaults to *false*.
* **send_email** -- *boolean* Send an email notification on completion of the test.  API defaults to *false*
* **email_list** -- *array of string* An array of strings containing email addresses to send notifications to.
