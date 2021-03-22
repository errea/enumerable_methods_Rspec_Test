
![](https://img.shields.io/badge/Microverse-blueviolet)

# enumerable_methods

This is the first project that welcomes us into the Ruby Section of the *Microverse Remote Software Development Curriculum*.

### Project 2: Enumerable Methods
This Project was collaborative, I and my coding partner learned about the Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods.  To prove that there's no magic to it, you're going to rebuild those methods.

### Advanced Building Blocks  (Assignment 2)

<div class="lesson-content__panel" markdown="1">

1. First we created a script file to house our methods called enumerable.rb and run it in IRB to test them later.
2. We had to add  new methods onto the existing Enumerable module.  Description is seen below:

~~~ruby
  module Enumerable
    def my_each
      # your code here
    end
  end
~~~

3. We created our enumerable_methods in the enumerable.rb file as follows:

  i. `#my_each`, a method that is identical to `#each` but (obviously) does not use `#each`.  

ii.  `#my_each_with_index`

iii.  `#my_select`

iv. `#my_all?`

v. `#my_any?`

vi. `#my_none?`

vii `#my_count`

viii. `#my_map`

  ix. `#my_inject`

### Extra Requirements on the projecct

  We had to test our `#my_inject` by creating a method called `#multiply_els` which multiplies all the elements of the array together by using `#my_inject`, e.g. `multiply_els([2,4,5]) #=> 40`

We had to modify our `#my_map` method to take a proc instead.

We were also required to modify our `#my_map` method to take either a proc or a block. 

</div>

## Built With

- Ruby
-  VsCode

## Live Code

<!---[Eri Solution](https://repl.it/@eri/Bubble-Sort#bubblesort.rb)

[John Solution](https://repl.it/@john/Bubble-Sort#bubblesort.rb)  --->

## Getting Started

To get a local copy of the repository please run the following commands on your terminal:

```
$ cd <folder>
```

```
$ git clone https://github.com/John-Arboleda/enumerable_methods.git
```

## Authors

👤 **Eri**

- Github: [@errea](https://github.com/errea/)
- Twitter: [Erreakay](https://twitter.com/Erreakay)
- Linkedin: [eri-ngozi-okereafor](https://www.linkedin.com/in/eri-ngozi-okereafor/)

👤 **John**

- Github: [John](https://github.com/John-Arboleda)
- Twitter: [John](https://twitter.com/John_J_Arboleda)
- Linkedin: [john-jairo-arboleda-castillo](https://www.linkedin.com/in/john-jairo-arboleda-castillo/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/John-Arboleda/enumerable_methods/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Project originally taken from The Odin Project
- Project inspired by Microverse Program

>## 📝 License

This project is [MIT](./LICENSE) licensed.

# Ruby Course

If you are not familiar with linters and GitHub Actions, read [root level README](../README.md).

## Set-up Rubocop GitHub Action

[Rubocop](https://www.rubocop.org/) is a Ruby static code analyzer (a.k.a. linter) and code formatter. It will enforce many of the guidelines outlined in the community [Ruby Style Guide](https://rubystyle.guide/).

This GitHub Action is going to run [Rubocop](https://docs.rubocop.org/en/stable/) to help you find style issues.

Please do the following **steps in this order**:

1. In the first commit of your feature branch create a `.github/workflows` folder and add a copy of [`.github/workflows/linters.yml`](.github/workflows/linters.yml) to that folder.
    - **Remember** to use the file linked above
    - **Remember** that `.github` folder starts with a dot.
2. **Do not make any changes in config files - they represent style guidelines that you share with your team - which is a group of all Microverse students.**
    - If you think that change is necessary - open a [Pull Request in this repository](../README.md#contributing) and let your code reviewer know about it.
3. When you open your first pull request you should see the result of the GitHub Actions:

Click on the `Details` link to see the full output and the errors that need to be fixed:

## [OPTIONAL]Set-up RSpec GitHub Action

You can run your tests with GitHub Actions to ensure that they are passing before merging a PR.

To use the GitHub Action to run your tests, please do the following **steps in this order**:

1. Add a copy of [`.github/workflows/tests.yml`](.github/workflows/tests.yml) to your `.github/workflows` folder.
    - **Remember** to use the file linked above
    - Do not modify or delete the [`.github/workflows/linters.yml`](.github/workflows/linters.yml) file that should already be in that folder.
    - RSpec by default will try to run any file ending in `_spec.rb` inside the `spec` folder. Make sure to follow this convention for your tests files so `rspec` can run your spec files.
    - You can modify the [`.github/workflows/tests.yml`](.github/workflows/tests.yml) file to better fit your custom needs.
3. When you open your pull request you should see the result of the GitHub Action:

Click on the `Details` link of the test action to check the results of your tests.

## Set-up linters in your local env

### [RuboCop](https://docs.rubocop.org/en/stable/)

1. Add `gem 'rubocop', '~>0.81.0'` to `Gemfile` (not sure how to use Gemfile? Read [this](https://bundler.io/v1.15/guides/bundler_setup.html)).
2. Run `bundle install`.
3. Copy [.rubocop.yml](./.rubocop.yml) to the root directory of your project
4. **Do not make any changes in config files - they represent style guidelines that you share with your team - which is a group of all Microverse students.**
    - If you think that change is necessary - open a [Pull Request in this repository](../README.md#contributing) and let your code reviewer know about it.
5. Run `rubocop`.
6. Fix linter errors.
7. **IMPORTANT NOTE**: feel free to research [auto-correct options for Rubocop](https://rubocop.readthedocs.io/en/latest/auto_correct/) if you get a flood of errors but keep in mind that correcting style errors manually will help you to make a habit of writing a clean code!

## Troubleshooting

- While using Colorize gem, if you are facing errors with Rspec related to
    ```bash
    LoadError:
    cannot load such file -- colorize
    ```
    please remove ```--deployment``` from line no. [26](https://github.com/shubham14p3/Ruby-capstone-project/blob/ca86784cc88bea7c933e329c0953f07e21bcf6ca/.github/workflows/tests.yml#L16) of test.yml file.