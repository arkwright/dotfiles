// Generated on 2013-10-25 using generator-angular 0.5.1
'use strict';

// # Globbing
// for performance reasons we're only matching one level down:
// 'test/spec/{,*/}*.js'
// use this if you want to recursively match all subfolders:
// 'test/spec/**/*.js'

module.exports = function (grunt) {
  require('load-grunt-tasks')(grunt);
  require('time-grunt')(grunt);

  grunt.initConfig({

  // reads app name and version etc.
  pkg: grunt.file.readJSON('package.json'),


  /**
  * Constants for the Gruntfile so we can easily change the path for our environments.
  */
  BASE_PATH: '',
  DEVELOPMENT_PATH: 'src/',
  PRODUCTION_PATH: 'web/',

  /**
   * A code block that will be added to our minified code files.
   * Gets the name and appVersion and other info from the above loaded 'package.json' file.
   * @example <%= banner.join("\\n") %>
   */
  banner: [
           '/*',
           '* Project: <%= pkg.name %>',
           '* Version: <%= pkg.appVersion %> (<%= grunt.template.today("yyyy-mm-dd") %>)',
           '* Development By: <%= pkg.developedBy %>',
           '* Copyright(c): <%= grunt.template.today("yyyy") %>',
           '*/'
  ],

  /**
  * The different constant names that will be use to build our html files.
  * @example <!-- @if NODE_ENV == 'DEVELOPMENT' -->
  */
  env: {
      web: {
        NODE_ENV : 'WEB',
        CORDOVA : 'FALSE'
      },
      ios : {
        NODE_ENV : 'IOS',
        CORDOVA : 'TRUE'
      },
      android : {
        NODE_ENV : 'ANDROID',
        CORDOVA : 'TRUE'
      }
  },

    /**
    * Allows us to pass in variables to files that have place holders so we can similar files with different data.
    * This plugin works with the 'env' plugin above.
    * @example <!-- @echo appVersion --> or <!-- @echo filePath -->
    */
    preprocess : {
        // Task to create the index.html file that will be used during development.
        // Passes the app version and creates the /index.html
        web : {
            src : '<%= yeoman.app %>/config.html',
            dest : '<%= yeoman.app %>/index.html',
            options : {
                context : {
                    // appVersion : '<%= pkg.appVersion %>',
                    filePath: ''
                }
            }
        },
        // Task to create the index.html file that will be used in production.
        // Passes the app version and creates the /index.html
        ios : {
            src : '<%= yeoman.app %>/config.html',
            dest : '<%= yeoman.app %>/index.html',
            options : {
                context : {
                    // appVersion : '<%= pkg.appVersion %>',
                    filePath: ''
                }
            }
        }
    },

    /**
     * Prepends the banner above to the minified files.
     */
    usebanner: {
        dist: {
            options: {
                position: 'top',
                banner: '<%= banner.join("\\n") %>',
                linebreak: true
            },
            files: {
                src: [
                    '<%= PRODUCTION_PATH %>' + 'assets/scripts/scripts.js',
                    '<%= PRODUCTION_PATH %>' + 'assets/styles/main.css'
                ]
            }
        }
    },

    /**
    * The useminPrepare part of the usemin plugin looks at the html file and checks for a build:js or build:css code block.
    * It will take those files found in the code block(s) and concat them together and then runs uglify for js and/or cssmin for css files.
    * useminPrepare requires grunt-contrib-uglify, grunt-contrib-concat, and grunt-contrib-cssmin plugins to be installed. Which is listed in the package.json file.
    *
    * The usemin part will remove the code block(s) and replace that area with the single file path in the html file.
    */
    useminPrepare: {
    html: '<%= yeoman.app %>/index.html',
      options: {
        dest: '<%= yeoman.dist %>'
      }
    },
    usemin: {
      html: ['<%= yeoman.dist %>/{,*/}*.html'],
      css: ['<%= yeoman.dist %>/styles/{,*/}*.css'],
      options: {
        dirs: ['<%= yeoman.dist %>']
      }
    },

    // yoman framework magic
    yeoman: {
      // configurable paths
      app: require('./bower.json').appPath || 'app',
      dist: 'dist'
    },

    watch: {
      coffee: {
        files: ['<%= yeoman.app %>/scripts/{,*/}*.coffee'],
        tasks: ['coffee:dist']
      },
      coffeeTest: {
        files: ['test/spec/{,*/}*.coffee'],
        tasks: ['coffee:test']
      },
      compass: {
        files: ['<%= yeoman.app %>/styles/{,*/}*.{scss,sass}'],
        tasks: ['compass:server', 'autoprefixer']
      },
      styles: {
        files: ['<%= yeoman.app %>/styles/{,*/}*.css'],
        tasks: ['copy:styles', 'autoprefixer']
      },
      confightml: {
        files: ['<%= yeoman.app %>/config.html'],
        tasks: ['preprocess:web']
      },
      livereload: {
        options: {
          livereload: '<%= connect.options.livereload %>'
        },
        files: [
          // Comment out one or more of these lines to disable Grunt auto-HTML, CSS, JS, or image refresh, respectively.
          // '<%= yeoman.app %>/{,*/}*.html',
          // '.tmp/styles/{,*/}*.css',
          // '{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js',
          // '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
        ]
      }
    },

    autoprefixer: {
      options: ['last 1 version'],
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/styles/',
          src: '{,*/}*.css',
          dest: '.tmp/styles/'
        }]
      }
    },

    processhtml: {
      options: {
          strip: true,
          process: true,
          commentMarker: 'process'
      },
      dist: {
          files: {
              'dist/index.html': ['app/index.html']
          }
      },
      // ios: {
      //     files: {
      //         'dist/index.html': ['app/index.html']
      //     }
      // },
      android: {
          files: {
              'dist/index.html': ['app/index.html']
          }
      }
    },

    connect: {
      options: {
        port: 9000,
        // Change this to '0.0.0.0' to access the server from outside.
        hostname: '0.0.0.0',
        livereload: 35729
      },
      livereload: {
        options: {
          // open: true, //no more auto open we know how to type in a url thanks.
          base: [
            '.tmp',
            '<%= yeoman.app %>'
          ]
        }
      },
      test: {
        options: {
          port: 9001,
          base: [
            '.tmp',
            'test',
            '<%= yeoman.app %>'
          ]
        }
      },
      dist: {
        options: {
          base: '<%= yeoman.dist %>'
        }
      }
    },
    clean: {
      dist: {
        files: [{
          dot: true,
          src: [
            '.tmp',
            '<%= yeoman.dist %>/*',
            '!<%= yeoman.dist %>/.git*',
            '<%= yeoman.dist %>/scripts/config.js'
          ]
        }]
      },
      dist_not_gz: {
        files: [
         { expand: true, cwd: "dist/", src: ['**/*.html', '**/*.css', '**/*.js']}
        ]
      },
      www: {
        files: [{
          expand: true,
          cwd: 'www/',
          src: '**'
        }]
      },
      server: '.tmp'
    },
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        'Gruntfile.js',
        '<%= yeoman.app %>/scripts/{,*/}*.js'
      ]
    },
    coffee: {
      options: {
        sourceMap: true,
        sourceRoot: ''
      },
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/scripts',
          src: '{,*/}*.coffee',
          dest: '.tmp/scripts',
          ext: '.js'
        }]
      },
      test: {
        files: [{
          expand: true,
          cwd: 'test/spec',
          src: '{,*/}*.coffee',
          dest: '.tmp/spec',
          ext: '.js'
        }]
      }
    },
    compass: {
      options: {
        sassDir: '<%= yeoman.app %>/styles',
        cssDir: '<%= yeoman.app %>/styles',
        generatedImagesDir: '.tmp/images/generated',
        imagesDir: '<%= yeoman.app %>/images',
        javascriptsDir: '<%= yeoman.app %>/scripts',
        fontsDir: '<%= yeoman.app %>/fonts',
        importPath: '<%= yeoman.app %>/bower_components',
        httpImagesPath: '/images',
        httpGeneratedImagesPath: '/images/generated',
        httpFontsPath: '/fonts',
        relativeAssets: false
      },
      dist: {},
      server: {
        options: {
          debugInfo: true
        }
      }
    },

    // not used since Uglify task does concat,
    // but still available if needed
    /*concat: {
      dist: {}
    },*/
    rev: {
      dist: {
        files: {
          src: [
            '<%= yeoman.dist %>/scripts/{,*/}*.js',
            '<%= yeoman.dist %>/scripts/{,*/,*/}*.js',
            '<%= yeoman.dist %>/styles/{,*/}*.css',
            '<%= yeoman.dist %>/images/*.{png,jpg,jpeg,gif,webp,svg}',
            '<%= yeoman.dist %>/fonts/*'
          ]
        }
      }
    },
    imagemin: {
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.{png,jpg,jpeg}',
          dest: '<%= yeoman.dist %>/images'
        }]
      }
    },
    svgmin: {
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.svg',
          dest: '<%= yeoman.dist %>/images'
        }]
      }
    },
    cssmin: {
      // By default, your `index.html` <!-- Usemin Block --> will take care of
      // minification. This option is pre-configured if you do not wish to use
      // Usemin blocks.
      // dist: {
      //   files: {
      //     '<%= yeoman.dist %>/styles/main.css': [
      //       '.tmp/styles/{,*/}*.css',
      //       '<%= yeoman.app %>/styles/{,*/}*.css'
      //     ]
      //   }
      // }
    },

   htmlmin: {
      dist: {
        options: {
          /*removeCommentsFromCDATA: true,
          // https://github.com/yeoman/grunt-usemin/issues/44
          //collapseWhitespace: true,
          collapseBooleanAttributes: true,
          removeAttributeQuotes: true,
          removeRedundantAttributes: true,
          useShortDoctype: true,
          removeEmptyAttributes: true,
          removeOptionalTags: true*/
        },
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>',
          src: ['*.html', 'views/*.html', 'partials/*.html'],
          dest: '<%= yeoman.dist %>'
        }]
      }
    },
    // Put files not handled in other tasks here
    copy: {
      dist: {
        files: [{
          expand: true,
          dot: true,
          cwd: '<%= yeoman.app %>',
          dest: '<%= yeoman.dist %>',
          src: [
            '*.{ico,png,txt}',
            '.htaccess',
            'bower_components/**/*',
            'images/{,*/}*.{gif,webp}',
            'images/temp_toolbar.png',
            'template/**/*'
          ]
        }, {
            expand:true,
            cwd: '<%= yeoman.app %>/fonts',
            src:['**'],
            dest: '<%= yeoman.dist %>/fonts'
        },
            {
          expand: true,
          cwd: '.tmp/images',
          dest: '<%= yeoman.dist %>/images',
          src: [
            'generated/*'
          ]
        }]
      },
      dist_to_www: {
        files: [{
          expand: true,
          cwd: 'dist/',
          src: [ '**' ],
          dest: 'www/'
        }]
      },
      styles: {
        expand: true,
        cwd: '<%= yeoman.app %>/styles',
        dest: '.tmp/styles/',
        src: '{,*/}*.css'
      }
    },
    concurrent: {
      server: [
        'coffee:dist',
        'compass:server',
        'copy:styles'
      ],
      test: [
        'coffee',
        'compass',
        'copy:styles'
      ],
      dist: [
        'coffee',
        'copy:styles',
        'imagemin',
        'svgmin',
        'htmlmin'
      ]
    },
    karma: {
      unit: {
        configFile: 'karma.conf.js',
        singleRun: true
      }
    },
    cdnify: {
      dist: {
        html: ['<%= yeoman.dist %>/*.html']
      }
    },
    ngmin: {
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/scripts',
          src: '*.js',
          dest: '<%= yeoman.dist %>/scripts'
        }]
      }
    },
    uglify: {
      dist: {
        files: {
          '<%= yeoman.dist %>/scripts/scripts.js': [
            '<%= yeoman.dist %>/scripts/scripts.js'
          ]
        }
      },
       options: {
	   banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */\n',
           mangle: false
       }
    },
     ngconstant: {
        /*
         * CQURL - All calls for the CQ stuffs (mobile cq url)
         * APIPROTOCOL, APIHOST - For all mystar calls
         * APIURL - deprecated as a constant, now exists as the ApiUrl service, which uses the above two API- constants. --fv
         * DESKTOPCQURL - Used for redirecting to the desktop site mainly. 
         */
          options: {
              space: '  '
          },

          local: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an ApiUrl, and mobile web app does not.
                  APIHOST: '',
                  APIPROTOCOL: 'http://',
                  CQURL: '',
		              ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
                  ENABLEMOBILEREDIRECT: false,
		              COMSCOREID: "3005674",
		              COMSCORESITE: ""
              }
          },
          integration: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an ApiUrl, and mobile web app does not.
                  APIHOST: '',
                  APIPROTOCOL: 'http://',
                  CQURL: '',
		              ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
                  ENABLEMOBILEREDIRECT: true,
          		    COMSCOREID: "3005674",
          		    COMSCORESITE: "http://mobile-dev.smgdigitaldev.com"
              }
          },
          staging: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an ApiUrl, and mobile web app does not.
                  APIHOST: '',
                  APIPROTOCOL: 'http://',
                  CQURL: '',
		              ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.stage.smgdigitaldev.com',
                  ENABLEMOBILEREDIRECT: true,
		              COMSCOREID: "3005674",
		              COMSCORESITE: "http://mobile-stage.smgdigitaldev.com"
              }
          },
          production: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an ApiUrl, and mobile web app does not.
                  APIHOST: '',
                  APIPROTOCOL: 'https://',
                  CQURL: 'http://m.thestar.com',
		              ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.thestar.com',
                  ENABLEMOBILEREDIRECT: true,
		              COMSCOREID: "3005674",
		              COMSCORESITE: "http://m.thestar.com"
              }
          },
	  ios: {
        dest: '<%= yeoman.app %>/config/config.js',
        wrap: '"use strict";\n\n <%= __ngModule %>',
        name: 'config',
        constants: {
          APIHOST: 'm.thestar.com',
          APIPROTOCOL: 'https://',
          CQURL: 'http://m.thestar.com',
          ADINDEX: "2",
          DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
          ENABLEMOBILEREDIRECT: false,
          COMSCOREID: "3005674",
          COMSCORESITE: "http://m.thestar.com"
        }
    },
	  android: {
        dest: '<%= yeoman.app %>/config/config.js',
        wrap: '"use strict";\n\n <%= __ngModule %>',
        name: 'config',
        constants: {
          APIHOST: 'm.thestar.com',
          APIPROTOCOL: 'https://',
          CQURL: 'http://m.thestar.com',
          ADINDEX: "1",
          DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
          ENABLEMOBILEREDIRECT: false,
    		  COMSCOREID: "3005674",
    		  COMSCORESITE: "http://m.thestar.com"
        }
      }
    },

      compress: {
        dist: {
          options: {
            mode: 'gzip'
          },
          files: [
             { expand: true, cwd: "dist/", src: ['**/*.html'], dest: 'dist/', ext: '.htmlgz', extDot: 'last'},
             { expand: true, cwd: "dist/", src: ['**/*.css'], dest: 'dist/', ext: '.cssgz', extDot: 'last'},
             { expand: true, cwd: "dist/", src: ['**/*.js'], dest: 'dist/', ext: '.jsgz', extDot: 'last'} 
          ]
        }
      },

      rename: {
        dist_gz: {
          files: [
             { expand: true, cwd: "dist/", src: ['**/*.htmlgz'], dest: 'dist/', ext: '.html', extDot: 'last'},
             { expand: true, cwd: "dist/", src: ['**/*.cssgz'], dest: 'dist/', ext: '.css', extDot: 'last'},
             { expand: true, cwd: "dist/", src: ['**/*.jsgz'], dest: 'dist/', ext: '.js', extDot: 'last'} 
          ]
        }
      },

// Grunt-S3 stuff
      aws: grunt.file.readJSON('aws-key.json'), // Read the file

      aws_s3: {
          options: {
              accessKeyId: '<%= aws.AWSAccessKeyId %>', // Use the variables
              secretAccessKey: '<%= aws.AWSSecretKey %>', // You can also use env variables
              uploadConcurrency: 5, // 5 simultaneous uploads
              downloadConcurrency: 5 // 5 simultaneous downloads
          },
          integration: {
              options: {
                  bucket: 'mobile-dev.smgdigitaldev.com',
                  differential: true // Only uploads the files that have changed
              },
              files: [
                  {expand: true, cwd: 'dist/', src: ['**', '!**/*.html', '!**/*.css', '!**/*.js'], action: 'upload'},
                  {expand: true, cwd: 'dist/', src: ['**/*.css'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'text/css'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.js'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'application/x-javascript'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.html'], action: 'upload', params: {CacheControl: 'max-age=300', ContentEncoding: 'gzip', ContentType: 'text/html'}},
                  {dest: '**', cwd: 'backup/integration/', action: 'download'}
              ]
          },
          staging: {
              options: {
                  bucket: 'mobile-stage.smgdigitaldev.com',
                  differential: true // Only uploads the files that have changed
              },
              files: [
                  {expand: true, cwd: 'dist/', src: ['**', '!**/*.html', '!**/*.css', '!**/*.js'], action: 'upload'},
                  {expand: true, cwd: 'dist/', src: ['**/*.css'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'text/css'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.js'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'application/x-javascript'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.html'], action: 'upload', params: {CacheControl: 'max-age=300', ContentEncoding: 'gzip', ContentType: 'text/html'}},
                  {dest: '**', cwd: 'backup/staging/', action: 'download'}
              ]
          },
          production: {
              options: {
                  bucket: 'mobile.thestar.com',
                  differential: true // Only uploads the files that have changed
              },
              files: [
                  {expand: true, cwd: 'dist/', src: ['**', '!**/*.html', '!**/*.css', '!**/*.js'], action: 'upload'},
                  {expand: true, cwd: 'dist/', src: ['**/*.css'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'text/css'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.js'], action: 'upload', params: {ContentEncoding: 'gzip', ContentType: 'application/x-javascript'}},
                  {expand: true, cwd: 'dist/', src: ['**/*.html'], action: 'upload', params: {CacheControl: 'max-age=300', ContentEncoding: 'gzip', ContentType: 'text/html'}},
                  {dest: '**', cwd: 'backup/prod/', action: 'download'}
              ]
          },
          clean_production: {
              options: {
                  bucket: 'mobilefe',
                  debug: true // Doesn't actually delete but shows log
              },
              files: [
                  {dest: 'app/', action: 'delete'}
              ]
          },
          download_production: {
              options: {
                  bucket: 'mobilefe'
              },
              files: [
                  {dest: 'app/', cwd: 'backup/', action: 'download'}
                  // Downloads the content of app/ to backup/
              ]
          },
          secret: {
              options: {
                  bucket: 'mobilefe',
                  access: 'private'
              },
              files: [
                  {expand: true, cwd: 'secret_garden/', src: ['*.key'], dest: 'secret/'}
              ]
          }
      },
      cordova_cli: {
        options: {
          // Task-specific options go here.
          cmd: 'build'
        },
        ios: {
         platforms: ['ios']
        },
        android: {
         platforms: ['android']
        }
      }
  });

  grunt.registerTask('server', function (target) {
    if (target === 'dist') {
      return grunt.task.run(['build-local', 'connect:dist:keepalive']);
    }

    grunt.task.run([
      'env:web',
      'preprocess:web',
      'clean:server',
      'concurrent:server',
      'autoprefixer',
      'connect:livereload',
      'watch'
    ]);
  });

  grunt.registerTask('test', [
    'clean:server',
    'concurrent:test',
    'autoprefixer',
    'connect:test',
    'karma'
  ]);

  grunt.registerTask('build-local', [
    'env:web',
    'preprocess:web',
    'clean:dist',
    'compass:dist',
    'copy:dist',
    'ngconstant:local', // First ngconstant task modifies app/config/config.js with values destined for the build.
    'useminPrepare', 'concat', 'cssmin', 'uglify',
    'ngmin',
    'concurrent:dist',
    'autoprefixer',
    'cdnify',
    'rev',
    'ngconstant:local', // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    // 'processhtml:dist'
    'usemin'
  ]);

  grunt.registerTask('build-int', [
    'env:web',
    'preprocess:web',
    'clean:dist',
    'compass:dist',
    'copy:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:integration',
    'useminPrepare', 'concat', 'uglify', 'cssmin',
    'ngmin',
    'concurrent:dist',
    'autoprefixer',
    'cdnify',
    'processhtml:dist',
    'rev',
    'usemin',
    // 'compress' task can't handle compressing a file and writing the
    // compressed version to the same file path, so we have to do it in three
    // steps: compress to a 'gz' extension, remove non-gz versions, rename 'gz'
    // versions to desired file name.
    'compress:dist',
    'clean:dist_not_gz',
    'rename:dist_gz',

    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

   grunt.registerTask('build-stage', [
    'env:web',
    'preprocess:web',
    'clean:dist',
    'compass:dist',
    'copy:dist',
    'ngconstant:staging',// First ngconstant task modifies app/config/config.js with values destined for the build.
    'useminPrepare', 'concat', 'uglify', 'cssmin',
    'ngmin',
    'concurrent:dist',
    'autoprefixer',
    'cdnify',
    'processhtml:dist',
    'rev',
    'usemin',

    // 'compress' task can't handle compressing a file and writing the
    // compressed version to the same file path, so we have to do it in three
    // steps: compress to a 'gz' extension, remove non-gz versions, rename 'gz'
    // versions to desired file name.
    'compress:dist',
    'clean:dist_not_gz',
    'rename:dist_gz',

    'ngconstant:local'// Second ngconstant task resets app/config/config.js with values appropriate for development environment.
  ]);

  grunt.registerTask('build-production', [
    'env:web',
    'preprocess:web',
    'clean:dist',
    'compass:dist',
    'copy:dist',
    'ngconstant:production', // First ngconstant task modifies app/config/config.js with values destined for the build.
    'useminPrepare', 'concat', 'cssmin', 'uglify',
    'ngmin',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:dist',
    'cdnify',
    'rev',
    'usemin',

    // 'compress' task can't handle compressing a file and writing the
    // compressed version to the same file path, so we have to do it in three
    // steps: compress to a 'gz' extension, remove non-gz versions, rename 'gz'
    // versions to desired file name.
    'compress:dist',
    'clean:dist_not_gz',
    'rename:dist_gz',

    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

  grunt.registerTask('build-ios', [
    // log env obj
    // grunt.log.writeln(grunt.config.get().env.ios.NODE_ENV),
    'env:ios',
    'preprocess:ios',
    'clean:dist',
    'compass:dist',
    'clean:www',
    'ngconstant:ios', // First ngconstant task modifies app/config/config.js with values destined for the build.
    'useminPrepare', 'concat', 'cssmin', 'uglify',
    // 'htmlmin',
    'ngmin',
    'copy:dist',
    'concurrent:dist',
    'usebanner',
    'autoprefixer',
    'cdnify',
    'rev',
    'usemin',
    // 'processhtml:ios',
    'copy:dist_to_www', // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
    // 'usebanner',
  ]);

   grunt.registerTask('build-android', [
    'env:android',
    'preprocess:web',
    'clean:dist',
    'compass:dist',
    'clean:www',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:android',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'concat',
    'copy:dist',
    'processhtml:android',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    'copy:dist_to_www',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
    // 'cordova-cli:android' // Does not work.
  ]);

  grunt.registerTask('default', [
    'jshint',
    'test',
    'build-int'
  ]);

  var packageJson = require('./package.json');

  if (packageJson.devDependencies) {
    for (var plugin in packageJson.devDependencies) {
      if (plugin.substring(0, 7)  === 'grunt-') {
        grunt.loadNpmTasks(plugin);
      }
    }
  }
};
