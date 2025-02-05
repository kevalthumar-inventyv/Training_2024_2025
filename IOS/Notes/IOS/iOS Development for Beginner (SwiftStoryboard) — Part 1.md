---
title: "iOS Development for Beginner (Swift/Storyboard) — Part 1"
source: "https://hanifmhd.medium.com/ios-development-for-beginner-swift-storyboard-part-1-cef1c09e199b"
author:
  - "[[Muhammad Hanif]]"
published: 2023-01-27
created: 2025-02-04
description: "It has been 1 year since I posted last story here, all of the bustles from work and marriage life make me to break from medium 😂. In the free time, I try to explore something new on Mobile App…"
tags:
  - "clippings"
---
[

![Muhammad Hanif](https://miro.medium.com/v2/resize:fill:44:44/1*fwPYzQSY32rinykVRsDGMQ@2x.jpeg)

](https://hanifmhd.medium.com/?source=post_page---byline--cef1c09e199b--------------------------------)

It has been 1 year since I posted last story here, all of the bustles from work and marriage life make me to break from medium 😂. In the free time, I try to explore something new on Mobile App Development, **native iOS**. Probably, developers who have experience on hybrid app development already know about some codes on Objective C/Swift, but I think they don’t know deeply about native iOS. So, I would like to share my learning on iOS development and it is still on going project. There will be more than 1 part of it. In this part, I will try to explain the most basic knowledge we need to know about Xcode (IDE Tools), Storyboard and create our first native iOS app.

First of all, we as iOS developer must have `Apple ID` in order to create iOS app. Go to [https://developer.apple.com/](https://developer.apple.com/) and choose `Account` . If you already account, login it there, but if you don’t have account, just create it there.

![](https://miro.medium.com/v2/resize:fit:700/1*qk4Em5fdCKQlc0QFhkoJ-g.png)

Apple Developer website

Create New Project

I’m using [**Xcode version 14.1**](https://developer.apple.com/xcode/), for now don’t upgrade macOS to the latest, in case there are issues or unstable app ([*Ventura*](https://www.apple.com/id/macos/ventura/)). After we download and install xcode from Appstore, open it. Choose `Create a new Xcode project`

![](https://miro.medium.com/v2/resize:fit:700/1*cAZHgAJxiNHEba1xEx917g.png)

Xcode in Appstore

![](https://miro.medium.com/v2/resize:fit:700/1*REnkf09tL6gHx1cs8y039Q.png)

Create a new Xcode project

For the template project, there will be many of them:

1. [*Multiplatform*](https://developer.apple.com/documentation/xcode/configuring-a-multiplatform-app-target)  
Share app project’s settings and code across platform.
2. [*iOS*](https://developer.apple.com/ios/)  
App only for iPhone, iPad.
3. [*macOS*](https://developer.apple.com/tutorials/swiftui/creating-a-macos-app)  
App only for macBook.
4. [*watchOS*](https://developer.apple.com/tutorials/swiftui/creating-a-watchos-app)  
App only for Apple Watch.
5. [*tvOS*](https://developer.apple.com/tvos/)  
App only for Apple TV.
6. [*DriverKit*](https://developer.apple.com/documentation/driverkit)  
The DriverKit framework defines the fundamental behaviors for device drivers in macOS and iPadOS. The C++ classes of this framework define your driver’s basic structure, and provide support for handling events and allocating memory.
7. [*Other (External Build System)*](https://developer.apple.com/documentation/xcode/build-system)  
The Xcode build system manages the tools that transform your code and resource files into a finished app. When you tell Xcode to build your project, the build system analyzes your files and uses your project settings to assemble the set of tasks to perform.

For watchOS and tvOS, we need to download additional simulator, while iOS is the default one.

![](https://miro.medium.com/v2/resize:fit:700/1*BI63M05uZt7v6h9RONldRA.png)

Additional simulator for watchOS and tvOS

Then, in the template, choose `iOS` , in the application choose `App` , then click `Next` .

![](https://miro.medium.com/v2/resize:fit:700/1*9a3y44opDamCNbqaOQGZVw.png)

iOS App template

In the next page, you need to fill some field for the project:

1. *Product Name*  
This will be your app name, you have to create unique app name if you want upload it to the Appstore. For the naming convestions you can read here: [https://developer.apple.com/forums/thread/124046](https://developer.apple.com/forums/thread/124046)
2. *Team*  
It is the team in [Apple Developer](https://developer.apple.com/account), make sure you register your Apple ID to Apple Developer. It will be used for configuring certificates, uploading app to appstore, testing on sandbox, etc.
3. *Organization Identifier*  
If you are developer under organization, you need to specify your organization name here or you just can specify your name, like `com.myname` , then the `Bundle Identifier` will create it automatically. [https://developer.apple.com/forums/thread/18021](https://developer.apple.com/forums/thread/18021)
4. *Interface*  
There are 2 types of interface: `SwiftUI` and `Storyboard` . The difference is `SwiftUI` using declarative syntax, we need to memorize some syntax object to create UI. Since we are beginner for iOS development, better we choose `Storyboard` , it enables us to create UI/UX by dragging and dropping `Objects` (component).
5. *Language*  
There are 2 types of language: `Objective-C` and `Swift` . For the differences of it, read here: [https://www.geeksforgeeks.org/difference-between-swift-vs-objective-c/](https://www.geeksforgeeks.org/difference-between-swift-vs-objective-c/). Then, choose `Swift` for language and click `Next` button.

![](https://miro.medium.com/v2/resize:fit:700/1*X6qvpHHrqoesE1OK6hDGeA.png)

Project name settings

Then, choose folder destination for our project. I recommend it to put on `Documents` . In the `Source control` checkbox, you can choose it to create Git repository or not. Then, click `Create` button.

![](https://miro.medium.com/v2/resize:fit:700/1*-V1WLzetmD9r8go1Ef8gow.png)

Folder destination

Xcode will create our project and it takes some times. The process of indexing is on top-center, don’t cancel or close the project, wait until it is finished. If there are errors, there will be notification about it.

Taraaa, we just successfully create our empty project 🥳. You can explore it first to get used to it.

![](https://miro.medium.com/v2/resize:fit:540/1*1R6NyV853jvCD56zD4oyhQ.png)

Basic folder structure

In the left side of code editor, there is basic folder structure of swift. There are:

1. *AppDelegate  
*It manages your app’s shared behaviors. The app delegate is effectively the root object of your app, and it works in conjunction with `UIApplication` to manage some interactions with the system. Like the `UIApplication` object, UIKit creates your app delegate object early in your app’s launch cycle so it’s always present. Read here: [https://developer.apple.com/documentation/uikit/uiapplicationdelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)
2. *SceneDelagate  
*It manages life-cycle events in one instance of your app’s user interface. This interface defines methods for responding to state transitions that affect the scene, including when the scene enters the foreground and becomes active and when it enters the background. Use your delegate to provide appropriate behavior when these transitions occur. For example, finish critical tasks and quiet your app when it enters the background. Read here: [https://developer.apple.com/documentation/uikit/uiscenedelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate)
3. *ViewController  
*It manages your UIKit app’s interface. A view controller manages a single root view, which may itself contain any number of subviews. User interactions with that view hierarchy are handled by your view controller, which coordinates with other objects of your app as needed. Every app has at least one view controller whose content fills the main window. If your app has more content than can fit onscreen at once, use multiple view controllers to manage different parts of that content. Read here: [https://developer.apple.com/documentation/uikit/view\_controllers](https://developer.apple.com/documentation/uikit/view_controllers)
4. *Main  
*It is the `Storyboard` that will be the UI of `Controller.` In this case, Main.storyboard will be the UI of `ViewController` . Read here: [https://developer.apple.com/documentation/uikit/uiviewcontroller/1621399-storyboard/](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621399-storyboard/)
5. *Assets  
*It is used for configuring assets, like `AppIcon` , `AccentColor` and other images. For the detail supported format in asset, you can read here: [https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode\_ref-Asset\_Catalog\_Format/AssetTypes.html](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/AssetTypes.html)
6. *LaunchScreen  
*It is the `Storyboard` that is using in the launching screen (splash screen) when the first time app is opened. You can customize it, probably like using animation, add logo, etc.
7. *Info  
*`Info.plist` (*information property list file*) is the way an app provides its metadata to the system is through the use of a special file. This metadata is used in many different ways. Some of it is displayed to the user, some of it is used internally by the system to identify your app and the document types it supports and some of it is used by the system frameworks to facilitate the launch of apps.. Read here: [https://developer.apple.com/documentation/bundleresources/information\_property\_list/managing\_your\_app\_s\_information\_property\_list](https://developer.apple.com/documentation/bundleresources/information_property_list/managing_your_app_s_information_property_list)

Now, in our first project, we will create Profile UI!

![](https://miro.medium.com/v2/resize:fit:700/1*hqdWmziZj30ETK-32FDFwQ.png)

Profile UI project

First of all, we need to know how to add Object component, like `UILabel` , `UITextView` , `UIButton` , etc. We can press `Command `\+ `Shift` + `L` and search any Object component we want to add.

![](https://miro.medium.com/v2/resize:fit:700/1*zaRDIu37UO2l-mbJdBoTPA.png)

Objects will show after we press command + shift + L

Steps for creating profile UI:

1. Prepare image asset. You can use [https://hotpot.ai/icon-resizer](https://hotpot.ai/icon-resizer) to generate any images to iOS asset format. Then upload it to Assets editor, name it as `image` .

![](https://miro.medium.com/v2/resize:fit:700/1*RuLsoxlhT8e-7mojrVbpfg.png)

Asset management

2\. Analyze each objects for the layout. Shortly, it has objects like this.

![](https://miro.medium.com/v2/resize:fit:700/1*bHbBCi75bCnI7EkGYOgIWw.png)

Objects for the layout

3\. Open `Main.storyboard` and stacks it from top to bottom like this.

![](https://miro.medium.com/v2/resize:fit:700/1*MMTtaMBz9fLUXJLJokON2A.png)

Final objects result

4\. For the `imageView` , we need to attach image on `Attributes inspector` by clicking the objects image, then `Attributes inspector` tab and choose the image. Set the image size to 20x16.

![](https://miro.medium.com/v2/resize:fit:700/1*Qml2rqFN3azS7ucVMxi82w.png)

Attach image

5\. For the `Horizontal StackView` in Deposit, we need to add 3 `Horizontal StackView`for each layout. Then, inside of each, add `UIImageView` and `UILabel` . For the bitcoin logo, you can follow instruction number 4 above and choose bitcoin icon. Set the image size to 40x40.

![](https://miro.medium.com/v2/resize:fit:700/1*_gFho_YyBXzsAE4I1bg6tA.png)

Horizontal stackview on deposit

6\. For the `Vertical StackView` in Short bio, we need to add 2 objects component: `UIlabel` and `UITextView` .

![](https://miro.medium.com/v2/resize:fit:700/1*8iGJXNFX578pDhWM5lwOfQ.png)

Vertical stackview on short bio

Long text can be scrolled by enabling it on `Attributes inspector`

![](https://miro.medium.com/v2/resize:fit:700/1*HC_vJYPMeEAb34BKlefOnw.png)

The UI will be not tidy, it is because we need to define the `Constraints` in interface builder. For now, just do the best you can. I will explain it on the next session. Read here: [https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html).

Run it on the simulator by clicking the `simulator` on top of the project and press ▶ button.

![](https://miro.medium.com/v2/resize:fit:700/1*GG7DNUyf14ye2eWY-IebkA.png)

Runing project on simulator

![](https://miro.medium.com/v2/resize:fit:700/1*wooBwoRMLMavsXchKBcmtw.png)

Project that runs on simulator

For the complete code, see it on my github repo.

Put a comment of your experience on creating first iOS app using storyboard. For some people it is a bit difficult on using Xcode since it has complex UI (it’s me haha), but maybe it is easy for another people that are used to seeing the complex UI in Xcode.

In the next session, I will explain the basic of swift programming language and a little bit shortcuts we need to know on Xcode.