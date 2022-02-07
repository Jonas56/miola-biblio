## Switching Cheat Sheet

### STP (Spanning Tree Protocol)

```
Switch(config)# spanning-tree <VLANs> //Enable STP
Switch(config)# spanning-tree priority <priority> //Set Bridge priority
Switch(config)# spanning-tree vlan <vlan_id> root primary // Set to primary
Switch(config)# spanning-tree vlan <vlan_id> root secondary // Set to secondary
Switch(config-if)# spanning-tree cost <cost> //Set Port cost
Switch(config-if)# spanning-tree port-priority <priority> //Port priority
Switch(config-if)# spanning-tree guard root //Root Guard
Switch(config-if)# spanning-tree guard root //Root Guard
Switch# show spanning-tree [summary] //Verification
```

### VLAN

- Troubleshooting

```
Switch# show vlan
Switch# show interfaces FastEthernet0/2 switchport
Switch# show vlan id 2
Switch# show vlan brief
```

- Create a vlan

```
Switch# conf t
Switch(config)# vlan 2
Switch(config-vlan)# name Ensias
```

- Create Data vlan

```
Switch# conf t
Switch(config)# interface f 0/3
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 2
```

- Configure an 802.1q trunk

```
Switch# conf t
Switch(config)# interface f 0/0
Switch(config-if)# switchport mode trunk
```

### VTP Configuration

```
Switch(config)# vtp mode {server | client | transparent}
Switch(config)# vtp domain <name>
Switch(config)# vtp password <passsword>
Switch(config)# vtp version {1 | 2}
Switch(config)# vtp pruning
```

- Troubleshooting

```
Switch(config)# show vtp status
Switch(config)# show vtp password
```

### Inter-VLAN Routing

- Activate Interface

```
Router(config)#interface fastethernet 0/0
Router(config-if)#no shutdown
```

- Encapsulate frames

```
Router(config-if)#interface fastethernet 0/0.1
Router(config-subif)#encapsulation dot1q 1 //VLAN n°1
Router(config-subif)#ip address 192.168.1.1 255.255.255.0

Router(config-if)#interface fastethernet 0/0.2
Router(config-subif)#encapsulation dot1q 10 //VLAN n°10
Router(config-subif)#ip address 192.168.5.1 255.255.255.0
```

### NAT & PAT

- Static **NAT**

```
Router(config)#ip nat inside source static host@ out@

Router(config)#interface fastethernet 0/0
Router(config-if)#ip nat inside

Router(config)#interface F0/1
Router(config-if)#ip nat outside

```

- Dynamic **NAT**

```
Router(config)#access-list 1 permit 10.0.0.0 0.0.0.255
Router(config)#ip nat pool NATPOOL 2.0.0.1 2.0.0.100 netmask 255.255.255.0
Router(config)#ip nat inside source list 1 pool NATPOOL

Router(config)#interface F0/1
Router(config-if)#ip nat outside

Router(config-if)#interface F0/0
Router(config-if)#ip nat inside
```

- **NAT/PAT** | **NAT Overload**

```
Router(config)#access-list 1 permit 10.0.0.0 0.0.0.255
Router(config)#ip nat inside source list 1 interface F0/0 overload

Router(config)#interface F0/1
Router(config-if)#ip nat inside

Router(config-if)#interface F0/0
Router(config-if)#ip nat outside
```

- Verifying

```
Router# show ip nat translations
```

[NAT/PAT](https://www.adldata.org/wp-content/uploads/2015/06/Cisco_NAT_Cheat_Sheet.pdf)

### DHCP

```
Router(config)#ip dhcp excluded-address 10.0.10.1 10.0.10.10
Router(config)#ip dhcp pool POOL_NAME
Router(dhcp-config)#network 10.0.10.0 255.255.255.0
Router(dhcp-config)#default-router 10.0.10.1
```

[DHCP](https://ipwithease.com/wp-content/uploads/2020/05/DHCP-CHEATSHEET-pdf.pdf)

### PPP

- PAP authentication

```
Router(config)# username "second router name" password "password"
Router(config)# interface S0/0
Router(config-if)# encapsulation ppp
Router(config-if)# ppp authentication pap
Router(config-if)# ppp pap sent-username "first router number" password "password"
```

- CHAP authentication

```
Router(config)# username "second router name" password "password"
Router(config)# interface S0/0
Router(config-if)# encapsulation ppp
Router(config-if)# ppp authentication chap
```

### Access lists (ACL)

- Generic ACL commands

```
Router# show access-lists  // Displays all access lists and their parameters configured on the router
```

- Standard Access List

```
Router(config)# access-list 1-99 {permit|deny} address source_mask // Create the access list
Router(config)# interface S0/0
Router(config-if)# ip access-group {ACL_number} {in/out} // Applies an IP access list to an interface
```

- Extended Access List Syntax

```
Router(config)# access-list 100-199 {permit|deny} {ip|tcp|udp|icmp} source source-mask [lt|gt|eq|neq] [source-port] destination dest-mask [lt|gt|eq|neq] [dest-port] [log]
Router(config)# interface S0/0
Router(config-if)# ip access-group {ACL_number} {in/out} // Applies an IP access list to an interface
```

| Variable             | Definition                                                                                                                                                              |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| {100-199}            | Extended IP access lists are represented by a number ranging from 100-199                                                                                               |
| {permit\|deny}       | Specify the nature of the access list either a permit or deny statement                                                                                                 |
| {ip\|tcp\|udp\|icmp} | The IP protocol to be filtered can be IP (includes all protocols in the TCP/IP suite) TCP,UDP,ICMP,or others                                                            |
| source               | The IP address of the source                                                                                                                                            |
| source-mask          | A wildcard mask, or inverse mask, applied to determine which bits of source address are significant                                                                     |
| [lt\|gt\|eq\|neq]    | Can contain lt (less than), gt (greater than), eq (equal to), or neq (not equal to). It is used if an extended list filters by a specific port number or range of ports |
| [source-port]        | If necessary, the source port number of the protocol to be filtered                                                                                                     |
| destination          | The IP address of the destination                                                                                                                                       |
| dest-mask            | A wildcard mask, or inverse mask, applied to determine which bits of destination address are significant                                                                |
| [dest-port]          | If necessary, the destination port number of the protocol to be filtered                                                                                                |
| [log]                | Turns on logging of access list activity                                                                                                                                |
