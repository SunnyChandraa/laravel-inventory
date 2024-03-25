<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Devisi;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class tambahUserController extends Controller
{
    public function index()
    {
        return view('tambahUser.index',[
            'users'     => User::get()
        ]);
    }

    public function create()
    {
        return view('tambahUser.form-tambah',[
            'devisis'    => Devisi::get() 
        ]);
    }

    public function store(Request $request)
    {
        $user = $request->validate([
            'name'          => 'required',
            'devisi_id'     => 'required',
            'email'         => 'required|unique:users',
            'password'      => 'required|min:8'
        ]);

        $user['password']   = hash::make($user['password']);

        User::create($user);
        session()->flash('success');
        return redirect('/tambahUser');
    }
}
