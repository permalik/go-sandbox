#!/bin/bash

# Remove CSharp Source
rm -rf Calc/
rm -rf obj/
rm deps.json
rm flake.lock
rm result
rm Program.cs

echo 'using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Hello, World!");
    }
}' > Program.cs
