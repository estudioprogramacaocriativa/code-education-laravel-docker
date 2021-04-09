#!/bin/bash
 
#On error no such file entrypoint.sh, execute in terminal - dos2unix .docker\entrypoint.sh
chown -R www-data:www-data .
composer install
php artisan key:generate
php artisan migrate
composer require livewire/livewire laravel-frontend-presets/tall
php artisan ui tall --auth
npm install
npm run dev
 
php-fpm