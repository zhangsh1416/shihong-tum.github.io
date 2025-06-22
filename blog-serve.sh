#!/bin/bash

# Blog management script
# Add gem binary path to PATH
export PATH="$PATH:/home/shihong/snap/code/194/.local/share/gem/ruby/3.0.0/bin"

case "$1" in
    "serve")
        echo "Starting Jekyll development server (local config)..."
        bundle exec jekyll serve --config _config_dev.yml --host=0.0.0.0 --port=4000
        ;;
    "build")
        echo "Building Jekyll site..."
        bundle exec jekyll build
        ;;
    "stop")
        echo "Stopping Jekyll server..."
        pkill -f jekyll
        ;;
    *)
        echo "Usage: $0 {serve|build|stop}"
        echo "  serve: Start development server (local config)"
        echo "  build: Build the site (production config)"
        echo "  stop:  Stop development server"
        exit 1
        ;;
esac