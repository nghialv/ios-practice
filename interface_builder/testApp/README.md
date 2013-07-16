## Autolayout Practice 

Based on the following WWDC session reference 

* #406  Taking Control of Auto Layout in Xcode 5 


### Notes

* initial layout -- add constraints -- debug & deploy -- Maintain
* Xocde 5 by default will add fixed position and size constraints
* Intrinsice content size drives the width/height of a component 
    * use placeholder intrinsic content size for custom view

* Readable and diffable XIBs 

### Interface Builder Tricks

* ctrl-drag from a component to component to add constraints. ctrl-drag to self to add height/width constaints etc. 
    * while menu popup, hold cmd to add multiple constraints at once 
* on selected a component, opt- move mouse will show the spacing values.  use keyboard to move the component for fine tuning
* select a constraing and hit DELETE
* ctrl-drag between scenes to add actions 
* Use [Resolve Auto Layout Constraint] button to let xcode add the constraint 
* Use [Pin] button to add some fixed constraint.  Multiple select components and use pin to batch add constraint 
* select multiple constraint lable from the left panel and edit theiro value from the right inspector panel 
* double click on a constraint to edit its content
* opt-click on the preview to open preview in assistant editor 
* opt-shift-click to open assistant explorer
* shift-right click or shift-ctrl click to bring up menu to fine grain select of a sub view 

### A list of major constraints 
* width / height
* leading/trailing/top/bottom space to container view
* alignment constraints   left/right/top/bottom/baseline
* vertical / horizontal spacing



### Intermediate Constraint State 
* ambiguous frames  - not enought information
* conflicting constraints - too much info
* misplaced views - mismatch position or size 
    * size and other info in the IB not matching the actual size/ info at run time
    * happens when you resized the components in the IB but without updating the constraint values 
    * to resolve it, use [Resolve Auto Layout Constraint] [Update Constraints] to re-sync with the IB 
    * [Update Frames] will update the IB component's visual according to the constraints
    







