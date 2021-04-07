import javax.swing.*;

// gets user input (modified input.pde)
String prompt(String s)
{
  String entry = JOptionPane.showInputDialog(s);
  if (entry == null)
    return null;
  return entry;
}

String getString(String s)
{
  return prompt(s);
}

int getInt(String s)
{ 
  try { // added a try and catch error so that Strings and floats do not create an error
    return Integer.parseInt(getString(s));
  } 
  catch (NumberFormatException e) {
    return -987957997; // returns a random number isn't the answer 
    // (this number is impossible to be answer based on the restrictions set)
  }
}

long getLong(String s)
{
  return Long.parseLong(getString(s));
}

float getFloat(String s)
{
  return Float.parseFloat(getString(s));
}

double getDouble(String s)
{
  return Double.parseDouble(getString(s));
}

char getChar(String s)
{
  String entry = prompt(s);
  if (entry.length() >= 1)
    return entry.charAt(0);
  else
    return '\n';
}
