<?php

class ModelCheckoutCalc extends Model
{
    public function calculate($price)
    {
        if ((int)$price <= 500) {
            $price *= 2;
        } else {
            $price *= 3;
        }
        return $price;
    }
}