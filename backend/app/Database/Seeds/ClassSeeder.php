<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use Faker\Factory;

class ClassSeeder extends Seeder
{
    public function run()
    {
        for ($i = 0; $i < 10; $i++) { //to add 10 clients. Change limit as desired
            $this->db->table('classes')->insert($this->generateClass($i+1));
        }
    }

    private function generateClass($key): array
    {
        $faker = Factory::create();
        return [
            'name' => 'CLASS '.$key,
            'code' => 'class-'.$key,
            'status' => $faker->randomElement(['opened','closed']),
            'maximum_students' =>  random_int(5, 10),
            'description' => $faker->text()
        ];
    }
}
