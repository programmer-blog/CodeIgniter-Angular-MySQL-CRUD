<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use Faker\Factory;

class StudentsSeeder extends Seeder
{
    public function run()
    {
        for ($i = 0; $i < 50; $i++) { //to add 10 clients. Change limit as desired
            $this->db->table('students')->insert($this->generateStudent());
        }
    }

    private function generateStudent(): array
    {
        $faker = Factory::create();

        return [
            'first_name' => $faker->firstName(),
            'last_name' => $faker->lastName(),
            'date_of_birth' => $faker->date('Y-m-d', '2018-01-01'),
            'class_id' => $faker->randomElement([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        ];
    }
}
