<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Classes as ClassModel;
use App\Models\Student;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class Classes extends BaseController
{
    /*
    * Get all Classes
    * @return Response
    */
   public function index()
   {
        $model = new ClassModel();

        return $this->getResponse(
            [
                'message' => 'Classes retrieved successfully',
                'classes' => $model->findAll()
            ]
        );
   }

   /**
    * Create a new Class
    */
   public function store()
   {
        $rules = [
            'name' => 'required',
            'code' => 'required|is_unique[classes.code]',
            'status' => 'required|in_list[opened, closed]',
            'maximum_students' => 'required|integer'
        ];
        $input = $this->getRequestInput($this->request);

        if(!$this->validateRequest($input, $rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
            );
        }

        $code = $input['code'];

        $model = new ClassModel();
        $model->save($input);
        $class = $model->where('code', $code)->first();

        return $this->getResponse(
            [
                'message' => 'Class added successfully',
                'class' => $class
            ]
        );
   }

   /**
    * Get a single class by CODE
    */
   public function show($id)
   {
       try {
           $model = new ClassModel();
           $studentModel = new Student();
           $class = $model->findClassById($id);
           $class['students'] = $studentModel->where(['class_id' => $class['id']])->findAll(); 

           return $this->getResponse(
               [
                   'message' => 'Class retrieved successfully',
                   'class' => $class
               ]
           );
       } catch (Exception $e) {
           return $this->getResponse(
               [
                   'message' => 'Could not find class for specified ID',
                   'error' => $e->getMessage()
               ],
               ResponseInterface::HTTP_NOT_FOUND
           );
       }
   }

   /**
    * Update a Class
    */
   public function update($id)
   {
       try {
            $model = new ClassModel();
            $model->findClassById($id);

            $input = $this->getRequestInput($this->request);
            $model->update($id, $input);
            $class = $model->findClassById($id);

            return $this->getResponse(
                [
                    'message' => 'Class updated successfully',
                    'client' => $class
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
            $model = new ClassModel();
            $client = $model->findClassById($id);
            $model->delete($client);

            return $this
                ->getResponse(
                    [
                        'message' => 'Class deleted successfully',
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
