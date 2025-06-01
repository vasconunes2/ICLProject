#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct String{
  long tag;
  long length;
  char* data;
};
void custom_cpy(struct String* dest, const struct String* src) {
  while ((*dest++ = *src++));
  *dest = '\0'; // Null-terminate the string
}
void custom_strcat(struct String* dest, const struct String* src) {
  if (!dest || !src) return; // Check for null pointers
  char* d = dest->data + dest->length; // Start at the end of dest
  const char* s = src->data; // Start at the beginning of src
  while (*s) {
    *d++ = *s++; // Copy each character
  }
  *d = '\0'; // Null-terminate the concatenated string
  dest->length += src->length; // Update the length of dest
}
struct String* str_append(struct String* str1, struct String* str2) {
  int new_length = str1->length + str2->length;
  struct String* result = malloc(sizeof(struct String));
  if (!result) return NULL;

  result->tag = 3;
  result->length = new_length;
  result->data = malloc(new_length + 1); // +1 for null terminator

  custom_cpy(result, str1);
  custom_strcat(result, str2);
  
  return result;
}
int main() {
  struct String str1 = {3, 8, "Hello, "};
  struct String str2 = {3, 6, "world!"};
  struct String* result = str_append(&str1, &str2);
  if (result) {
    printf("Result: %s\n", result->data);
    free(result->data);
    free(result);
  } else {
    printf("Memory allocation failed.\n");
  }
}