<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangKeluar extends Model
{
    use HasFactory;


    protected $fillable = [
        'barang_id',
        'user_id',
        'devisi_id',
        'qty'
    ];

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function devisi()
    {
        return $this->belongsTo(Devisi::class);
    }
}
