# cloudforms-customization-examples

**Create two VMs manually**

**Create a VM button1 that will:**

    Programmatically create a tag category  (if not already exist) called vm_role with the following values:
        master
        secondary
    Test: Click the button before next step

**Create a VM button2 that will:**

    Provide a dialog with a tag control element that will allow the user to tag the box as vm_role/master or vm_role/secondary.
    Do a smart state analysis of the VM after tagging is complete
    Create a custom attribute key value pair on the VM as Key=Scanned, Value=<current date> 

**Anti-Affinity:**

    Create a button that will make sure that a VM tagged with vm_role/master cannot run on the same host as a vm tagged with vm_role/secondary.
    Test