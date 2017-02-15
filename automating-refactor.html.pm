#lang pollen

◊define-meta[date]{2015-11-02}

◊date[metas]

◊topic{Automating Clojure refactor with rewrite-clj}

◊main{

◊h3[#:class "left-margin"]{Problem}

One day I decided to make view's code in one of the projects a little bit more concise and abstracted. Project is a huge SPA written in ◊link["https://github.com/omcljs/om"]{Om} with ◊link["https://github.com/r0man/sablono"]{Sablono} used for templating. Grid is provided by Bootstrap-based CSS framework, so code had many of things like:

◊script[#:src "https://gist.github.com/ul/83d8261420252c251676.js"]

And I wanted to replace it with something like this:

◊script[#:src "https://gist.github.com/ul/b13a0f2dd51757348db7.js"]

Not a big win really. Some space is saved, arguably less to type (but editor autocompleter neglects this difference), may be easier to read, and easier to replace grid framework — no need to search & replace every class usage in that case, just change them in ◊code{row} and ◊code{col} functions. But wait, if it is very easy to do, why not? Little win for little cost, fair deal, I thought, after looking first time at the simplest case ◊strong{(1)}. Regular expressions can do it! But wait. I discovered ◊strong{(2)} and ◊strong{(3)} cases in my code. And... it is LISP after all, I should be able to process code intelligently. Regexes aside, let's refactor Clojure with Clojure!

Actually, I was inclined to not invest much efforts in that refactor and decline it as soon as I realize that I mess with it too long, because of not much ROI in that particular case. But I decided to finish up the thing because:

* it is good exercise to sharp coding skills
* hey, in the future I could really need this type of refactor, I want to be ready!

So, my goals was to write a code, which will automatically convert ◊strong{(1-3)} cases in the codebase, and also will import ◊code{row} and ◊code{col} functions in ◊code{ns} declaration where necessary (the latter task is not covered in this article and left as an exercise to the reader).

I was sure that I had no ◊strong{(4)} case in my code (no dynamically generated attribute maps for ◊code{:div.row} and ◊code{:div.col-sm-*} tags). Generally, it is very complex case. We need either to evaluate code to detect it or apply some heuristics (i.e. detecting typical hash-map-related functions) and ask user to manually verify and refactor such places.

◊h3[#:class "left-margin"]{Tools}

Okay, I decided to use Clojure as the main tool for refactoring Clojure (actually Clojurescript, but it doesn't matter in that case) code. But Clojure's core library doesn't have tools for convenient source tree parsing & walking. Day-to-day needs of code transformation are solved by macros.

My google-fu led me to the ◊link["https://github.com/xsc/rewrite-clj"]{rewrite-clj} library, which is capable of walking and editing Clojure source tree in a whitespace-preserving way. The latter was also one of the requirements: do not touch formatting as much as possible. Because it is not hard to automatically fix some lining up issues with the excellent ◊link["https://github.com/weavejester/cljfmt"]{cljfmt} (which is also uses rewrite-clj!), but if formatting will be completely screwed up, it will cause some headache.

◊h4[#:class "left-margin"]{Zippers}

Zippers are a swiss knife of the rewrite-clj. I knew that they exist in ◊link["https://clojure.github.io/clojure/clojure.zip-api.html"]{Clojure stdlib} and that they are useful for dealing with tree-like structures, but I've never used them before. It took some time to wrap my head around, fortunately there are a number of articles lying around in the Net, like ◊link["http://www.ibm.com/developerworks/library/j-treevisit/"]{this} and ◊link["http://blog.korny.info/2014/03/08/xml-for-fun-and-profit.html"]{this.} Thus I will not make any specific introduction to zippers here, but will show how I used them for my task.

◊h3[#:class "left-margin"]{Disclaimer}

I'm very new to zippers and programmatic source tree editing. Code used for this article was written as the first attempt to touch those areas, and it is neither idiomatic nor efficient. I gratefully will receive any advice on improvement.

◊div[#:class "left-margin"]{◊h3{Solution}◊h4{Walking tree}}

First of all, I need some kind of tree-walking function, which will traverse my source tree and check every node for being applicable to refactor, and edit it with appropriate refactor strategy (or tactics ;-)).

Let's import rewrite-clj:

◊script[#:src "https://gist.github.com/ul/934775bb5a3b78cd34a4.js"]

And write simple recursive walk over the tree:

◊script[#:src "https://gist.github.com/ul/ef008b41e1df0e2e4be7.js"]

Note two things:

* We pass zipper location, not the node it points, directly to  the ◊code{editor}, in contrast to using ◊code{(z/edit loc editor)}. It makes things simpler, because ◊code{rewrite-clj.zip} has many handy node testing (like ◊code{z/vector?} or ◊code{z/map?}) and editing functions (like ◊code{z/assoc} or ◊code{z/insert-right} (automatically inserting whitespace node when necessary!)), and they take zipper location, not the plain node, as an argument. The only downside I see is that in editor we must guarantee that we return edited, but the same location, to be sure that we don't skip nodes during traverse. May be using ◊code{z/subedit-node} and taking a root from returned zipper can solve this inconvenience, but I've not investigated this approach yet.
* We don't separate matching and editing, just return location unedited if it does not require refactor.

Now we can represent refactor as such editor function. To apply several refactors in a row, we can just compose them. The only trick I would add to is allowing editor to return falsey value for unedited location. This shorthand will significantly simplify writing editors.

◊script[#:src "https://gist.github.com/ul/ac40b4c777d60e85b8e1.js"]

◊h4[#:class "left-margin"]{Refactor transformations}

Now it's a time to write an editor function to achieve transformation stated as the problem to solve. Here I will present very straightforward version, not very elegant and it is using conditional branching heavily. But it has one doubtless benefit: it is very alike to the actions you perform by hands in editor when you change code. And zippers give you ability to control source rewriting in the manner of Logo Turtle: move here, put the pen down, draw, lift it up, return back. Look at the node, if it's vector with tag I want to replace with function then make it a list, make replacement, and check that all classes written in shorthand form ◊code{:div.class1.class2} are put into the attributes map. How? Look at the second element of vector, if it's a map, find ◊code{:classes} and look at the next value... You've got it.

◊script[#:src "https://gist.github.com/ul/7dbe0be9446bc176dafa.js"]

◊h4[#:class "left-margin"]{CLI}

To make a nice interface for my refactor I used the code of ◊link["https://github.com/weavejester/cljfmt/tree/master/lein-cljfmt"]{lein-cljfmt} almost as-is and just replaced ◊code{cljfmt/reformat-string} calls with my own function doing ◊code{(n/string (apply-refactors (z/of-string s) [fix1]))}. Besides of finding all source files and applying refactor to them it gave me ability to see a colored diff of changes to be made. Wow!

◊;{
FIXME include automating-refactor.txt content here
}

◊h3[#:class "left-margin"]{Conclusion}

Written code looks for me like a database migration, but applied to code. I wish I have some library, which simplifies and abstracts some typical refactor actions further, to start using such “migrations” on regular basis (like DB migrations are used).

◊h3[#:class "left-margin"]{Thanks}

I want to thank ◊link["http://www.condense.com.au/"]{Condense} for opportunity to apply beloved Clojure to large projects and for having space to research its capabilities along with day-to-day pragmatic tasks.

}
