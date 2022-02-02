## Switching Cheat Sheet

### STP (Spanning Tree Protocol)

```
Switch(config)# spanning-tree <VLANs> //Enable STP
Switch(config)# spanning-tree priority <priority> //Set Bridge priority
Switch(config-if)# spanning-tree cost <cost> //Set Port cost
Switch(config-if)# spanning-tree port-priority <priority> //Port priority
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
Router(config)#interface fastethernet 0/0
Router(config-if)#ip nat outside

Router(config)#interface F0/1
Router(config-if)#ip nat inside source static host@ 200.200.200.2
```

- Dynamic **NAT**

```
Router(config)#access-list 1 permit 10.0.0.0 0.0.0.255
Router(config)#ip nat pool NATPOOL 2.0.0.1 2.0.0.1 netmask 255.255.255.252
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
Router(config-if)#ip nat outside

Router(config-if)#interface F0/0
Router(config-if)#ip nat inside
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

### Access lists
