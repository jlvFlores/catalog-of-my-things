# catalog-of-my-things

## Getting Started

In this project, we will create a console app that will help a user keep a record of different types of things they own: books, music albums, movies, and games. Everything is based on the UML class diagram presented below.

![catalog of my things uml diagram](./assets/catalog_of_my_things_uml.png)

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 OOP-school-library <a name="about-project"></a>

**Catalog of my things** is a simple console app that allows users to manage collections of the things they own. Here is a [video](https://drive.google.com/file/d/1O0AY-0lq8AWu-bSShIZdy_u0z9KYdzfQ/view?usp=sharing) of how it works.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Server</summary>
  <ul>
    <li>Locally using <a href="https://learn.microsoft.com/en-us/windows/wsl/about">WSL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Key features of the repository.

- **List options for Games, Books, Albums, Genres, Authors and Labels***
- **Options to add new Games, Books or Albums***
- **Methods to store and get data from json file**
- **Has Rubocop to enforce best ruby practices**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

Follow these steps in order to run ruby code.

### Prerequisites

First you need to ensure that you have ruby installed in your computer. 

### Install

It varies depending on your operating system so here are some links to help you install it on [Windows](https://gorails.com/setup/windows/10) and on [Ubuntu](https://www.ruby-lang.org/en/documentation/installation/#apt). 

For MacOS run the following commands

```sh
  brew install rbenv ruby-build
  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile

  # Install Ruby
  rbenv install 3.0.1
  rbenv global 3.0.1
  ruby -v
```

This example shows how to install Ruby 3.0.1 which was the latest version in April 2021, but you can check to see if there is a newer version [here](https://www.ruby-lang.org/en/downloads/releases/). Iy is also assumed that you have [homebrew](https://brew.sh/) already installed on your Mac.

### Setup

Once you have ruby installed, run this command to get the project on your local machine.

```sh
  git clone git@github.com:jlvFlores/catalog-of-my-things.git
```

### Usage

Once you have the project installed, access the project's root directory usign this command 

```sh
  cd catalog-of-my-things
```

And lastly, run this command to see the project in action.

```sh
  ruby main.rb
```

Here is a brief [video](https://drive.google.com/file/d/1O0AY-0lq8AWu-bSShIZdy_u0z9KYdzfQ/view?usp=sharing) explaining the project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Here is a mention all of the collaborators of this project.

👤 **Author 1**

- GitHub: [@jlvFlores](https://github.com/jlvFlores)
- Twitter: [@JoseVaz44312762](https://twitter.com/JoseVaz44312762)
- LinkedIn: [Jose (Luis) Vazquez](https://www.linkedin.com/in/jose-luis-vazquez/)

👤 **Author 2**

- GitHub: [@Cisco-the-wayword](https://github.com/Cisco-the-wayword)
- Twitter: [@the_wayword1](https://twitter.com/the_wayword1)
- LinkedIn: [Boluwatife Adegboyega](https://www.linkedin.com/in/boluwatife-adegboyega-9397a81b3/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The following are the future features that will be added to the project.

- [ ] **It will probably not take over the world**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can give me a hand by recommending me to potential employers! 😉🤝

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank those who have motivated me to keep on fighting despite how tough the journey may become.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
