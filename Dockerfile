# Use a Ruby base image with the desired version
FROM ruby:3.1.2

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libsqlite3-dev \
    sqlite3

# Install Rails
RUN gem install rails -v '6.1.4'

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the application code to the container
COPY . .

# Expose a port for the Rails application to run on
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "localhost"]
