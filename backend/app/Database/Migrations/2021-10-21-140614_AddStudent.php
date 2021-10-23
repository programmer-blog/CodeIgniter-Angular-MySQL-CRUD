<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddStudent extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'first_name' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false
            ],
            'last_name' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false
            ],
            'date_of_birth' => [
                'type' => 'date',
                'null' => false
            ],
            'class_id' => [
                'type' => 'INT',
                'constraint' => '11',
                'unsigned' => TRUE
            ],
            'created_at datetime default current_timestamp',
            'updated_at datetime default current_timestamp on update current_timestamp', 
        ]);
        
        $this->forge->addPrimaryKey('id');
        $this->forge->addForeignKey('class_id', 'classes', 'id','CASCADE','CASCADE');
        $this->forge->createTable('students');
    }

    public function down()
    {
        $this->forge->dropTable('students');
    }
}
