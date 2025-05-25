#include <stdio.h>
#include <stdbool.h>
bool a(int a, int b){
  if(a < b)
  return a<b;
else{
  return a > b;
}
}
int main(){
  a(1,2);
  a(2,3);
  return 0;
}