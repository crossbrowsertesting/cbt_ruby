# CBTRUBY

This is a Ruby gem for using the CrossBrowserTesting.com API to perform operations from Ruby quickly and easily.

## Using CBTRUBY
### Installing
````gem install 'cbt_ruby'````

### Using
````require 'cbt_ruby'````

## Quick Start
````
require 'cbt_ruby'

# create a client to make connections
client = CBTRUBY::CbtClient.new("you@yourDomain.com", "yourActualAuthkey")

# define a browser
chrome57 = CBTRUBY::CbtClient::Browser.new(browser:"Chrome", version: "57", platform: "Win10", resolution: "1920x1080")

# define a list of browsers
browsers = CBTRUBY::CbtClient::Browsers.new

# add browsers to our list
browsers.add(chrome57)

# start a screenshot test
screenshot = CBTRUBY::CbtClient::ScreenshotTest.new(client: client, params:{"url":"http://google.com", browsers: browsers})
````

## Object Types
### CbtClient
This is the base for API interaction.  Instantiate this object with a username and password

````CBTRUBY::CbtClient.new("you@yourdomain.com", "yourActualAuthKey")````

### CbtClient::Browser
Representation of a browser.

#### Parameters
* **browser** -- **Required** *string* The API name of the browser (Firefox, Chrome, etc)
* **version** -- **Required** *string or integer* Version of the browser to test
* **platform** -- *string* Platform name to test (i.e, "Win10")
* **resolution** -- *string* Resolution to test (i.e., "1366x768")

###CbtClient::Browsers
A list of browsers to test.

#### Methods
* **add** -- add a browser to the list
* **to_s** -- print the list in the piped format for CBT's API

#### csv_to_browsers
As of version 0.0.5, the gem includes a ````csv_to_browsers```` parser that will take a CSV containing ````browser````, ````version````, ````platform````, and ````resolution```` headers, and return a Browsers object based on the information in the CSV.

**Note**: Not all fields in the CSV must be filled in, only the required fields for the objects.

##### Using csv_to_browsers
````csv_to_browsers```` takes a single ````file```` parameter.  This should be a string containing the name and location of the CSV file to parse.

````browsers = CBTRUBY::csv_to_browsers(file:"example.csv")````

### CbtClient::ScreenshotTest
This object begins and represents a screenshot test.

#### Parameters
* client - **Required** A CbtClient (or compatible) object to use for the API connection.
* params - **Required** A hash containing the following items:
    * **url** -- **REQUIRED** *string* URL to initiate a screenshot test of.
    * **browsers** -- **REQUIRED if no browser_list_name** *CbtClient::Browsers object*
    * **browser_list_name** - **REQUIRED if no browsers** *string* The name of the browser list profile saved on CrossBrowserTesting.
    * **login** -- *string* login profile name to use
    * **basic_username** & **basic_password** -- *string* The username and password, respectively, to use for basic HTTP authentication systems
    * **delay** -- *integer* The time, in seconds, to wait after loading before taking a screenshot
    * **hide_fixed_elements** -- *boolean* Hide fixed elements.  API defaults to *true*
    * **check_url** -- *boolean* Check URL.  API defaults to *false*.
    * **send_email** -- *boolean* Send an email notification on completion of the test.  API defaults to *false*
    * **email_list** -- *array of string* An array of strings containing email addresses to send notifications to
* **blocking** -- *boolean* Whether or not to block further execution until this test has completed.

### CbtClient::ScreenshotInfo
Retrieves, processes, and displays screenshot info from CrossBrowserTesting.

#### Parameters
* **client** -- **Required** *CbtClient object*
* **session** -- **Required** *integer or string* Session ID to retrieve information for

#### Methods
* **running** -- Returns a boolean value for whether the test is still running
* **request** -- Initiate a request to the CBT API regarding this screenshot test session

#### Descendents
There is a ScreenshotVersionInfo object as well.  This inherits from the standard ScreenshotInfo, but takes a ````version```` parameter as well.

### CbtClient::BaseBrowserQuery
This class provides (currently unimplemented) methods for interacting with browser lists provided by the API (screenshot browsers, selenium browsers).

#### Descendents
This class provides two classes with inherited methods, ScreenshotBrowserQuery and SeleniumBrowserQuery.

#### Parameters
* **client** -- **Required** *A CbtClient object*.

#### Methods
* **list_all** -- Fetches the list of all supported browsers
* **search_devices** *Upcoming Feature* -- Searches the list for specific features regarding devices/platforms
* **search_browsers** *Upcoming Feature* -- Searches the list for specific features regarding browsers.

### CbtClient::ScreenshotHistory
Retrieve your screenshot test history from CrossBrowserTesting.

#### Parameters
* **client** -- **Required** *A CbtClient object*.

#### Methods

##### list
Returns a list of screenshot tests.  Supports optional limiting/searching using a ````params```` hash.

###### params 
* **num** -- *integer* The number of results to return.  API defaults to 10.
* **start** -- *integer* The index to start from.
* **active** -- *boolean* Show only active or inactive tests.  API defaults to no value.
* **url** -- *string* URL to filter by.
* **start_date** -- *string* Date to begin results from.  Format is "YYYY-MM-DD".
* **end_date** -- *string* Date to end results at.  Format is "YYYY-MM-DD".
* **archived** -- *boolean* Show only archived or non-archived results.  API defaults to no value.

