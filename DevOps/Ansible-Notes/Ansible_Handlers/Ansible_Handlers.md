# Ansible Handlers

An **Ansible Handler** is a special type of task within an Ansible playbook that is triggered by notifications from other tasks.

## Key Points
- **Notify**: Handlers are **triggered by notifications** from other tasks, rather than executing automatically.
- Handlers are invoked by other tasks that use the `notify` directive.

## Example

```yaml
---
- name: Example Playbook
  hosts: all
  tasks:
    - name: Modify a configuration file
      template:
        src: config.j2
        dest: /etc/myapp/config.conf
      notify: Restart MyApp

  handlers:
    - name: Restart MyApp
      service:
        name: myapp
        state: restarted