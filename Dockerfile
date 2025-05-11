FROM ghcr.io/pterodactyl/panel:latest

# Set the working directory
WORKDIR /app

# Copy local config files to the container
COPY . .

# Install dependencies
RUN composer install --no-dev --optimize-autoloader && php artisan key:generate && php artisan migrate --force && php artisan db:seed --force

# Expose the necessary ports
EXPOSE 80 443

# Start the web server
CMD ["php-fpm"]
