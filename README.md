# CBTRUBY

This is a Ruby gem for using the CrossBrowserTesting.com API to perform operations from Ruby quickly and easily.

## Using CBTRUBY
### Installing

### Using
````require 'cbt_ruby'````

## Object Types
### CbtClient
This is the base for API interaction.  Instantiate this object with a username and password

````CBTRUBY::CbtClient.new("you@yourdomain.com", "yourActualAuthKey")````

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

## Currently Defunct

### screenshotHistory
* **num** -- *integer* The number of results to return.  API defaults to 10.
* **start** -- *integer* The index to start from.
* **active** -- *boolean* Show only active or inactive tests.  API defaults to no value.
* **url** -- *string* URL to filter by.
* **start_date** -- *string* Date to begin results from.  Format is "YYYY-MM-DD".
* **end_date** -- *string* Date to end results at.  Format is "YYYY-MM-DD".
* **archived** -- *boolean* Show only archived or non-archived results.  API defaults to no value.

