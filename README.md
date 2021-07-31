# 🇮🇳 India States Map Game
![Made with Swift](https://img.shields.io/badge/swift-%23FA7343.svg?style=flat&logo=swift&logoColor=white)

[<img src="https://developer.apple.com/app-store/marketing/guidelines/images/badge-example-preferred_2x.png" width="150"/>](https://apps.apple.com/au/app/india-states-map-game/id1578581115?ign-mpt=uo%3D2)

*Working names for this project included "India States Quiz," "India State Quiz," and virtually all other variations on that name so I apologize any nomenclatural inconsistency.*
## Summary
How did you learn the states or provinces of your home country? I learned the U.S. states by playing dorky map games quizzes online, like [this one](https://online.seterra.com/en/vgp/3003). But this sort of functionality is often best expressed through a mobile app, and while there are pretty good English-language map games for, say, the [U.S.](https://apps.apple.com/us/app/united-states-map-quiz/id925224914) and [Canada](https://apps.apple.com/us/app/canada-map-quiz/id1137431114), (well, er..they get the job done), there wasn't a good one for India. Americans' international literacy would be improved by learning new things about other nations, and where better to start than India (pop. > 1.3 billion)?

My goal was to make an intuitive, modern, and fun game to facilitate the learning, not only of the locations of the Indian states, but of the spoken languages, state capitals, and more, thus providing a richer cultural overview than mere location. 

## Features

* **The Game**. The core experience which shows a highlighted state and some options the user can press. When the right state is hit, the user is presented with a "success" screen, showing them interesting state information and prompting them to continue. After all states have been completed, a "done" screen is shown, with statistics on how many states they got right on their 1st–4th try and the time they took to answer for all 36 states/union territories. They're then prompted as to whether they'd like to be done, or restart.
* **User Statistics**. The user can see their best time for game completion as well as the percent correct for first try for each individual state.
* **Settings**. Modular settings screen with the option to toggle volume on/off and a rate button. Features can be easily added.

## Design Decisions

* This app was made in SwiftUI because I really like working with SwiftUI and I wanted to use some of its iOS 14 features like `@AppStorage` and `WindowGroup`. 
* It can be run on iOS, iPadOS, and Mac Catalyst. Minimal design changes have been made between platforms to keep code concise and maintain a predictable UI. However, larger-screened devices (iPad, Mac) have a few "width limitations" on certain views to ensure text is easily readable, and some views which were shown in navigation on iOS/iPadOS are shown as sheets in MacOS for a better user experience.
* The primary data structure for Indian states/union territories is the `InState` struct. Unfortunately I made a poor decision and defined all the states as global variables (i.e. `MADHYA_PRADESH`, etc.) and stored them in a list called `STATES_UT`. So this isn't good Swift practice but it gets the job done.
* Prodigious use of SwiftUI's **Previews** has been made to test views and compare their appearances between platforms. When thought appropriate, previews are sized to fit component views; *screens* are previewed as full-sized devices.

## License

You are free to copy, modify & distribute the code contained herein for **educational use only.** You may not use any of the code found in this repository for any commercial and/or published app or project without prior explicit permission from the creator. Doing so will result in the creator hunting your app/repository down, siccing his attack dogs on you, yadda yadda...

To be serious, please only use this project to learn or help others learn SwiftUI. Consider the paragraph above the legitimate license requirements but as I'm sure you already know there's nothing I can really do to prevent you from cloning it and doing your own thing. 🤞Mildly apprehensive proponents of the honor system, unite!
