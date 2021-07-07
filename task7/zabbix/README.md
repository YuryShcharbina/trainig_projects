## Working with Zabbix
### Install Zabbix agent
For installing agents created ansible role in folder *zabbix agent install*
###Custom dashboards
The first:
![](images/dashboard1.png) 
The second with map:
![](images/dashboard2.png)
### Fired triggers
![](images/triggers.png)

### Active and passive checks
Created *My_test_template* with two items with type *Zabbix agent(active)*:
![](images/active_1.png)
for checking port 5432

![](images/active_2.png)
for collecting software for inventory

In *Template DB PostgreSQL* created item with type *Zabbix agent*(passive mode):
![](images/passive.png)
for check *test_students* database size
### Non agent check
Added host with name *test* and template *	Template Module ICMP Ping*:
![](images/hosts.png)
and check with ICMP ping:
![](images/icmp_ping.png)
###Alert with maintenance instruction
In *My_test_template* creater trigger *test_port_check*
![](images/trigger.png)
with url with instruction and created  action *Report to me*
![](images/action_1.png)
![](images/action_2.png)
When action fired on dashboard we have the message with link to instruction
![](images/instruction.png)
if click link will open the document with necessary actions
![](images/google_doc.png)
