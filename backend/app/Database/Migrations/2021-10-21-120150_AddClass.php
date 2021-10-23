<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddClass extends Migration
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
            'code' => [
                'type' => 'VARCHAR',
                'constraint' => '50',
                'null' => false
            ],
            'status' => [
                'type' => 'ENUM("opened","closed")',
                'default' => 'opened',
                'null' => false
            ],
            'name' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false,
                'unique' => true
            ],
            'maximum_students' => [
                'type' => 'TINYINT',
                'constraint' => 2,
                'null' => false
            ],
            'description' => [
                'type' => 'TEXT',
                'null' => true,            
            ],
            'created_date datetime default current_timestamp',
            'updated_date datetime default current_timestamp on update current_timestamp', 
        ]);
        $this->forge->addPrimaryKey('id');
        $this->forge->createTable('classes');
    }

    public function down()
    {
        $this->forge->dropTable('classes');
    }
}
