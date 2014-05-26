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
          process: true,
          commentMarker: 'process'
      },
      dist: {
          files: {
              'dist/index.html': ['app/index.html']
          }
      },
      native: {
          files: {
              'www/index.html': ['app/index.html']
          }
      }
    },
    preprocess: {
      options: {
        inline: true,
        context: {
            DEBUG: false
        }
      },
      js: {
        src: 'app/scripts/*.js'
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
          open: true,
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
        cssDir: '.tmp/styles',
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
            '<%= yeoman.dist %>/styles/{,*/}*.css',
            '<%= yeoman.dist %>/images/*.{png,jpg,jpeg,gif,webp,svg}',
           '<%= yeoman.dist %>/fonts/*'
          ]
        }
      }
    },
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
        'compass:dist',
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
    pkg: grunt.file.readJSON('package.json'),
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
          options: {
              space: '  '
          },

          local: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an APIURL, and mobile web app does not.
                  APIURL: '',
                  CQURL: '',
		  ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
		  COMSCOREID: "3005674",
		  COMSCORESITE: ""
              }
          },
          integration: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an APIURL, and mobile web app does not.
                  APIURL: '',
                  CQURL: '',
		  ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.dev-development.smgdigitaldev.com',
		  COMSCOREID: "3005674",
		  COMSCORESITE: "http://mobile-dev.smgdigitaldev.com"
              }
          },
          staging: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an APIURL, and mobile web app does not.
                  APIURL: '',
                  CQURL: '',
		  ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.stage.smgdigitaldev.com',
		  COMSCOREID: "3005674",
		  COMSCORESITE: "http://mobile-stage.smgdigitaldev.com"
              }
          },
          production: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  // Intentionally left blank. Native app requires an APIURL, and mobile web app does not.
                  APIURL: 'https://mobi.thestar.com',
                  CQURL: 'http://mobi.thestar.com',
		  ADINDEX: "0",
                  DESKTOPCQURL: 'http://www.thestar.com',
		  COMSCOREID: "3005674",
		  COMSCORESITE: "http://mobi.thestar.com"
              }
          },
	  ios: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  APIURL: 'http://mobile-dev.smgdigitaldev.com',
                  CQURL: 'http://mobile-dev.smgdigitaldev.com',
		  ADINDEX: "2",
		  COMSCOREID: "3005674",
		  COMSCORESITE: "http://mobile.smgdigitaldev.com"
              }
          },
	  android: {
              dest: '<%= yeoman.app %>/config/config.js',
              wrap: '"use strict";\n\n <%= __ngModule %>',
              name: 'config',
              constants: {
                  APIURL: 'http://mobile-dev.smgdigitaldev.com',
                  CQURL: 'http://mobile-dev.smgdigitaldev.com',
		  ADINDEX: "1",
		  COMSCOREID: "3005674",
		  COMSCORESITE: "http://mobile.smgdigitaldev.com"
              }
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
                  {expand: true, cwd: 'dist/', src: ['**', '!**/*.html'], action: 'upload'},
                  {expand: true, cwd: 'dist/', src: ['**/*.html'], action: 'upload', params: {CacheControl: 'max-age=300'}},
                  {dest: '**', cwd: 'backup/integration/', action: 'download'}
              ]
          },
          staging: {
              options: {
                  bucket: 'mobile-stage.smgdigitaldev.com',
                  differential: true // Only uploads the files that have changed
              },
              files: [
                  {expand: true, cwd: 'dist/', src: ['**', '!**/*.html'], action: 'upload'},
                  {expand: true, cwd: 'dist/', src: ['**/*.html'], action: 'upload', params: {CacheControl: 'max-age=300'}},
                  {dest: '**', cwd: 'backup/staging/', action: 'download'}
              ]
          },
          production: {
              options: {
                  bucket: 'mobile.thestar.com',
                  differential: true // Only uploads the files that have changed
              },
              files: [
                  {expand: true, cwd: 'dist/', src: ['**'], action: 'upload'},
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
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:local',
    'useminPrepare',
    'concurrent:dist',
    'processhtml:dist',
    'autoprefixer',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

  grunt.registerTask('build-int', [
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:integration',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:dist',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

   grunt.registerTask('build-stage', [
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:staging',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:dist',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

  grunt.registerTask('build-production', [
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:production',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:dist',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local'
  ]);

  grunt.registerTask('build-ios', [
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:ios',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:native',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local',
    'cordova-cli:ios'
  ]);

   grunt.registerTask('build-android', [
    'clean:dist',
    // First ngconstant task modifies app/config/config.js with values destined for the build.
    'ngconstant:android',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'processhtml:native',
    'concat',
    'copy:dist',
    'cdnify',
    'ngmin',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    // Second ngconstant task resets app/config/config.js with values appropriate for development environment.
    'ngconstant:local',
    'cordova-cli:android'
  ]);

  grunt.registerTask('default', [
    'jshint',
    'test',
    'build-int'
  ]);

  grunt.loadNpmTasks('grunt-ng-constant');
  grunt.loadNpmTasks('grunt-aws-s3');
  grunt.loadNpmTasks('grunt-bump');
  grunt.loadNpmTasks('grunt-processhtml');
  grunt.loadNpmTasks('grunt-cordova-cli');
};
