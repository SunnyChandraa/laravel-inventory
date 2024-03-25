<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Devisi extends Model
{
    use HasFactory;

    protected $fillable =[
        'nama_devisi'
    ];

    public function barangs()
    {
        return $this->hasMany(Barang::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }

}
