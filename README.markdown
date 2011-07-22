## Bind

Objective-C has two powerful mechanisms, 'Key Value Observing' and 'Key Value Coding'. KVO enables a developer to be notified when a specific property of an object changes. KVC enabled a developer to set a specific property of an object. 'Bind' allows a developer to easily bind a view to a model using KVO and KVC. Further, 'Bind' allows a developer to introduce both a Transform block and Validation block.

'BindingManager' is used to keep track of ObserverLinks. In the future 'BindingManager' will be used to also remove 'Bind'.