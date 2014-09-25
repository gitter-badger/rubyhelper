# rubyhelper

Last Stable Gem  
[![Gem Version](https://badge.fury.io/rb/rubyhelper.svg)](http://badge.fury.io/rb/rubyhelper)  

Last release	**v1.3** ===> see the branch **#master**  
Last develop	**v1.4** ===> see the branch **#dev**  

You can see the documentation here : http://rubydoc.info/gems/rubyhelper  
The source code is available here  : https://gitlab.com/poulet_a/rubyhelper  


## How is it works ?
See the **[wtf]** section too know what is exactly this stuff.  
Too use the gem, install it :
```bash
$ gem install rubyhelper # install the last stable version
```

To use it in your ruby project, use
```ruby
require 'rubyhelper'
```


## Wtf ?
This gem is my own creation. It is a compilation of shortcuts, improvement,
helpers about the basic classes, String, Array, ... to make your work easier.  
I hope too help you with this gem. I put also few lines from stackoverflow etc.
in this gem ;)


## My favorites functions from this gem
- **String.new.static(n)** => String  
	Render a cool string with a static size. Few cool options tested and validated  
- **String.new.get_float** => String  
	Usefull to extract a Numerical value from a stupid String  
- **Array.new.average** =>  => Numerical  
	Simple and usefull integer average (*averagef for Float version*)  
- **Array.new.sum** => Integer  
	Simple and usefull integer sum (*sumf for Float version*)  
- **Array.new.strip** => Array  
	Split every Strings of the Array :)  


## Development cycle
The following sources code is not only my stuff, but also an implementation of
idea found on stackoverflow, ...  

The developpement running like that :  

### Development time (dev branch) ###
1. Found idea, create a new feature-* branch from branch#dev  
2. Puts idea or fix it in the source code (*can be switched with 3.*)  
3. Develops few tests and documente the code (*can be switched with 2.*)  
4. Merge the new code in the branch#dev with "--no-ff" option (*and optionaly tag it like v1.0.alpha2*)  
5. Update the Changelog etc.  
6. **repeat 1-5 actions few times until the next X or Y version**  

### Release Time (release branch) ###
7. Start a branch#release-X.Y  
8. Improves tests and checks the documentation, hunts the bugs  
9. Validates the version  
10. Push the version into branch#master and tag it as stable (*like v1.2*). Publish the gem.  
11. Merge with branch#release with branch#dev and got to the next dev version  

### Bugfix time (release branch) ###
13. Found bug in the code of a release, or an improvement  
14. Develop the patch in branch#hotfix-*  
15. Merge with branch#master, branch#dev  
16. Publish the new release vX.Y.Z if needed  


## Note about the development

**Note about the first time developpement**  
I didn't predict to keep this gem in dev so the first part of the dev
is a little messy. Don't look back 1.1 ;)  

### Versions
Stable :  
- X : major version, not compatible very with the previous. Lot of changes  
- X.Y : minor version, new features, almost fully compatible with other X.Y  
- X.Y.Z : release improvement, fix bugs, fully compatible with X.Y.Z  

Development :  
- X.Y-alphaN : 1th dev part. Dev new features  
- X.Y-betaN : 2sd part. Dev tests, documentation, improvements, fix, few other feats  
- X.Y-rcN : last part. Fixs, documentation, and tests only.  

### Branchs
- master : contain the last vX.Y.Z version published (stable)  
- dev : contain the last alpha/beta versions (dev)  
- release-X.Y : contain the last rc versions (dev)  
- feature-*_NN : new feature to merge (dev)  
- hotfixs-* : fix from release to merge with dev and X.Y (dev)


# Contributors
- poulet_a : Creator and main developer. Feel free to ask me a question by email.  
	- Researchs, Tests, Documentation, Feature, Lead development
	email: arthur.poulet AT cryptolab.net [OpenPGP : 0x6D9EA34A]  
- bakhou_r : Developer from jerevedunemaison.com
	- few Tests and Features
