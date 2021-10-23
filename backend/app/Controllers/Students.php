<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Student;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class Students extends BaseController
{
    public function index()
    {
        $model = new Student();

        return $this->getResponse(
            [
                'message' => 'Students retrieved successfully',
                'students' => $model->findAll()
            ]
        );
    }

    /**
    * Create a new Student
    */
   public function store()
   {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'date_of_birth' => 'required|valid_date',
            'class_id' => 'required|integer'
        ];
        $input = $this->getRequestInput($this->request);

        if(!$this->validateRequest($input, $rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
            );
        }

        $model = new Student();
        $model->save($input);

        return $this->getResponse(
            [
                'message' => 'Student added successfully',
                'class' => $model
            ]
        );
   }

    /**
    * Get a single class by CODE
    */
    public function show($id)
    {
        try {
            $model = new Student();
            $student = $model->findStudentById($id);
 
            return $this->getResponse(
                [
                    'message' => 'Student retrieved successfully',
                    'student' => $student
                ]
            );
        } catch (Exception $e) {
            return $this->getResponse(
                [
                    'message' => 'Could not find student for specified ID',
                    'error' => $e->getMessage()
                ],
                ResponseInterface::HTTP_NOT_FOUND
            );
        }
    }
    /**
    * Update a Student
    */
   public function update($id)
   {
       try {
            $model = new Student();
            $model->findStudentById($id);

            $input = $this->getRequestInput($this->request);
            $model->update($id, $input);
            $student = $model->findStudentById($id);

            return $this->getResponse(
                [
                    'message' => 'Student updated successfully',
                    'student' => $student
                ]
            );
       } catch (Exception $exception) {
           return $this->getResponse(
               [
                   'message' => $exception->getMessage()
               ],
               ResponseInterface::HTTP_NOT_FOUND
           );
       }
   }

   /**
    * Delete a Class
    */
    public function destroy($id)
    {
         try {
             $model = new Student();
             $student = $model->findStudentById($id);
             $model->delete($student);
 
             return $this
                 ->getResponse(
                     [
                         'message' => 'Student deleted successfully',
                     ]
                 );
         } catch (Exception $exception) {
             return $this->getResponse(
                 [
                     'message' => $exception->getMessage()
                 ],
                 ResponseInterface::HTTP_NOT_FOUND
             );
         }
    }
}
