<?php

namespace App\Models;

use CodeIgniter\Model;
use Exception;

class Student extends Model
{
    protected $DBGroup              = 'default';
    protected $table                = 'students';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields        = 
        [
            "first_name",
            "last_name",
            "class_id",
            "date_of_birth"
        ];

    // Dates
    protected $useTimestamps        = false;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'created_at';
    protected $updatedField         = 'updated_at';
    protected $deletedField         = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    public function findStudentById($id)
    {   
        $student = $this
            ->select('s.*, c.name as class_name')
            ->from('students s')
            ->where(['s.id' => $id])
            ->join('classes c', 'c.id = s.class_id', 'left')
            ->asArray()->first();

        if (!$student) throw new Exception('Could not find student for specified ID');

        return $student;
    }
}
