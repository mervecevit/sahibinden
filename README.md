## Sahibinden Coin

### Introduction
- In ScoinApp, the past and the new currency of Scoin can be seen. 
- Acoording to changes in currency, the image view which is next to values will be changed.
- New Scoin currencies can be pulled by pressing refresh button.

<img src="/scoin.gif" width="320px">

Used Rest API's
- https://devakademi.sahibinden.com/history for taking the past currencies of Scoin
- https://devakademi.sahibinden.com/ticker for taking the current currency of Scoin

Scoin App includes:
- Current Currency of Scoin
- Scoin History
- Image for the change in Scoin

### Requirements
- Swift 4
- Xcode 9.0+

There are some unnecessary pods in application. I did not have time for deleting them.
At first, I found Charts framework from internet by searching for showing the values in a graph. 
However, I had some problems since I am not familiar with the framework.
Therefore, I used table view for guaranteeing a proper application.
