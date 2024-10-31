
# Ansible Error Handling

This document explains various error-handling techniques in Ansible.

## 1. `ignore_errors`
Allows you to ignore the failure of a task and continue with the execution of the rest of the playbook.

### Example:
```yaml
- name: A task that might fail but won't stop execution
  command: /bin/false
  ignore_errors: yes
```

## 2. `ignore_errors` with `register`
You can combine `ignore_errors` with `register` to capture the result of a task and then decide what to do next based on whether it failed.

### Example:
```yaml
- name: Run a task that might fail
  command: /bin/false
  ignore_errors: yes
  register: result

- name: Print message based on failure
  debug:
    msg: "The task failed, but we ignored the error."
  when: result.failed
```

## 3. `any_errors_fatal`
This option forces the playbook to stop if any error occurs. It can be used at two levels:

### 3.1 At the Playbook Level
It applies to all tasks and hosts.

#### Example:
```yaml
- hosts: all
  any_errors_fatal: yes
  tasks:
    - name: A task that might fail
      command: /bin/false
```

### 3.2 At the Task Level
It applies to individual tasks or groups of tasks.

#### Example:
```yaml
- hosts: all
  tasks:
    - name: Critical task that must not fail
      command: /bin/false
      any_errors_fatal: yes

    - name: Another task that runs only if the previous one succeeded
      command: echo "This will not run if the critical task fails"
```

## 4. `failed_when`
Allows you to define custom conditions to mark a task as failed.

### 4.1 Fail When a Condition on Return Code is Met
#### Example:
```yaml
- name: Run a command and capture the result
  command: /bin/false
  register: result
  failed_when: result.rc == 0  # Task will fail if the return code is 0
```

### 4.2 Fail When Output Contains a Specific String
#### Example:
```yaml
- name: Run a command and fail if output contains "Error"
  command: some_command
  register: result
  failed_when: "'Error' in result.stdout"
```

## 5. `changed_when`
This directive allows you to control when a task is marked as changed.

### Example:
```yaml
- name: Mark a task as changed only if output contains 'updated'
  command: some_command
  register: result
  changed_when: "'updated' in result.stdout"
```
