# Intro

This project shows how a DSE deployment can be integrated
with OpenLDAP (running in docker) and get permissions from internal 
and LDAP configurations.

## Files

### Install docker

The files in "./docker/*" install OpenLDAP in docker on the node.  Do this on any DSE node.

### Install & Config LDAP

The file './ldapFiles/installLDAP.sh' get ldap utilities that will be useful in querying LDAP.  

If you can, install Apache Studio so that can create LDAP users and groups.  That is not part of this demo.

### Configure Cassandra

The YAML file './cassandraConfig/cassandra.yaml' changes load the authentication and authorization modules.

### Configure DSE

The YAML file in './dseConfig/dse.yaml' has changes to implement in your dse.yaml.

You need to configure 

- LDAP user that can read user and group records.
- Which user property in LDAP should be used to use to map to DSE role (could be user or group)
- Which group property in LDAP should be used to map to DSE role (could be user or group)

###  Verify connectivity

Please run this command from the node that runs DSE:

sudo docker exec ldap-service ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin

It should print out all users and groups. 

## Restart DSE
Now, restart DSE so that the changes take effect.


# Videos
This play list will have the videos take you quickly go through the use case, overview of what the 
systems should look like given the above setup, and then the enforcement of the policies -  