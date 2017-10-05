<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\TicketBarcode::class, function (Faker $faker) {
    return [
        'barcode' => implode('', [
            $faker->randomElement(['et', 'ets', 'MDR', 'MDC', 'okf']),
            $faker->bothify('###???#?####??#????###')
        ]),
        'lineItemId' => $faker->numerify('#########'),
    ];
});
