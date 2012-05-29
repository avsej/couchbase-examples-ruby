# Installing Libcouchbase (with Dependencies)

## Linux

If you are using Ubuntu 11.10+ run these commands:

    wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -
    echo deb http://packages.couchbase.com/preview/ubuntu oneiric oneiric/main | sudo tee /etc/apt/sources.list.d/couchbase.list
    sudo apt-get update
    sudo apt-get -y install libcouchbase-dev

If you are using Ubuntu 10.04 run these commands:

    wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -
    echo deb http://packages.couchbase.com/preview/ubuntu lucid lucid/main | sudo tee /etc/apt/sources.list.d/couchbase.list
    sudo apt-get update
    sudo apt-get -y install libcouchbase-dev

If you are using Centos 5.5 (or compatible RHEL), add these lines to
`/etc/yum.repos.d/couchbase.repo`:

For `i386`:

    [couchbase]
    name = Couchbase package repository
    baseurl = http://packages.couchbase.com/preview/rpm/5.5/i386

For `x86_64`:

    [couchbase]
    name = Couchbase package repository
    baseurl = http://packages.couchbase.com/preview/rpm/5.5/x86_64

After that you can install the libcouchbase:

    sudo yum update
    sudo yum install libcouchbase-devel

## MacOS

Ensure you have homebrew installed and up to date. The stable version
(currently 1.0.3) is already there and installable with `brew install
libcouchbase` but the latest ruby gem requires preview version, which is
published on couchbase fork. So to install it run:


    brew install https://raw.github.com/couchbase/homebrew/preview/Library/Formula/libcouchbase.rb

# The Hello World Script

Clone this repository and switch to `preview` branch:

    git clone git://github.com/avsej/couchbase-examples-ruby.git
    cd couchbase-examples-ruby
    git checkout preview

Ensure you have [gem bundler][1] installed and install script
dependencies:

    bundle install

If all is ok, you can run the script. I'm using `bundle exec` prefix to
make sure the script sees only gems from `Gemfile`:

    $ bundle exec ruby hello-world.rb
    There is no spoon.
    $ bundle exec ruby hello-world.rb
    Hello World!

Here you can see that first attempt to find the key "spoon" wasn't
successful, but the script catches the exception and set the key with
value and timeout 10 seconds, so that it is become visible from the
second attempt.

[1]: http://gembundler.com
