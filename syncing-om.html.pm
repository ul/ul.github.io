#lang pollen

◊define-meta[date]{2014-05-20}

◊date[metas]

◊topic{Syncing Om with Sente}

◊main{

As for now I'm using very simple optimistic syncing strategy for my ◊link["https://github.com/swannodette/om"]{Om} applications. Brilliant ◊link["https://github.com/ptaoussanis/sente"]{Sente} library makes this possible.

Server-side setup looks like:

◊script[#:src "https://gist.github.com/ul/c6aa280cc990acf423de.js"]

Client side:

◊script[#:src "https://gist.github.com/ul/2064977d1a64fdefb398.js"]

Now, let's send patch on every state update. Because it may come from ◊code{om/transact!} and some external ◊code{swap!} we use ◊code{:tx-listen} and ◊code{add-watch}:

◊script[#:src "https://gist.github.com/ul/068900c9cf733f8db400.js"]

◊code{send-patch!} is very simple — it takes difference of old and new state and send it to server:

◊script[#:src "https://gist.github.com/ul/7bebfa3406a0e8417f58.js"]

And let's update our state on patch arrival from server:

◊script[#:src "https://gist.github.com/ul/60a34923a0be781e37a0.js"]

Voilà! I will skip ◊code{retract}, ◊code{deep-merge} and server side patch-listening implementations, they are rather trivial.

This strategy gives us simple state sync management. Just for fun, if we want to unapply patch ◊code{[d- d+]} sent from client, we could send ◊code{[d+ d-]} back and it is done!

}
