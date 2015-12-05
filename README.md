# GoogleNativeAdvertisingGlitch
Demonstration of Native Advertisement Issue

This sample code requests a small number of native ads (identifying them by index) and experiences "Invalid Response" errors. See original report here:

   https://productforums.google.com/forum/#%21msg/dfp/QbIqKOvL22Q/kRzaIMocGAAJ;context-place=forum/dfp

Purpose of the Code:

..* To build a pool of native ads (for use over the next minutes, no more than an hour, per docs) for a couple of units (to reduce load latency for future impressions.)
..* This sample stopped at reproducing the errors (i.e. is not a full use, does not mark impressios, etc. etc.)

Interesting Observations:
..* Initially (and unintentionally) run without the [iOS9 considerations](https://developers.google.com/mobile-ads-sdk/docs/dfp/ios/ios9) --- however once added *no change was detected*. (Note to self: Perhaps pointing to a problem with implementation of this?)
..* Did not occur until added code to extract fields from loaded content.
..* Fails with one unit, does not need multiple. 
..* Failed on the second/third request loads.

Application Output:

![Sample Output 1](./IssueInformation/InvalidResponse.png)
