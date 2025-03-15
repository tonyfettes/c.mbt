# tonyfettes/c

FFI Binding to C.

## Usage

1. Add this library using `moon add`:

   ```bash
   moon add tonyfettes/c
   ```

2. Import the library in your `moon.pkg.json`:

   ```json
   {
     "import": [
       "tonyfettes/c"
     ]
   }
   ```

3. Insert the following code somewhere in your MoonBit code:

   ```moonbit
   fn init {
     ignore(@c.moonbit_ffi_make_closure)
   }
   ```

   This prevents the closure help function from being eliminated by the MoonBit
   compiler.

4. Use the library in your code.
