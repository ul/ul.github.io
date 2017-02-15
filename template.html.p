<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>◊select['h1 doc] | RP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css" integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous"/>
    <link href="https://fonts.googleapis.com/css?family=PT+Mono|PT+Sans" rel="stylesheet"/>
    <link href="/index.css" rel="stylesheet"/>
</head>

<body>
    ◊->html[doc]
    ◊define[top (parent here)]
    ◊define[prv (and (not (equal? (previous here) top)) (previous here))]
    ◊define[nxt (next here)]
    ◊->html{
      ◊div[#:class "nav"]{
        ◊nav-link[prv 'larr]
        ◊nav-link[top 'uarr]
        ◊nav-link[nxt 'rarr]
      }
    }
</body>

</html>
