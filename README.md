<img src="assets/messages-icon.png" alt="Messages 2018" width="36" height="36"> Messages test app by Giovanny Orozco
======================================

 ![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux-333333.svg) ![RxSwift](https://img.shields.io/cocoapods/v/RxSwift.svg) [RxCocoa](https://img.shields.io/cocoapods/v/RxCocoa.svg) [Alamofire](https://img.shields.io/cocoapods/v/Alamofire.svg)
 
Messages app is a open source test app under MIT License. Here you can find s simple app using table views, networking services with [Alamofile](https://cocoapods.org/pods/Alamofire) Library and clean architecture convined with [RxSwfit](https://cocoapods.org/pods/RxSwift) and [RxCocoa](https://cocoapods.org/pods/RxCocoa).  

This example app can be useful in order to understand how clean code works and how it can be convined with RxSwift to do reactive components. Here you can find a little bit different implementation of clean swift with a couple of extra layers.

## Basics

###### ... understand

* [What is RxSwift?](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md)
* [RxSwift traits](Documentation/Traits.md) - what are `Single`, `Completable`, `Maybe`, `Driver`, `ControlProperty`, and `Variable` ... and why do they exist?
* [What is clean code](https://clean-swift.com/clean-swift-ios-architecture/)


## Requirements

* Xcode 9.0+
* Swift 4.0+
* iOS 9.0+
* Cocoapods
* Reactive programing basics

## Dependencies

You can find all dependencies in `Podfile` 

```ruby
# Podfile
use_frameworks!
inhibit_all_warnings!
platform :ios, "9.0"

target 'Messages' do
pod 'Alamofire', '~> 4.7'
pod 'RxSwift',    '~> 4.0'
pod 'RxCocoa',    '~> 4.0'
end
```
