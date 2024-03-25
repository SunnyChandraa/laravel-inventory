<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Devisi;

class DevisiController extends Controller
{
    public function index()
    {
        return view('devisi.index',[
            'devisis'   => Devisi::get()
        ]);
    }

    public function create()
    {
        return view('devisi.form-create');
    }
    
    public function store(Request $request)
    {
        $devisi = $request->validate([
            'nama_devisi'       => 'required|unique:devisis'
        ],[
            'nama_devisi.required'  => 'Wajib Diisi!!',
            'nama_devisi.unique'    => 'Nama Devisi Sudah Tersedia!!',
        ]);
        Devisi::create($devisi);
        session()->flash('success');
        return redirect('/devisi');
    }

    public function edit(Devisi $devisi)
    {
        return view('devisi.form-edit', compact('devisi'));
    }

    public function update(Request $request, Devisi $devisi)
    {
        $update = $request->validate([
            'nama_devisi'       => 'required|unique:devisis'
        ],[
            'nama_devisi.required'  => 'Wajib Diisi!!',
            'nama_devisi.unique'    => 'Nama Devisi Sudah Tersedia!!',
        ]);
        $devisi->update($update);
        session()->flash('success-update');
        return redirect('/devisi');
    }

    public function destroy(Devisi $devisi)
    {
        $devisi->delete();
        session()->flash('success-delete');
        return redirect('/devisi');
    }
}
