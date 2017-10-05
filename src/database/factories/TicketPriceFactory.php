<?php

use Faker\Generator as Faker;

$factory->define(App\TicketPrice::class, function (Faker $faker){
  return [
    'lineItemId' => $faker->numerify('#########'),
    'price' => $faker->randomFloat(2, 0, 500)
  ];
});
