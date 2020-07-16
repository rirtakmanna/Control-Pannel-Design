
echo '
.cache/
coverage/
dist/
prod/
node_modules/
*.log

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
' >>.gitignore

echo "# Control-Pannel-Design" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:rirtakmanna/Control-Pannel-Design.git
git push -u origin master
npm init
# parcel watch src/index.html
# parcel build src/index.html -d prod --public-url

npm cache clean --force
npm i -D parcel-bundler
npm i autoprefixer

mkdir src src/sass src/js

echo "console.log('Hello World')" >>src/js/app.js

echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8' />
    <meta name='viewport' content='width=device-width, initial-scale=1.0' />

    <!-- link css file -->
    <link rel='stylesheet' href='./sass/main.scss' />

    <!-- link js file -->
    <script src='./js/app.js' defer></script>

    <title>Document</title>
  </head>
  <body>
  <div class='wraper'></div>
  </body>
</html>
" >>src/index.html

echo "/*clearfix*/

@mixin clearfix {
  &::after {
    content: '';
    display: table;
    clear: both;
  }
}

/*
bg-desktop  - 1900px and up       -min-width(118.75em)      1900px/16   118.75em
desktop     - 1600px and up       -min-width(100em)         1600px/16   100em
laptop      - 1200px and up
tab-land    - 950px and up        -max-width(75em)          1200px/16   75em
tab-prot    - 700px and up        -max-width(59.375em)      950px/16    59.375em
phone-land  - 400px and up        -max-width(43.75em)       700px/16    43.75em
phone-prot  - 400px and down      -max-width(28.125em)      450px/16    28.125em

*/

@mixin respond(\$breakpoint) {
  @if \$breakpoint == bg-desk {
    @media only screen and (min-width: 118.75em) {
      @content;
    }
  }
  @if \$breakpoint == desk {
    @media only screen and (min-width: 100em) {
      @content;
    }
  }
  @if \$breakpoint == tab-land {
    @media only screen and (max-width: 75em) {
      @content;
    }
  }
  @if \$breakpoint == tab-prot {
    @media only screen and (max-width: 59.375em) {
      @content;
    }
  }
  @if \$breakpoint == phone-land {
    @media only screen and (max-width: 43.75em) {
      @content;
    }
  }
  @if \$breakpoint == phone-prot {
    @media only screen and (max-width: 28.125em) {
      @content;
    }
  }
}

/*

@include respond(tab-land) {        //900px to 1200px max-width(75em)
}
@include respond(tab-prot) {        //700px to 900px max-width(59.375em)
}
@include respond(phone-land) {      //400px to 700px max-width(43.75em)
}
@include respond(phone-prot) {      //0px to 400px max-width(28.125em)
}
@include respond(desk) {            //1600px - 2000px min-width(100em) 
}
@include respond(bg-desk) {         //2000px and up min-width(118.75em)
}


*/
" >>src/sass/_mixins.scss

echo "@import 'mixins';

* {
  margin: 0;
  padding: 0;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}
html {
  font-size: 62.5%;

  //media quries in series
  @include respond(tab-land) {
    //max-width(1200px)
    font-size: 56.25%; //1rem = 9px
  }
  @include respond(tab-prot) {
    //max-width(950px)
    font-size: 50%; //1rem = 8rem
  }
  @include respond(desk) {
    //min-width(1900px)
    font-size: 75%; //1rem = 12px
  }
  @include respond(bg-desk) {
    //min-width(1600px)
    font-size: 87.5%; //1rem = 14px
  }
}

body {
  box-sizing: border-box;
  position: relative;
}

.wraper {
  position: absolute;
  width: 100vw;
  overflow-x: hidden;
}
" >>src/sass/main.scss

echo "
last 10 versions
not dead
> 0.2%
" >>.browserslistrc

echo "module.exports = {
  plugins: [
    require('autoprefixer')
  ]
}" >>postcss.config.js

echo "module.exports = {
  preset: [
    'default',
    {
      discardComments: {
        removeAll: true
      }
    }
  ]
}" >>cssnano.config.js

echo '{
  "presets": ["@babel/preset-react"]
}
' >>.babelrc

git add --all
git commit -m 'Initial Setup'
git push
