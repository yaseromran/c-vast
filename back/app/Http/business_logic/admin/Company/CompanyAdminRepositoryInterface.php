<?php


namespace App\Http\business_logic\admin\Company;


use Illuminate\Http\Request;

interface CompanyAdminRepositoryInterface
{
    public function all(Request $request);

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id);

    public function show($id);
}