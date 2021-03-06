#include "hwlib.hpp"

template< int N >        
struct loop_unrolled{
   template< typename Body >
   loop_unrolled( const Body & body ){
      body();
      loop_unrolled< N - 1 > dummy( body );
   }      
};

template<>
struct loop_unrolled< 0 >{
   template< typename Body >
   loop_unrolled( const Body & body ){}      
};

int main( void ){	

   // wait for the PC console to start
   hwlib::wait_ms( 2000 );

   hwlib::cout << "loop demo\n\n";
   
   int n = 0;
   
   loop_unrolled< 10 >( [&]() __attribute__ ((always_inline)) {
      hwlib::cout << ++n << "\n";
   });
   
}