What changed:

    Function Definition: Created the get_distro() function so the script doesn't throw a "command not found" error. It checks for standard Linux release files or defaults to uname for macOS.
    Fixed case Syntax: Removed the erroneous case keyword from inside the patterns (e.g., case raspbian) is now just raspbian)).
    Converted to Lowercase: Added | tr '[:upper:]' '[:lower:]' to the case statement expression. uname on macOS outputs Darwin, which would previously be missed since your script checked for darwin.
    Default Catch-all: Added *) to handle cases where the OS doesn't match any of the specified distributions. 
