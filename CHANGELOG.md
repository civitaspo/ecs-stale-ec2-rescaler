0.1.0.pre (2019-05-09)
======================

**This release breaks backwards compatibility!!**

* Add new options.
    * `TERMINATE_STALE_EC2`
    * `ATTRIBUTES_FOR_STALE_EC2`
    * `ENTER_STANDBY_STALE_EC2`
    * `DETACH_STALE_EC2`
* Increase IAMs this image uses.
    * `ecs:ListContainerInstances`
    * `ecs:PutAttributes`
    * `autoscaling:EnterStandby`
    * `autoscaling:DetachInstances`
* Change the way to write codes.
    * Use double bracket(`[[]]`) for conditions.
    * Use `${var}` way instead of `$var` for variables in the context of arguments.
    * Change log massages and slack messages.

0.0.4 (2019-06-23)
==================

* Support ecs-agent 1.28.0 error message about `Duplicate task-eni attachment message`. (#9)

0.0.3 (2019-04-15)
==================

* Detect the 'Error response from daemon: conflict: unable to delete' error. (#5)

0.0.2 (2019-02-24)
==================

* Detect duplicate eni attachment message abnormality (#3)

0.0.1 (2018-12-31)
==================

* First Release
